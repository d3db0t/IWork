USE IWork

GO
/*As an registered/unregistered user, I should be able to ...*/

--#1
--Search for company by name
EXEC CompaniesByName 'Apple'
GO

--Search for Company by Address
EXEC CompaniesByAddress 'California'
GO

--Search for Company by Type
EXEC CompaniesByType 'International'
GO

--#2
--All Available Companies on the System
EXEC AllCompanies
GO

--#3
--View Company Information along with it's Departments
EXEC CompanyWithDepartments 'Apple'
GO

--#4
--View Certain Department in Certain Company with it's Job Vacancies
EXEC DepartmentVacancies 'Apple' , 'WashingtonDC', '#IT'
GO

--#5
--REGISTER USER IN WEBSITE
EXEC REGISTER 'OMAR','YALA',15,'omar@yala.com','10/9/1980','Omar','Emad','Sabry'
GO

--#6
--SEARCH FOR JOBS WITH VACANCIES USING KEYWORDS
EXEC  SearchForJobs 'General'
GO
EXEC  SearchForJobs 'Backend'
GO

--#7
--VIEW COMPANIES IN ORDER OF THE HIGHEST AVERAGE SALARIES
EXEC Companies_with_Highest_Avg_Salaries
GO

/*As a registered user, I should be able to ...*/

--#1
--LOGIN TO THE WEBSITE
DECLARE @output VARCHAR(50)
EXEC LOG_IN 'Maro', 'kofta', @output OUTPUT
GO

--#2
--VIEW ALL POSSIBLE INFO FOR USER
EXEC ViewUserInfo "Maro"
GO

--#3
--EDIT ALL THE USER INFO
EXEC EditUserInfo 'Maro', 'Maro5', 'kofta', 11, 'maro@yahoo.com', '11/12/1980', 'Marwan', 'Samir', 'Ahmed'
GO

/*As a job seeker, I should be able to ...*/

--#1
--JOBSEEKER APPLIES FOR A JOB
EXEC ApplyForJob 'Maro', 'Manager - Marketing Director', 'HP', 'California', '#MK'
GO

--#2
--VIEW INTERVIEW QUESTIONS FOR A CERTAIN JOB
EXEC ViewInterviewQuestions 'Maro', 'Manager - Marketing Director', 'HP', 'California', '#MK'
GO

--#3
--SAVE THE SCORE OF JOB SEEKER WHEN APPLYING FOR THE JOB
EXEC SaveScore 'Ziko', 'Regular Employee - Junior Web Developer', 'Apple', 'WashingtonDC', '#IT'
GO

--#4
--VIEW STATUS OF ALL JOBS THAT JOB SEEKER APPLIED TO AND THE SCORE OF THE INTERVIEW
EXEC ViewAppliedJobsStatusAndScore 'Ziko'
GO

--#5
--USER CHOOSE AN ACCEPTED JOB APPLICATION TO BECOME A STAFF MEMBER
EXEC UserAcceptsAnOffer 'Ziko', 'Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT','Sunday'
GO

--#6
--DELETE JOB APPLICATION IF STILL PENDING
EXEC DeleteJobApplication 'Maro', 'Manager - Marketing Director', 'HP', 'California', '#MK'
GO



/*“As a staff member, I should be able to ...”*/
--#1
--Check in
EXEC CheckIn 'Chikooo'
GO

--#2
--Check out
EXEC CheckOut 'Chikooo'
GO

--#3
--View Attendance records
EXEC ViewAttendanceRecords 'Chikooo','01/11/2017' ,'12/11/2020'
GO

--#4
--Apply For Leave Request
EXEC ApplyForLeaveRequest 'Sheikh_El3arab','05/17/2017','05/21/2017','NadaSaso','vacation'
GO
EXEC ApplyForLeaveRequest 'NadaSaso','05/15/2017','05/17/2017','Sheikh_El3arab','vacation'
GO
EXEC ApplyForLeaveRequest 'Sheikh_El3arab','05/19/2017','05/21/2017','Han_Solo','vacation'
GO

--Apply For Business
EXEC ApplyForBusinessRequest 'Honda', '07/15/2017','07/27/2017','Anwar_Ali33','Barcelona','Meet FCBarcelona President'
GO
EXEC ApplyForBusinessRequest 'Anwar_Ali33', '07/17/2017','07/27/2017','Honda','Barcelona','Meet FCBarcelona President'
GO
EXEC ApplyForBusinessRequest 'Anwar_Ali33', '08/17/2017','08/27/2017','Anwar_Ali33','Barcelona','Meet FCBarcelona President'
GO
EXEC ApplyForBusinessRequest 'Han_Solo', '05/17/2017','05/27/2017','Ihab','Barcelona','Meet FCBarcelona President'
GO
EXEC ApplyForBusinessRequest 'Mr_Taha', '05/17/2017','05/27/2017','Potato','Barcelona','M'
GO
--#5
--View Requests Status
EXEC ViewRequests 'Sheikh_El3arab'
GO
EXEC ViewRequests 'Honda'
GO
EXEC ViewRequests 'Yasser_Artist'
GO

--#6
--Delete Requests in review 
EXEC DeleteRequests 8
GO
EXEC DeleteRequests 4
GO

--#7
--SENDING EMAILS
EXEC SendEmails 'omaremad@apple.com' , 'amrtato@apple.com', 'New Employees Review', 'Please check the attatchement below'
GO

--#8
--View recieved emails
EXEC ViewRecievedEmails 'samy@dell.com'
GO
EXEC ViewRecievedEmails 'amrtato@apple.com'
GO

--#9
--Reply to an Email
EXEC EmailReply 10 , 'DONE', 'Everthing is OK'
GO

--#10
--View Announcements
EXEC ViewAnnouncements 'Omar_Emad'
GO

/*As an HR employee, I should be able to ...*/

--#1
--ADDS A NEW JOB
EXEC AddNewJob 'Joe', 'HR - sabbak', '01/01/2018', 8, 'the short desc2', 'the detailed desc', 3, 3000.0, 2
GO

--#1
--ADDS INTERVIEW QUESTIONS
EXEC AddInterviewQuestions 'Joe', 'Can I change my major?', 'HR - sabbak', 0
GO

--#2
--VIEW INFO ABOUT A CERTAIN JOB
EXEC ViewJob 'Joe', 'HR - sabbak'
GO

--#3
--EDIT A JOB
EXEC EditJob 'Joe', 'HR - sabbak', 'HR - samkary', '07/12/2017', 5, 'updated short desc', 'updated detailed desc', 5, 10.3, 7
GO

--#4
--VIEW NEW APPLICATION FOR A SPECIFIC JOB
EXEC ViewApplicationsForJob 'Youssef', 'Manager - Marketing Director'
GO

--#5
--HR ACCEPTS AN APPLICATION
EXEC AcceptApplication 'Youssef', 'Sarah123', 'Manager - Marketing Director'
GO

--#5
--HR REJECTS AN APPLICATION
EXEC RejectApplication 'Youssef', 'Sarah123', 'Manager - Marketing Director'
GO

--#6
--POST ANNOUNCEMENTS
EXEC PostAnnouncements 'Salah', 'El DEADLINE 2arab!', 'Danger', 'Yalahwyyyy!'
GO

--#7
--VIEW BUSINESS REQUESTS
EXEC ViewBusinessRequests 'Chikooo'
GO

--#7
--VIEW LEAVE REQUESTS
EXEC ViewLeaveRequests 'Chikooo'
GO

--#8
--HR ACCEPTS A REQUEST
EXEC AcceptRequest 1
GO

--#8
--HR REJECTS A REQUEST
EXEC RejectRequest 1
GO

--#9
--VIEW ATTENDANCE OF STAFF MEMBERS
EXEC ViewAttendance 'Yasser_Artist', '07/11/2017', '12/12/2017'
GO

/*As a regular employee, I should be able to ...*/

--#1
EXEC ShowProjects 'hanoos'
GO

--#2
EXEC showTasks 'New Mac Release', 'kamel2020'
GO

--#3
EXEC DeadlineOFTask 'New Web Application'
GO

--#4
EXEC changeTOassign 'hanoos'
GO

/*“As a manager, I should be able to ...” */
--#1
--VIEW REQUESTS BY DEPARTMENT EMPLOYEES
EXEC ViewEmployeesRequests 'MarwanAlaa'
GO

--#2
--Accept Requests
EXEC ManagerAcceptRequests 'MarwanAlaa', 9
GO
EXEC ManagerAcceptRequests 'KimoW' , 10
GO

--Reject Requests
EXEC ManagerRejectRequests 'Maro' , 12, 'NO TIME'
GO

--#3
--VIEW APPLICATIONS FOR JOBS IN DEPARTMENT
EXEC ManagerViewJobApplications 'AmrBatates'
GO

--#4
--ACCEPT JOB APPLICATIONS
EXEC  ManagerAcceptJobApplication 'AmrBatates', 'Messi', 'Manager - HR General Manager','Dell','NYC','#HR','YES YOU ARE ACCEPTED'
GO

--REJECT JOB APPLICATIONS
EXEC ManagerRejectJobApplication 'ThePinger', 'Ziko', 'Regular Employee - Junior Web Developer', 'HP','California','#IT'
GO

--#5
--CREATE PROJECT
EXEC CreateProject '3os', 'New Project', 'Apple','WashingtonDC', '12/11/2017','12/11/2018'
GO

--#6
--ASSIGN EMPLOYEE TO PROJECT
EXEC AssignEmployeeToProject 'New Project', 'kamel2020', '3os'
GO
EXEC AssignEmployeeToProject 'New Project', 'HanaKimo', '3os'
GO

--#7
--REMOVE EMPLOYEE FROM PROJECT
UPDATE Tasks
SET status = 'Closed'
WHERE employee_assigned = 'Samy'
GO
EXEC RemoveEmployeeFromProject 'KimoW', 'Samy','New Laptop Release'
GO
EXEC RemoveEmployeeFromProject '3os','HanaKimo','New Mac Release' 
GO

--#8
--CREATE TASK
EXEC CreateTask '3os', 'Work more', 'New Project','12/11/2017','yala'
GO

--#9
--ASSIGN EMPLOYEE TO TASK
EXEC AssignEmployeeToTask '3os', 'kamel2020', 'Work more'
GO

--#10
--Change Assigned Employee
EXEC ChangeAssignedEmployee '3os', 'HanaKimo', 'Work more'
GO

--#11
--PROJECT TASKS
EXEC ProjectTasks '3os', 'New Project', 'Assigned'
GO

--#12
EXEC CloseTask 'Maro','Marketing Plan'
GO
EXEC AssignTask 'Shady_TheBot','New Web Application Design','12/11/2017'
GO
