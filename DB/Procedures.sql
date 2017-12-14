USE IWork

GO

/*As an registered/unregistered user, I should be able to ...*/

--#1
--Search for company by name
CREATE PROC CompaniesByName
      @name VARCHAR(50)
AS
      SELECT *
      FROM Companies
      WHERE name = @name

GO

--Search for Company by Address
CREATE PROC CompaniesByAddress
      @address VARCHAR(100)
AS
      SELECT *
      FROM Companies
      WHERE address = @address

GO

--Search for Company by Type
CREATE PROC CompaniesByType
      @type VARCHAR(50)
AS
      SELECT *
      FROM Companies
      WHERE type = @type

GO

--#2
--All Available Companies on the System
CREATE PROC AllCompanies
AS
      SELECT *
      FROM Companies

GO

--#3
--View Company Information along with it's Departments
CREATE PROC CompanyWithDepartments
      @name VARCHAR(50)
AS
      SELECT *
      FROM Companies c , Departments d
      WHERE @name = c.name AND c.name = d.company_name AND c.address = d.company_address

GO

--#4
--View Certain Department in Certain Company with it's Job Vacancies
CREATE PROC DepartmentVacancies
      @company VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10)
AS
      SELECT *
      FROM Departments d , Jobs_Available jb
      WHERE d.code = @department_code AND d.company_name = @company 
      AND d.code = jb.department_code AND jb.vacancies > 0
      AND d.company_address = @company_address
      AND d.company_name = jb.company_name
      AND d.company_address = jb.company_address

GO

--#5
--REGISTER USER IN WEBSITE
CREATE PROC REGISTER
      @username VARCHAR(50),
      @password VARCHAR(50),
      @experience INT,
      @email VARCHAR(64),
      @first_name VARCHAR(50),
      @middle_name VARCHAR(50),
      @last_name VARCHAR(50),
      @birth_date DATETIME
AS
      INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
      VALUES (@username, @password, @experience, @email, @birth_date, @first_name, @middle_name, @last_name)

      INSERT INTO Job_Seekers VALUES(@username)

GO

--#6
--SEARCH FOR JOBS WITH VACANCIES USING KEYWORDS
CREATE PROC SearchForJobs
      @keyword VARCHAR(50)
AS
      SELECT jb.* , d.name
      FROM Jobs_Available jb, Departments d
      WHERE jb.department_code = d.code
      AND jb.vacancies > 0
      AND (jb.short_description LIKE '%' + @keyword + '%'
      OR jb.title LIKE '%' + @keyword + '%')

GO

--#7
--VIEW COMPANIES IN ORDER OF THE HIGHEST AVERAGE SALARIES
CREATE PROC Companies_with_Highest_Avg_Salaries
AS
      SELECT c.* , AVG(sm.salary) AS 'Average Salary'
      FROM Companies c , Staff_Members sm
      WHERE c.name = sm.company_name
      AND c.address = sm.company_address
      GROUP BY c.name , c.address, c.domain_name, c.vision, c.email, c.field, c.type
      ORDER BY AVG(sm.salary) DESC
      
GO

/*As a registered user, I should be able to ...*/

--FUNCTION TO CHECK FOR USER EXISTENCE
CREATE FUNCTION Check_User_Credentials
(@username VARCHAR(50) , @password VARCHAR(50))
RETURNS BIT
AS
BEGIN
      DECLARE @exist BIT
      IF (EXISTS(SELECT username , password FROM Users WHERE username = @username AND password = @password))
      BEGIN
            SET @exist = 1
      END
      ELSE -- WRONG CREDENTIALS
      BEGIN
            SET @exist = 0
      END
      RETURN @exist
END
GO

--FUNCTION TO CHECK USER ROLE
CREATE FUNCTION Check_User_Role
(@username VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
      DECLARE @role VARCHAR(50)

      IF (EXISTS(SELECT username FROM Job_Seekers WHERE username = @username) AND NOT EXISTS(SELECT username FROM Staff_Members WHERE username = @username)) -- CHECK IF JOBSEEKER AND NOT STAFF MEMBER
      BEGIN
            SET @role = 'JobSeeker'
      END
      ELSE IF (EXISTS(SELECT username FROM HR_Employees WHERE username = @username)) -- CHECK IF HR
      BEGIN
            SET @role = 'HR'
      END
      ELSE IF (EXISTS(SELECT username FROM Regular_Employees WHERE username = @username)) -- CHECK IF REGULAR EMPLOYEE
      BEGIN
            SET @role = 'RegularEmployee'
      END
      ELSE IF (EXISTS(SELECT username FROM Managers WHERE username = @username)) -- CHECK IF MANAGER
      BEGIN
            SET @role = 'Manager'
      END
      ELSE -- NORMAL USER
      BEGIN
            SET @role =  'User'
      END

      RETURN @role
END
GO

--#1
--LOGIN TO THE WEBSITE
CREATE PROC LOG_IN
      @username VARCHAR(50),
      @password VARCHAR(50),
      @role VARCHAR(50) OUTPUT
AS      
      IF (dbo.Check_User_Credentials(@username , @password) = 1) -- CHECK IF USER EXISTS
      BEGIN
            PRINT 'Logged in successfully'
            SELECT @role = dbo.Check_User_Role(@username) -- SAVE AND RETURN USER ROLE
            PRINT @role
      END

      ELSE -- WRONG CREDENTIALS
      BEGIN
            PRINT 'Incorrect Username or Password!'
      END

GO

--#2
--VIEW ALL POSSIBLE INFO FOR USER
CREATE PROC ViewUserInfo
      @username VARCHAR(50)
AS
      IF -- CHECK IF USER IS NOT STAFF MEMBER
      (
            EXISTS(SELECT username FROM Job_Seekers WHERE username = @username) 
            AND NOT EXISTS(SELECT username FROM Staff_Members WHERE username = @username)
      ) 
      BEGIN
            SELECT * FROM Users WHERE username = @username
      END

      ELSE -- IF STAFF MEMBER
      BEGIN
            SELECT U.* , S.* FROM Users U INNER JOIN Staff_Members S ON S.username = U.username AND U.username = @username
      END
GO

--#3
--EDIT ALL THE USER INFO
CREATE PROC EditUserInfo
      @username VARCHAR(50),
      @password VARCHAR(50),
      @experience_years INT,
      @first_name VARCHAR(50),
      @middle_name VARCHAR(50),
      @last_name VARCHAR(50)
AS
      UPDATE Users
      SET
      password         = @password,
      experience_years = @experience_years,
      first_name       = @first_name,
      middle_name      = @middle_name,
      last_name        = @last_name
      WHERE username   = @username
GO
/*As a job seeker, I should be able to ...*/

--FUNCTION TO CHECK IF JOB SEEKER APPLIED FOR A CERTAIN JOB
CREATE FUNCTION Applied_Before
(@username VARCHAR(50), 
@job_title VARCHAR(50), 
@company_name VARCHAR(50), 
@company_address VARCHAR(100), 
@department_code VARCHAR(10))
RETURNS BIT
AS
BEGIN
      DECLARE @applied BIT
      IF 
      (
            EXISTS(SELECT job_seeker_username FROM Job_Applications 
            WHERE job_seeker_username = @username 
            AND job_title             = @job_title 
            AND company_name          = @company_name 
            AND company_address       = @company_address 
            AND department_code       = @department_code
            AND status                = 'Pending')
      )
      BEGIN
            SET @applied = 1
      END

      ELSE
      BEGIN
            SET @applied = 0
      END

      RETURN @applied
END
GO

--#1
--JOBSEEKER APPLIES FOR A JOB
CREATE PROC ApplyForJob
      @username VARCHAR(50),
      @job_title VARCHAR(50),
      @company_name VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10)
AS
      --JOB AVAILABLE 
      DECLARE @desiredJobExYears INT
      SELECT @desiredJobExYears = 
      experience_years FROM Jobs_Available 
      WHERE title = @job_title 
      AND company_name = @company_name 
      AND company_address = @company_address 
      AND department_code = @department_code

      PRINT @desiredJobExYears

      if (dbo.Applied_Before(@username, @job_title, @company_name, @company_address, @department_code) = 0) --IF DID NOT APPLY BEFORE
      BEGIN
            if (EXISTS(SELECT experience_years FROM Users WHERE username = @username AND experience_years >= @desiredJobExYears))
            BEGIN
                  INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, status)
                  VALUES (@username, @job_title, @company_name, @company_address, @department_code, 'Pending')
                  PRINT 'Thanks for applying!'
            END

            ELSE
            BEGIN
                  PRINT 'Your experience years does not match this job'
            END
      END

      ELSE
      BEGIN
            PRINT 'You already applied for this job!'
      END
GO

--#2
--VIEW INTERVIEW QUESTIONS FOR A CERTAIN JOB
CREATE PROC ViewInterviewQuestions
      @username VARCHAR(50),
      @job_title VARCHAR(50),
      @company_name VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10)
AS
      if (dbo.Applied_Before(@username, @job_title, @company_name, @company_address, @department_code) = 1)
      BEGIN
            SELECT * FROM Interview_Questions 
            WHERE title         = @job_title 
            AND company_name    = @company_name 
            AND company_address = @company_address 
            AND department_code = @department_code
      END

      ELSE
      BEGIN
            PRINT 'You are not allowed to view this interview questions, please apply to the job first!'
      END
GO

--#3
--SAVE THE SCORE OF JOB SEEKER WHEN APPLYING FOR THE JOB
CREATE PROC SaveScore
      @username VARCHAR(50),
      @job_title VARCHAR(50),
      @company_name VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10)
AS
      DECLARE @score INT
      if (dbo.Applied_Before(@username, @job_title, @company_name, @company_address, @department_code) = 1)
      BEGIN
            SELECT @score = COUNT(*) 
            FROM Job_Seeker_Interview_Answers jsia ,  Interview_Questions iq
            WHERE jsia.job_seeker = @username
            AND jsia.id = iq.id
            AND jsia.answer = iq.answer

            PRINT @score

            UPDATE Job_Applications
            SET 
            score                       = @score
            WHERE job_seeker_username   = @username
            AND company_name            = @company_name
            AND company_address         = @company_address
            AND department_code         = @department_code
      END
GO

--#4
--VIEW STATUS OF ALL JOBS THAT JOB SEEKER APPLIED TO AND THE SCORE OF THE INTERVIEW
CREATE PROC ViewAppliedJobsStatusAndScore
      @username VARCHAR(50)
AS
      SELECT jb.status , jb.score FROM Job_Applications jb WHERE jb.job_seeker_username = @username

GO

--#5
--USER CHOOSE AN ACCEPTED JOB APPLICATION TO BECOME A STAFF MEMBER
CREATE PROC UserAcceptsAnOffer
      @username VARCHAR(50),
      @job_title VARCHAR(50),
      @company_name VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10),
      @day_off VARCHAR(10)
AS
      IF 
      (
            EXISTS(SELECT * FROM Job_Applications 
            WHERE job_seeker_username = @username 
            AND job_title             = @job_title 
            AND company_name          = @company_name 
            AND company_address       = @company_address 
            AND department_code       = @department_code
            AND status                = 'Accepted')
      )
      BEGIN
            --UPDATE VACANCIES FOR THE CHOSEN JOB

            UPDATE Jobs_Available
            SET 
            vacancies           = vacancies - 1
            WHERE title         = @job_title
            AND company_name    = @company_name
            AND company_address = @company_address
            AND department_code = @department_code

            --ADD THE USER TO BE A STAFF MEMBER IN THE COMPANY HE CHOSEN

            DECLARE @salary DECIMAL(10,2)
            DECLARE @staff_company_email VARCHAR(64)
            DECLARE @role VARCHAR(50)

            SELECT @salary = 
            salary FROM Jobs_Available 
            WHERE title         = @job_title 
            AND company_name    = @company_name 
            AND company_address = @company_address 
            AND department_code = @department_code

            SET @staff_company_email = @username + '@' + LOWER(@company_name) + '.com'

            IF (@day_off != 'Friday')
            BEGIN
                  INSERT INTO Staff_Members (username, salary, annual_leaves, day_off, staff_company_email, job_title, company_name, company_address, department_code)
                  VALUES (@username, @salary, 30, @day_off, @staff_company_email, @job_title, @company_name, @company_address, @department_code)

                  SET @role = LEFT(@job_title, CHARINDEX('-', @job_title)-1)
                  PRINT @role

                  IF (@role = 'Manager')
                  BEGIN
                        INSERT INTO Managers (username) VALUES (@username)
                  END
                  ELSE IF (@role = 'HR')
                  BEGIN
                        INSERT INTO HR_Employees (username) VALUES (@username)
                  END
                  ELSE IF (@role = 'Regular Employee')
                  BEGIN
                        INSERT INTO Regular_Employees (username) VALUES (@username)
                  END
            END

            ELSE
            BEGIN
                  PRINT 'Failed to continue, Please choose day_off other than Friday'
            END
                        

      END

      ELSE
      BEGIN
            PRINT 'You can not accept the job yet. We are still reviewing you application'
      END
      
GO

--#6
--DELETE JOB APPLICATION IF STILL PENDING
CREATE PROC DeleteJobApplication
      @username VARCHAR(50),
      @job_title VARCHAR(50),
      @company_name VARCHAR(50),
      @company_address VARCHAR(100),
      @department_code VARCHAR(10)
AS
      DELETE FROM Job_Applications
      WHERE job_seeker_username = @username
      AND job_title             = @job_title
      AND company_name          = @company_name
      AND company_address       = @company_address
      AND department_code       = @department_code
      AND status                = 'Pending'

GO

/*“As a staff member, I should be able to ...”*/

--FUNCTION TO RETURN EMPLOYEE DAY OFF
CREATE FUNCTION DayOff(@username VARCHAR(50))
       RETURNS INT
AS
BEGIN
       DECLARE @day INT
       DECLARE @dayoff VARCHAR(50)
       SELECT  @dayoff = day_off
       FROM    Staff_Members
       WHERE   username = @username
       
       IF(@dayoff = 'sunday')
         SET @day = 1
       ELSE IF(@dayoff = 'monday')
         SET @day = 2
       ELSE IF(@dayoff = 'tuesday')
         SET @day = 3
       ELSE IF(@dayoff = 'wednesday')
         SET @day = 4
       ELSE IF(@dayoff = 'thursday')
         SET @day = 5
       ELSE IF(@dayoff = 'friday')
         SET @day = 6
       ELSE
         SET @day = 7

       RETURN @day
END

GO

--FUNCTION CALCULATES MISSING HOURS
CREATE FUNCTION GetMissingHours(@working_hours INT , @start_time TIME, @end_time TIME)
       RETURNS INT
AS
BEGIN
       DECLARE @missing INT
       SET @missing = @working_hours - DATEDIFF(HH, @start_time, @end_time)
       IF(@missing < 0)
         SET @missing = 0;
       
       RETURN @missing
END

GO

--FUNCTION TO CHECK IF USER IS HR
CREATE FUNCTION HR(@username VARCHAR(50))
       RETURNS BIT
AS 
BEGIN
       DECLARE @isHR BIT
       IF(EXISTS(SELECT *  FROM HR_Employees WHERE username = @username))
         SET @isHR = 1
       ELSE
         SET @isHR = 0
       
       RETURN @isHR
END
GO

--FUNCTION TO CHECK THAT USER IS MANAGER
CREATE FUNCTION Manager(@username VARCHAR(50))
       RETURNS BIT
AS  
BEGIN
       DECLARE @isManager BIT
       IF(EXISTS(SELECT *  FROM Managers WHERE username = @username))
         SET @isManager = 1
       ELSE
         SET @isManager = 0
       
       RETURN @isManager
END
GO

--FUNCTION GET STAFF MEMBER TYPE
CREATE FUNCTION StaffMemberType(@username VARCHAR(50))
       RETURNS VARCHAR(50)
AS
BEGIN
       DECLARE @role VARCHAR(50)
       IF(dbo.HR(@username) = 1)
         SET @role = 'HR Employee'
       ELSE IF(dbo.Manager(@username) = 1)
         SET @role = 'Manager'
       ELSE
         SET @role = 'Regular Employee'
       
       RETURN @role
END

GO

--FUNCTION THAT CHECKS IF EMPLOYEE HAS ANNUAL LEAVES LEFT
CREATE FUNCTION HasAnnualLeaves(@username VARCHAR(50), @role VARCHAR(50), @start_date DATE, @end_date DATE)
       RETURNS BIT
AS
BEGIN 
       DECLARE @totaldays INT --COUNT REQUEST DURATION
       DECLARE @annualLeavesTaken INT 
       DECLARE @employeeAnnualLeaves INT --THE ANNUAL LEAVES OF EMPLOYEE
       DECLARE @hasAnnualLeaves BIT       
       SET @totaldays = DATEDIFF(DAY , @start_date ,@end_date)
       IF(@role = 'HR Employee')
       BEGIN

          SELECT @annualLeavesTaken = SUM(DATEDIFF(DAY , R.start_date ,R.end_date)),
                 @employeeAnnualLeaves = S.annual_leaves
          FROM HR_Replacements H , Requests R, Staff_Members S, Leave_Requests L
          WHERE H.code = R.code AND H.hr_username = @username
                AND S.username = @username
                AND L.code = R.code
          GROUP BY S.annual_leaves

          IF(@annualLeavesTaken + @totaldays > @employeeAnnualLeaves)
            SET @hasAnnualLeaves = 0
          ELSE
            SET @hasAnnualLeaves = 1

       END
       ELSE IF(@role = 'Manager')
       BEGIN

          SELECT @annualLeavesTaken = SUM(DATEDIFF(DAY , R.start_date ,R.end_date)),
                 @employeeAnnualLeaves = S.annual_leaves
          FROM Manager_Replacements M , Requests R, Staff_Members S, Leave_Requests L
          WHERE M.code = R.code AND M.manager_username = @username
                AND S.username = @username
                AND L.code = R.code
          GROUP BY S.annual_leaves

          IF(@annualLeavesTaken + @totaldays > @employeeAnnualLeaves)
            SET @hasAnnualLeaves = 0
          ELSE
            SET @hasAnnualLeaves = 1

       END
       ELSE
       BEGIN

          SELECT @annualLeavesTaken = SUM(DATEDIFF(DAY , R.start_date ,R.end_date)),
                 @employeeAnnualLeaves = S.annual_leaves
          FROM Regular_Employee_Replacements Re , Requests R, Staff_Members S, Leave_Requests L
          WHERE Re.code = R.code AND Re.regular_employee_username = @username
                AND S.username = @username
                AND L.code = R.code
          GROUP BY S.annual_leaves

          
          IF(@annualLeavesTaken + @totaldays > @employeeAnnualLeaves)
            SET @hasAnnualLeaves = 0
          ELSE
            SET @hasAnnualLeaves = 1

       END

       RETURN @hasAnnualLeaves
END

GO


--FUNCTION TO CHECK IF STAFF MEMBER HAS CLASH BETWEEN TWO REQUESTS
CREATE FUNCTION HasClash(@username VARCHAR(50), @role VARCHAR(50), @start_date DATE, @end_date DATE)
       RETURNS BIT
AS
BEGIN
       DECLARE @hasClash BIT
       IF(@role = 'HR Employee')
       BEGIN
            IF(EXISTS(
               SELECT *
               FROM Requests R, HR_Replacements H
               WHERE R.code = H.code
                     AND H.hr_username = @username                      
                     AND (R.manager_decision <> 'Rejected' 
                     AND  R.hr_decision <> 'Rejected') AND(
                     @start_date BETWEEN R.start_date AND R.end_date
                     OR @end_date BETWEEN R.start_date AND R.end_date)
            ))
               SET @hasClash = 1
            ELSE
               SET @hasClash = 0
       END
       ELSE IF(@role = 'Manager')
       BEGIN
            IF(EXISTS(
               SELECT *
               FROM Requests R, Manager_Replacements M
               WHERE R.code = M.code 
                     AND M.manager_username = @username
                     AND (R.manager_decision <> 'Rejected' 
                     AND  R.hr_decision <> 'Rejected')
                     AND(
                     @start_date BETWEEN start_date AND end_date
                     OR @end_date BETWEEN start_date AND end_date)
            ))
               SET @hasClash = 1
            ELSE
               SET @hasClash = 0
       END
       ELSE
       BEGIN
            IF(EXISTS(
               SELECT *
               FROM Requests R, Regular_Employee_Replacements Re
               WHERE R.code = Re.code 
                     AND Re.regular_employee_username = @username 
                     AND (R.manager_decision <> 'Rejected' 
                     AND  R.hr_decision <> 'Rejected') AND(
                     @start_date BETWEEN start_date AND end_date
                     OR @end_date BETWEEN start_date AND end_date)
            ))
               SET @hasClash = 1
            ELSE
               SET @hasClash = 0
       END

       RETURN @hasClash 
END

GO

--CHECKS IF USER HAVE REQUESTS IN SAME TIME OR HAS ENOUGH ANNUAL LEAVES
CREATE FUNCTION HasRequests(@username VARCHAR(50), @role VARCHAR(50), @start_date DATE, @end_date DATE)
       RETURNS BIT
AS
BEGIN
      DECLARE @hasRequests BIT
      IF(dbo.HasAnnualLeaves(@username, @role, @start_date, @end_date) = 1)
      BEGIN
         IF(dbo.HasClash(@username, @role, @start_date, @end_date) = 1)
           SET @hasRequests = 1
         ELSE 
           SET @hasRequests = 0
      END
      ELSE
         SET @hasRequests = 1

      RETURN @hasRequests
END

GO

--CHECKS IF EMPLOYEES ARE IN SAME COMPANY AND DEPARTMENT
CREATE FUNCTION SameCompDep(@username VARCHAR(50), @replacement_username VARCHAR(50))
       RETURNS BIT
AS
BEGIN
       DECLARE @same BIT
       IF(EXISTS(
           SELECT *
           FROM Staff_Members S1, Staff_Members S2
           WHERE S1.username <> S2.username 
                 AND S1.department_code = S2.department_code
                 AND S1.company_name = S2.company_name
                 AND S1.company_address = S2.company_address
                 AND S1.username = @username
                 AND S2.username = @replacement_username
       ))
          SET @same = 1
        ELSE
          SET @same = 0
        
        RETURN @same
END

GO

--FUNCTION TO GET REQUEST TYPE (BUSINESS OR LEAVE)
CREATE FUNCTION RequestType(@code INT)
       RETURNS VARCHAR(50)
AS
BEGIN
       DECLARE @type VARCHAR(50)
       IF(EXISTS(
           SELECT *
           FROM Business_Requests
           WHERE code = @code
       ))
         SET @type = 'Business'
       ELSE
         SET @type = 'Leave'
        
       RETURN @type
END

GO

--#1
--Check in 
CREATE PROC CheckIn
       @username VARCHAR(50)
AS
    IF(DATEPART(DW,CURRENT_TIMESTAMP) != 6 AND DATEPART(DW,CURRENT_TIMESTAMP) != dbo.DayOff(@username))
    BEGIN
       INSERT INTO Attendance(username, date, start_time)
       VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)),CURRENT_TIMESTAMP)
    END
GO

--#2
--Check out
CREATE PROC CheckOut
       @username VARCHAR(50)
AS
    IF(DATEPART(DW,CURRENT_TIMESTAMP) != 6 AND DATEPART(DW,CURRENT_TIMESTAMP) != dbo.DayOff(@username))
    BEGIN
       UPDATE Attendance
       SET end_time = CURRENT_TIMESTAMP
       WHERE username = @username AND date = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
    END
GO

--#3
--View Attendance records
CREATE PROC ViewAttendanceRecords
       @username VARCHAR(50),
       @start_date DATE,
       @end_date DATE
AS
       SELECT A.date, A.start_time , A.end_time , 
              DATEDIFF(HH, A.start_time, A.end_time) AS 'duration',
              dbo.GetMissingHours(Jb.working_hours, A.start_time, A.end_time) AS 'missing_hours'
       FROM   Attendance A , Jobs_Available Jb, Staff_Members S
       WHERE  A.username = @username
              AND A.username = S.username 
              AND S.company_name = Jb.company_name
              AND S.company_address = Jb.company_address 
              AND S.job_title = Jb.title
              AND S.department_code = Jb.department_code 
              AND A.date BETWEEN @start_date AND @end_date
GO  

--#4
--Apply For Requests
--LeaveRequest
CREATE PROC ApplyForLeaveRequest
       @username VARCHAR(50),
       @start_date DATE,
       @end_date DATE,
       @replacement_username VARCHAR(50),
       @type VARCHAR(50)
AS    
       DECLARE @role VARCHAR(50)
       DECLARE @replacementRole VARCHAR(50)
       DECLARE @requestCode INT
       SET @role = dbo.StaffMemberType(@username)
       SET @replacementRole = dbo.StaffMemberType(@username)
       IF(dbo.HasRequests(@username, @role, @start_date, @end_date) = 0 
          AND dbo.HasRequests(@replacement_username, @replacementRole, @start_date, @end_date) = 0
          AND @username <> @replacement_username) 
       BEGIN
         IF(@role = 'HR Employee' AND @role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date, manager_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Pending')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO HR_Replacements (code, hr_username, hr_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Leave_Requests (code, type)
           VALUES (@requestCode, @type)
         END
         ELSE IF(@role = 'Manager' AND @role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date,manager_decision,hr_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Accepted','Accepted')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO Manager_Replacements (code, manager_username, manager_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Leave_Requests (code, type)
           VALUES (@requestCode, @type)
         END
         ELSE IF(@role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date, manager_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Pending')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO Regular_Employee_Replacements (code, regular_employee_username, regular_employee_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Leave_Requests (code, type)
           VALUES (@requestCode, @type)
         END
         ELSE
           PRINT 'YOU CANNOT MAKE REQUEST'
       END
       ELSE
         PRINT 'YOU CANNOT MAKE REQUEST'

GO

--BusinessRequest
CREATE PROC ApplyForBusinessRequest
       @username VARCHAR(50),
       @start_date DATE,
       @end_date DATE,
       @replacement_username VARCHAR(50),
       @trip_destination VARCHAR(50),
       @trip_purpose VARCHAR(280)
AS
       DECLARE @role VARCHAR(50)
       DECLARE @replacementRole VARCHAR(50)
       DECLARE @requestCode INT
       SET @role = dbo.StaffMemberType(@username)
       SET @replacementRole = dbo.StaffMemberType(@replacement_username)         
       IF(dbo.HasClash(@username, @role, @start_date, @end_date) = 0
          AND dbo.HasClash(@replacement_username, @role, @start_date, @end_date) = 0
          AND @username <> @replacement_username)
       BEGIN
         IF(@role = 'HR Employee' AND @role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date, manager_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Pending')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO HR_Replacements (code, hr_username, hr_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Business_Requests (code, trip_destination, trip_purpose)
           VALUES (@requestCode, @trip_destination, @trip_purpose)
         END
         ELSE IF(@role = 'Manager' AND @role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date, manager_decision,hr_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Accepted','Accepted')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO Manager_Replacements (code, manager_username, manager_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Business_Requests (code, trip_destination, trip_purpose)
           VALUES (@requestCode, @trip_destination, @trip_purpose)
         END
         ELSE IF(@role = @replacementRole AND dbo.SameCompDep(@username, @replacement_username) = 1)
         BEGIN
           INSERT INTO Requests (employee_username, date_created, start_date, end_date, manager_decision)
           VALUES (@username, DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)), @start_date, @end_date, 'Pending')
           
           SELECT @requestCode = code
           FROM Requests
           WHERE date_created = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP))
                 AND start_date = @start_date
                 AND end_date = @end_date
                 AND employee_username = @username
           
           INSERT INTO Regular_Employee_Replacements (code, regular_employee_username, regular_employee_replacement_username)
           VALUES (@requestCode, @username, @replacement_username)

           INSERT INTO Business_Requests (code, trip_destination, trip_purpose)
           VALUES (@requestCode, @trip_destination, @trip_purpose)
         END
         ELSE
           PRINT 'YOU CANNOT MAKE REQUEST'
       END
       ELSE
         PRINT 'YOU CANNOT MAKE REQUEST'
GO

--#5
--VIEW REQUESTS STATUS
CREATE PROC ViewRequests
       @username VARCHAR(50)
AS
      SELECT code, hr_decision , manager_decision, dbo.RequestType(code) AS 'type'
      FROM Requests
      WHERE employee_username = @username

GO

--#6
--DELETE ANY REQUEST IN REVIEW STATUS
CREATE PROC DeleteRequests
       @code INT
AS
      DECLARE @type VARCHAR(50)
      DECLARE @employeeType VARCHAR(50)
      DECLARE @employeeUsername VARCHAR(50)

      SELECT @employeeUsername = employee_username
      FROM Requests
      WHERE code = @code 
            AND (hr_decision IS NULL OR
            hr_decision = 'Pending')
            AND manager_decision <> 'Rejected'

      IF(@employeeUsername IS NOT NULL)
      BEGIN
        SET @type = dbo.RequestType(@code)
        SET @employeeType = dbo.StaffMemberType(@employeeUsername)
        IF(@employeeType = 'HR Employee')
            DELETE FROM HR_Replacements WHERE code = @code
        ELSE IF(@employeeType = 'Manager')
            DELETE FROM Manager_Replacements WHERE code = @code
        ELSE
            DELETE FROM Regular_Employee_Replacements WHERE code = @code
        
        IF(@type = 'Leave')
            DELETE FROM Leave_Requests WHERE code = @code
        ELSE
            DELETE FROM Business_Requests WHERE code = @code
    
        DELETE FROM Requests WHERE code = @code
      END
      ELSE
        PRINT 'CANNOT DELETE'

GO            
          
--#7
--SEND MAIL TO OTHER STAFF MEMBERS
CREATE PROC SendEmails
       @sender_email VARCHAR(64),
       @recepient_email VARCHAR(64),
       @subject VARCHAR(50),
       @body VARCHAR(500)
AS
      DECLARE @last_code INT
      IF(EXISTS(
          SELECT *
          FROM Staff_Members S1, Staff_Members S2
          WHERE S1.username <> S2.username
                AND S1.staff_company_email = @sender_email
                AND S2.staff_company_email = @recepient_email
                AND S1.company_name = S2.company_name
                AND S1.company_address = S2.company_address
      )) 
      BEGIN
         INSERT INTO Emails(sender_email, subject, body)
         VALUES (@sender_email, @subject, @body)
  
         SELECT @last_code = MAX(id)
         FROM Emails
         
         INSERT INTO Emails_Recepients(id, sender_email, recepient_email)
         VALUES (@last_code, @sender_email, @recepient_email)
      END
      ELSE
        PRINT 'CANNOT SEND EMAIL'

GO           

--#8
--VIEW EMAILS RECIEVED BY OTHER STAFF MEMBERS
CREATE PROC ViewRecievedEmails
       @user_email VARCHAR(64)
AS
       SELECT E.* , Er.recepient_email
       FROM Emails E, Emails_Recepients Er
       WHERE E.id = Er.id AND Er.recepient_email = @user_email  

GO

--#9
--REPLY TO AN EMAIL
CREATE PROC EmailReply
       @email_id INT,
       @subject VARCHAR(50),
       @body VARCHAR(500)
AS
       DECLARE @sender VARCHAR(64)
       DECLARE @reciever VARCHAR(64)
       DECLARE @newId INT

       SELECT @sender = sender_email , @reciever = recepient_email
       FROM Emails_Recepients
       WHERE @email_id = id

       INSERT INTO Emails(sender_email, subject, body)
       VALUES (@reciever, @subject, @body)

       SELECT @newId = MAX(id)
       FROM Emails

       INSERT INTO Emails_Recepients(id, sender_email, recepient_email)
       VALUES (@newId, @reciever, @sender)

GO

--#10
--VIEW COMPANY ANNOUNCEMENTS
CREATE PROC ViewAnnouncements
       @username VARCHAR(50)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name , @company_address = company_address
       FROM   Staff_Members
       WHERE  username = @username

       SELECT A.title , A.description
       FROM Announcements A , Staff_Members S
       WHERE A.hr_username = S.username 
             AND S.company_name = @company_name
             AND S.company_address = @company_address
             AND DATEDIFF(DAY, A.time_stamp, CURRENT_TIMESTAMP) <= 20

GO
/*As an HR employee, I should be able to ...*/

--#1
--ADDS A NEW JOB
CREATE PROC AddNewJob
    @username VARCHAR(50),
    @job_title VARCHAR(50),
    @application_deadline DATETIME,
    @working_hours INT,
    @short_description VARCHAR(280),
    @detailed_description VARCHAR(500),
    @experience_years INT,
    @salary DECIMAL(10,2),
    @vacancies INT
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    DECLARE @role VARCHAR(50)
    SET @role = LEFT(@job_title, CHARINDEX('-', @job_title)-1)

    IF (@role = 'Manager' OR @role = 'HR' OR @role = 'Regular Employee')
    BEGIN
        INSERT INTO Jobs_Available 
        (
            title, 
            company_name, 
            company_address, 
            department_code, 
            application_deadline, 
            working_hours, 
            short_description, 
            detailed_description, 
            experience_years, 
            salary, 
            vacancies
        )
        VALUES 
        (
            @job_title, 
            @company_name, 
            @company_address, 
            @department_code, 
            @application_deadline, 
            @working_hours, 
            @short_description, 
            @detailed_description, 
            @experience_years, 
            @salary, 
            @vacancies
        )

        INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
        VALUES (@job_title, @company_name, @company_address, @department_code ,@username)
    END

    ELSE
    BEGIN
        PRINT 'Failed to add job, The job_title should start with the role'
    END

GO

--#1
--ADDS INTERVIEW QUESTIONS
CREATE PROC AddInterviewQuestions
    @username VARCHAR(50),
    @question VARCHAR(100),
    @job_title VARCHAR(50),
    @answer BIT
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    IF 
    (
        EXISTS
        (
            SELECT * FROM Jobs_Available 
            WHERE title = @job_title 
            AND company_name = @company_name 
            AND company_address = @company_address 
            AND department_code = @department_code
        )
    )
    BEGIN
        INSERT INTO Interview_Questions (question, title, company_name, company_address, department_code, answer)
        VALUES (@question, @job_title, @company_name, @company_address, @department_code, @answer)
    END

    ELSE
    BEGIN
        PRINT 'You can not add interview questions, Job not found!'
    END

GO

--#2
--VIEW INFO ABOUT A CERTAIN JOB
CREATE PROC ViewJob
    @username VARCHAR(50),
    @job_title VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    SELECT * FROM Jobs_Available 
    WHERE company_name = @company_name 
    AND company_address = @company_address 
    AND department_code = @department_code 
    AND title = @job_title

GO

--#3
--EDIT A JOB
CREATE PROC EditJob
    @username VARCHAR(50),
    @job_title VARCHAR(50),
    @new_job_title VARCHAR(50) = @job_title,
    @application_deadline DATETIME,
    @working_hours INT,
    @short_description VARCHAR(280),
    @detailed_description VARCHAR(500),
    @experience_years INT,
    @salary DECIMAL(10,2),
    @vacancies INT
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    UPDATE Jobs_Available
    SET 
    title                = @new_job_title,
    application_deadline = @application_deadline,
    working_hours        = @working_hours,
    short_description    = @short_description,
    detailed_description = @detailed_description,
    experience_years     = @experience_years,
    salary               = @salary,
    vacancies            = @vacancies
    WHERE title          = @job_title
    AND company_name     = @company_name
    AND company_address  = @company_address
    AND department_code  = @department_code

GO

--#4
--VIEW NEW APPLICATION FOR A SPECIFIC JOB
CREATE PROC ViewApplicationsForJob
    @username VARCHAR(50),
    @job_title VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    DECLARE @status VARCHAR(50)
    SELECT @status = 
    status FROM Job_Applications 
    WHERE job_title     = @job_title 
    AND company_name    = @company_name 
    AND company_address = @company_address
    AND department_code = @department_code

    IF (@status = 'Pending')
    BEGIN
        SELECT ja.* , U.experience_years , U.email, U.birth_date , U.first_name , U.middle_name , U.last_name , U.age
        FROM Job_Applications ja , Users U
        WHERE ja.job_title     = @job_title 
        AND ja.company_name    = @company_name 
        AND ja.company_address = @company_address 
        AND ja.department_code = @department_code
        AND U.username         = ja.job_seeker_username
    END

    ELSE
    BEGIN
        PRINT 'Can not view non pending applications!'
    END

GO

--#5
--HR ACCEPTS AN APPLICATION
CREATE PROC AcceptApplication
    @username VARCHAR(50),
    @job_seeker_username VARCHAR(50),
    @job_title VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    UPDATE Job_Applications
    SET
    [status] = 'HRAccepted',
    hr_employee_reviewer = @username
    WHERE job_title = @job_title
    AND job_seeker_username = @job_seeker_username
    AND company_name = @company_name
    AND company_address = @company_address
    AND department_code = @department_code

GO

--#5
--HR REJECTS AN APPLICATION
CREATE PROC RejectApplication
    @username VARCHAR(50),
    @job_seeker_username VARCHAR(50),
    @job_title VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @username

    UPDATE Job_Applications
    SET
    [status] = 'Rejected',
    hr_employee_reviewer = @username
    WHERE job_title = @job_title
    AND job_seeker_username = @job_seeker_username
    AND company_name = @company_name
    AND company_address = @company_address
    AND department_code = @department_code

GO

--#6
--POST ANNOUNCEMENTS
CREATE PROC PostAnnouncements
    @hr_username VARCHAR(50),
    @title VARCHAR(50),
    @type VARCHAR(50),
    @description VARCHAR(200)
AS
    INSERT INTO Announcements(title, type, description, hr_username)
    VALUES (@title, @type, @description, @hr_username)

GO

--#7
--VIEW BUSINESS REQUESTS
CREATE PROC ViewBusinessRequests
    @hr_username VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @hr_username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @hr_username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @hr_username

    SELECT R.* FROM Requests R INNER JOIN Staff_Members S ON S.username = R.employee_username 
    WHERE S.company_name   = @company_name 
    AND S.company_address  = @company_address
    AND S.department_code  = @department_code
    AND R.manager_decision = 'Accepted'
    AND EXISTS(SELECT R.code FROM Business_Requests WHERE R.code = Business_Requests.code)

GO

--#7
--VIEW LEAVE REQUESTS
CREATE PROC ViewLeaveRequests
    @hr_username VARCHAR(50)
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @hr_username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @hr_username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @hr_username

    SELECT R.* FROM Requests R INNER JOIN Staff_Members S ON S.username = R.employee_username 
    WHERE S.company_name   = @company_name 
    AND S.company_address  = @company_address
    AND S.department_code  = @department_code
    AND R.manager_decision = 'Accepted'
    AND EXISTS(SELECT R.code FROM Leave_Requests WHERE R.code = Leave_Requests.code)

GO

--#8
--HR ACCEPTS A REQUEST
CREATE PROC AcceptRequest
    @code INT
AS
    DECLARE @manager_decision VARCHAR(50)
    SELECT @manager_decision = manager_decision FROM Requests WHERE Requests.code = @code

    DECLARE @hr_decision VARCHAR(50)
    SELECT @hr_decision = hr_decision FROM Requests WHERE Requests.code = @code

    PRINT @manager_decision

    IF (@manager_decision = 'Accepted')
    BEGIN
        IF (@hr_decision = 'Pending')
        BEGIN
            UPDATE Requests
            SET
            hr_decision = 'Accepted'
            WHERE Requests.code = @code

            DECLARE @employee_username VARCHAR(50)
            SELECT @employee_username = employee_username FROM Requests WHERE Requests.code = @code

            DECLARE @day_off VARCHAR(10)
            SELECT @day_off = day_off FROM Staff_Members WHERE Staff_Members.username = @employee_username

            DECLARE @start_date DATE
            SELECT @start_date = start_date FROM Requests WHERE Requests.code = @code

            DECLARE @end_date DATE
            SELECT @end_date = end_date FROM Requests WHERE Requests.code = @code

            DECLARE @total_days INT
            SELECT @total_days = total_days FROM Requests WHERE Requests.code = @code

            UPDATE Staff_Members
            SET
            annual_leaves = annual_leaves - @total_days
            WHERE Staff_Members.username = @employee_username
        END

        ELSE
        BEGIN
            PRINT 'Request must be Pending!'
        END
    END

    ELSE
    BEGIN
        PRINT 'The manager needs to approve first!'
    END

GO

--#8
--HR REJECTS A REQUEST
CREATE PROC RejectRequest
    @code INT
AS
    DECLARE @manager_decision VARCHAR(50)
    SELECT @manager_decision = manager_decision FROM Requests WHERE Requests.code = @code

    PRINT @manager_decision

    DECLARE @hr_decision VARCHAR(50)
    SELECT @hr_decision = hr_decision FROM Requests WHERE Requests.code = @code

    IF (@manager_decision = 'Accepted')
    BEGIN
        IF (@hr_decision = 'Pending')
        BEGIN
            UPDATE Requests
            SET
            hr_decision = 'Rejected'
            WHERE Requests.code = @code
        END

        ELSE
        BEGIN
            PRINT 'The manager needs to approve first!'
        END
    END

    ELSE
    BEGIN
        PRINT 'The manager needs to approve first!'
    END

GO

--#9
--VIEW ATTENDANCE OF STAFF MEMBERS
CREATE PROC ViewAttendance
    @hr_username VARCHAR(50),
    @start_date DATE,
    @end_date DATE
AS
    DECLARE @company_name VARCHAR(50)
    DECLARE @company_address VARCHAR(100)
    DECLARE @department_code VARCHAR(10)

    SELECT @company_name    = company_name FROM Staff_Members WHERE username = @hr_username
    SELECT @company_address = company_address FROM Staff_Members WHERE username = @hr_username
    SELECT @department_code = department_code FROM Staff_Members WHERE username = @hr_username



    SELECT A.username , A.[date] , A.start_time , A.end_time , DATEDIFF(HOUR, A.start_time, A.end_time) AS duration FROM Attendance A INNER JOIN Staff_Members S ON S.username = A.username
    WHERE S.company_name  = @company_name
    AND S.company_address = @company_address
    AND S.department_code = @department_code
    AND A.[date] >= @start_date
    AND A.[date] <= @end_date

GO

--“As a regular employee, I should be able to ...”
--#1
CREATE PROC ShowProjects 
@username VARCHAR (50) 
AS

IF EXISTS (select * from Regular_Employees where username = @username)

BEGIN
    SELECT p.name , p.start_date , p.end_date, p.manager_creator
    FROM Projects p
    inner JOIN Tasks t
    ON  p.name = t.project_name
    WHERE t.employee_assigned = @username

END
GO

--#2
CREATE PROC showTasks 
@project VARCHAR (50),
@username VARCHAR (50)
AS

IF EXISTS (select * from Regular_Employees where username = @username)
BEGIN
    SELECT t.project_name,t.deadline,t.description,t.status,p.start_date , p.end_date, p.manager_creator
    FROM Tasks t 
    INNER JOIN Projects p
    ON t.project_name  = p.name
    WHERE t.project_name = @project AND employee_assigned = @username
END
GO

--#3
CREATE PROC DeadlineOFTask
@taskname VARCHAR (50)

AS


DECLARE @deadline DATE
DECLARE @date DATE
SET @date = GetDate()

select @deadline=deadline
FROM Tasks t
WHERE t.name = @taskname

IF (@deadline > @date)
    UPDATE Tasks SET Tasks.status = 'Fixed' 
    ELSE
    PRINT('The Deadline has been reached , therefore the task can not be fixed')

GO

--#4
CREATE PROC changeTOassign 
@username VARCHAR (50)

AS

DECLARE @deadline DATE
DECLARE @status VARCHAR (20)
DECLARE @date DATE --here i DECLARED a varable of type date
SET @date = GetDate() --this method gets the current_date

--Here i showed the table of the tasks that are assigned by this employee
SELECT t.name 
FROM Tasks t 
WHERE t.employee_assigned = @username

--here i got the status and the deadline if the task assigned by the employee and set each one of them into the DECLARED varaible
SELECT @status = t.status , @deadline = t.deadline
FROM Tasks t 
WHERE t.employee_assigned = @username

IF (@deadline > @date AND @status = 'Fixed')
    UPDATE TASKS SET Tasks.status = 'Assigned'
    ELSE
    print 'The Deadline has been reached , therefore the task can not be fixed'

GO


--“As a manager, I should be able to ...”
--#1
--VIEW REQUESTS BY DEPARTMENT EMPLOYEES

CREATE PROC ViewEmployeesRequests
       @username VARCHAR(50)
AS     
       SELECT R.*
       FROM  Requests R, Staff_Members S, Staff_Members S2
       WHERE S.username = @username AND S2.username = R.employee_username AND
             S.company_name = S2.company_name AND S.company_address = S2.company_address
             AND S.department_code = S2.department_code AND R.manager_decision = 'Pending'
GO

--#2
--ACCEPT REQUESTS
CREATE PROC ManagerAcceptRequests
       @username VARCHAR(50),
       @code INT
AS
       DECLARE @manager_type VARCHAR(50)
       DECLARE @employee VARCHAR(50)

       SELECT @manager_type = type
       FROM Managers
       WHERE username = @username

       SELECT @employee = employee_username
       FROM Requests
       WHERE code = @code

       UPDATE Requests
       SET manager_decision = 'Accepted' , hr_decision = 'Pending'
       WHERE code = @code
        
       IF(@manager_type = 'HR' AND dbo.StaffMemberType(@employee) = 'HR Employee')
       BEGIN
          UPDATE Requests
          SET manager_decision = 'Accepted' , hr_decision = 'Accepted'
          WHERE code = @code
       END
GO

--REJECT REQUESTS
CREATE PROC ManagerRejectRequests
       @username VARCHAR(50),
       @code INT,
       @reason VARCHAR(50)
AS
       UPDATE Requests
       SET manager_decision = 'Rejected' , manager_rejecting_reason = @reason, manager_reviewer = @username
       WHERE code = @code
        
GO

--#3
--VIEW APPLICATIONS FOR JOBS IN DEPARTMENT
CREATE PROC ManagerViewJobApplications
       @username VARCHAR(50)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(50)
       DECLARE @department_code VARCHAR(10)

       SELECT @company_name = company_name, @company_address = company_address, @department_code = department_code
       FROM Staff_Members
       WHERE username = @username

       SELECT U.*, Ja.*,Jb.*
       FROM Job_Applications Jb, Jobs_Available Ja, Job_Seekers Js, Users U
       WHERE Ja.company_name = @company_name AND Ja.company_address = @company_address
             AND Ja.department_code = @department_code AND Jb.company_name = @company_name
             AND Jb.company_address = @company_address AND Jb.department_code = @department_code
             AND Jb.status = 'HRAccepted' AND Js.username = U.username AND Js.username = Jb.job_seeker_username
             AND Jb.job_title = Ja.title

GO

--#4
--ACCEPT JOB APPLICATIONS
CREATE PROC ManagerAcceptJobApplication
       @username VARCHAR(50),
       @jobSeeker VARCHAR(50),
       @jobTitle VARCHAR(50),
       @companyName VARCHAR(50),
       @companyAddress VARCHAR(100),
       @departmentCode VARCHAR(10),
       @response VARCHAR(50)
AS
       UPDATE Job_Applications
       SET status = 'Accepted', manager_reviewer = @username, manager_response = @response
       WHERE job_seeker_username = @jobSeeker AND job_title = @jobTitle
             AND company_name = @companyName AND company_address = @companyAddress
             AND department_code = @departmentCode 

GO

--REJECT JOB APPLICATIONS
CREATE PROC ManagerRejectJobApplication
       @username VARCHAR(50),
       @jobSeeker VARCHAR(50),
       @jobTitle VARCHAR(50),
       @companyName VARCHAR(50),
       @companyAddress VARCHAR(100),
       @departmentCode VARCHAR(10)
AS
       UPDATE Job_Applications
       SET status = 'Rejected', manager_reviewer = @username
       WHERE job_seeker_username = @jobSeeker AND job_title = @jobTitle
             AND company_name = @companyName AND company_address = @companyAddress
             AND department_code = @departmentCode 

GO

--#5
--CREATE NEW PROJECT
CREATE PROC CreateProject
       @username VARCHAR(50),
       @projectName VARCHAR(50),
       @companyName VARCHAR(50),
       @companyAddress VARCHAR(100),
       @startDate DATE,
       @endDate DATE
AS
       INSERT INTO Projects(name, company_name, company_address, start_date, end_date,manager_creator)
       VALUES (@projectName, @companyName, @companyAddress, @startDate, @endDate, @username)

GO

--#6
--ASSIGN REGULAR EMPLOYEE TO PROJECT
CREATE PROC AssignEmployeeToProject
       @project VARCHAR(50),
       @employeeusername VARCHAR(50),
       @username VARCHAR(50)
AS
       DECLARE @projects INT
       DECLARE @companyName VARCHAR(50)
       DECLARE @companyAddress VARCHAR(100)

       IF(EXISTS(
           SELECT *
           FROM Staff_Members S1, Staff_Members S2
           WHERE S1.username = @username AND S2.username = @employeeusername
                 AND S1.company_name = S2.company_name AND S1.company_address =
                 S2.company_address AND S1.department_code = S2.department_code
       ))
       BEGIN
          
          SELECT @projects = COUNT(*)
          FROM Employees_Assigned_For_Project
          WHERE employee_assigned = @employeeusername

          SELECT @companyName = company_name, @companyAddress = company_address
          FROM Staff_Members
          WHERE @employeeusername = username
        
          IF(@projects < 2 AND NOT EXISTS(
              SELECT *
              FROM Employees_Assigned_For_Project
              WHERE employee_assigned = @employeeusername AND project_name = @project 
                    AND company_name = @companyName AND company_address = @companyAddress
          ))
          BEGIN
            INSERT INTO Employees_Assigned_For_Project(project_name, company_name, company_address, employee_assigned, manager)
            VALUES(@project, @companyName, @companyAddress, @employeeusername, @username)
          END
          ELSE
            PRINT 'Employee assigned to 2 or more projects' 
       END
       ELSE
          PRINT 'Not in same company'
       
GO   

--#7
--REMOVE EMPLOYEE FROM PROJECT
CREATE PROC RemoveEmployeeFromProject
       @manager VARCHAR(50),
       @employee VARCHAR(50),
       @project VARCHAR(50)
AS
       DECLARE @companyName VARCHAR(50)
       DECLARE @companyAddress VARCHAR(100)  
       SELECT @companyName = company_name, @companyAddress = company_address
       FROM Staff_Members
       WHERE @manager = username 

       IF(NOT EXISTS(
           SELECT * 
           FROM Tasks
           WHERE project_name = @project AND company_name = @companyName 
                 AND company_address = @companyAddress
                 AND employee_assigned = @employee
                 AND status <> 'Closed'
       ))
       BEGIN
           DELETE
           FROM Employees_Assigned_For_Project
           WHERE employee_assigned = @employee
       END
       ELSE
         PRINT 'EMPLOYEE HAS TASKS'

GO

--#8
--CREATE TASK

CREATE PROC CreateTask
       @username VARCHAR(50),
       @name VARCHAR(50),
       @project_name VARCHAR(50),
       @deadline DATE,
       @description VARCHAR(280)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)
       IF(NOT EXISTS(
             SELECT *
             FROM Projects
             WHERE name = @project_name
       ))
       BEGIN
            SELECT @company_name = company_name, @company_address = company_address
            FROM Staff_Members
            WHERE @username = username

            INSERT INTO Tasks(name, project_name,company_name,company_address,deadline,description,status,manager_creator)
            VALUES (@name, @project_name, @company_name, @company_address, @deadline, @description,'Open', @username)
       END
          
GO

--#9
--ASSIGN EMPLOYEE TO TASK
CREATE PROC AssignEmployeeToTask
       @username VARCHAR(50),
       @employee VARCHAR(50),
       @task_name VARCHAR(50)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name, @company_address = company_address
       FROM Staff_Members
       WHERE @username = username

       UPDATE Tasks
       SET employee_assigned = @employee, status = 'Assigned'
       WHERE name = @task_name AND manager_creator = @username AND status ='Open'
             AND @company_name = company_name AND @company_address = company_address

GO


--#10
--Change Assigned Employee
CREATE PROC ChangeAssignedEmployee
       @username VARCHAR(50),
       @newEmployee VARCHAR(50),
       @taskName VARCHAR(50)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name, @company_address = company_address
       FROM Staff_Members
       WHERE @username = username

       UPDATE Tasks
       SET employee_assigned = @newEmployee , status = 'Assigned'
       WHERE name = @taskName AND manager_creator = @username AND status = 'Assigned'
             AND @company_name = company_name AND @company_address = company_address
GO     

--#11
--PROJECT TASKS
CREATE PROC ProjectTasks
       @username VARCHAR(50),
       @projectName VARCHAR(50),
       @status VARCHAR(50)

AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name, @company_address = company_address
       FROM Staff_Members
       WHERE @username = username

       SELECT *
       FROM Tasks
       WHERE project_name = @projectName AND company_name = @company_name
             AND company_address = @company_address AND status = @status
GO

--#12
--Review task
CREATE PROC CloseTask
       @username VARCHAR(50),
       @taskName VARCHAR(50)
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name, @company_address = company_address
       FROM Staff_Members
       WHERE @username = username

       UPDATE Tasks
       SET status ='Closed'
       WHERE manager_creator = @username AND name = @taskName
             AND company_name = @company_name AND company_address = @company_address
             AND status = 'Fixed'

GO

CREATE PROC AssignTask
       @username VARCHAR(50),
       @taskName VARCHAR(50),
       @dead DATE
AS
       DECLARE @company_name VARCHAR(50)
       DECLARE @company_address VARCHAR(100)

       SELECT @company_name = company_name, @company_address = company_address
       FROM Staff_Members
       WHERE @username = username

       UPDATE Tasks
       SET status ='Assigned', deadline = @dead
       WHERE manager_creator = @username AND name = @taskName
             AND company_name = @company_name AND company_address = @company_address
             AND status = 'Fixed'             
GO