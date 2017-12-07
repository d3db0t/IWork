CREATE DATABASE IWork;

GO

USE IWork

GO

CREATE TABLE Companies(
   name VARCHAR(50) NOT NULL,
   address VARCHAR(100) NOT NULL,
   domain_name VARCHAR(50) UNIQUE NOT NULL,
   vision VARCHAR(50) NOT NULL,
   email VARCHAR(64) UNIQUE NOT NULL,
   field VARCHAR(50) NOT NULL,
   type VARCHAR(50) NOT NULL , 
   PRIMARY KEY(name , address)
)

CREATE TABLE Company_Phones(
    phone_number VARCHAR(15) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    PRIMARY KEY(phone_number , company_name , company_address),
    FOREIGN KEY(company_name , company_address) REFERENCES Companies(name , address) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Departments(
    code VARCHAR(10) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(code , company_name , company_address),
    FOREIGN KEY(company_name , company_address) REFERENCES Companies(name , address) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Users(
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    experience_years INT NOT NULL,
    email VARCHAR(64) UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
    PRIMARY KEY(username)
)

CREATE TABLE User_Previous_Jobs(
    username VARCHAR(50) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    previous_company VARCHAR(50) NOT NULL,
    job_description VARCHAR(280) NOT NULL,
    PRIMARY KEY(username , job_title , previous_company),
    FOREIGN KEY(username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Job_Seekers(
    username VARCHAR(50) NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Staff_Members(
    username VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    annual_leaves INT NOT NULL,
    day_off VARCHAR(10) NOT NULL,
    staff_company_email VARCHAR(64) UNIQUE NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
)

--CHECK EMAIL OR USERNAME
CREATE TABLE Emails(
    id INT IDENTITY,
    sender_email VARCHAR(64) UNIQUE NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    subject VARCHAR(50),
    body VARCHAR(500),
    PRIMARY KEY(id),
    FOREIGN KEY(sender_email) REFERENCES Staff_Members(staff_company_email) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Emails_Recepients(
    id INT ,
    sender_email VARCHAR(64) NOT NULL,
    recepient_email VARCHAR(64) NOT NULL,
    PRIMARY KEY(id , recepient_email),
    FOREIGN KEY(sender_email) REFERENCES Emails(sender_email) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(recepient_email) REFERENCES Staff_Members(staff_company_email) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Attendance(
    username VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME ,
    PRIMARY KEY(username , date),
    FOREIGN KEY(username) REFERENCES Staff_Members(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE HR_Employees(
    username VARCHAR(50) NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(username) REFERENCES Staff_Members(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Managers(
    username VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(username) REFERENCES Staff_Members(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Regular_Employees(
    username VARCHAR(50) NOT NULL,
    PRIMARY KEY(username),
    FOREIGN KEY(username) REFERENCES Staff_Members(username) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Jobs_Available(
    title VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) NOT NULL,
    application_deadline DATETIME NOT NULL,
    working_hours INT NOT NULL,
    short_description VARCHAR(280) NOT NULL,
    detailed_description VARCHAR(500) NOT NULL,
    experience_years INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    vacancies INT NOT NULL,
    --hr_employee_creator VARCHAR(50) NOT NULL,
    PRIMARY KEY(title, company_name, company_address, department_code),
    FOREIGN KEY(department_code, company_name, company_address) REFERENCES Departments(code, company_name , company_address) ON DELETE CASCADE ON UPDATE CASCADE
    --FOREIGN KEY(hr_employee_creator) REFERENCES HR_Employees(username) ON DELETE NO ACTION ON UPDATE NO ACTION
)

--ADDING JOB AVAILABLE INFO IN STAFF MEMBERS TABLE
ALTER TABLE Staff_Members
ADD company_name VARCHAR(50) NOT NULL,
company_address VARCHAR(100) NOT NULL,
department_code VARCHAR(10) NOT NULL,
job_title VARCHAR(50) NOT NULL,
FOREIGN KEY(job_title, company_name, company_address, department_code) REFERENCES Jobs_Available(title, company_name, company_address, department_code) ON DELETE CASCADE ON UPDATE CASCADE

CREATE TABLE HR_Employee_Created_Jobs(
    job_title VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) NOT NULL,
    hr_username VARCHAR(50) NOT NULL,
    PRIMARY KEY(job_title, company_name, company_address, department_code),
    FOREIGN KEY(job_title, company_name, company_address, department_code) REFERENCES Jobs_Available(title, company_name, company_address, department_code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(hr_username) REFERENCES HR_Employees(username) ON DELETE NO ACTION
)

CREATE TABLE Interview_Questions(
    id INT IDENTITY NOT NULL,
    question VARCHAR(100) NOT NULL,
    title VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) NOT NULL,
    answer BIT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(title, company_name, company_address, department_code) REFERENCES Jobs_Available(title, company_name, company_address, department_code) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Job_Applications(
    job_seeker_username VARCHAR(50) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    department_code VARCHAR(10) NOT NULL,
    score INT DEFAULT NULL,
    status VARCHAR(50) NOT NULL,
    manager_response VARCHAR(50),
    hr_employee_reviewer VARCHAR(50),
    manager_reviewer VARCHAR(50),
    PRIMARY KEY(job_seeker_username, job_title , company_name, company_address ,department_code),
    FOREIGN KEY(job_seeker_username) REFERENCES Job_Seekers(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(job_title, company_name, company_address, department_code) REFERENCES Jobs_Available(title, company_name, company_address, department_code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(hr_employee_reviewer) REFERENCES HR_Employees(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(manager_reviewer) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Job_Seeker_Interview_Answers(
    job_seeker VARCHAR(50) NOT NULL,
    id INT NOT NULL,
    answer BIT NOT NULL,
    PRIMARY KEY(job_seeker , id),
    FOREIGN KEY(job_seeker) REFERENCES Job_Seekers(username),
    FOREIGN KEY(id) REFERENCES Interview_Questions(id)
)

CREATE TABLE Projects(
    name VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    manager_creator VARCHAR(50) NOT NULL,
    PRIMARY KEY(name, company_name, company_address),
    FOREIGN KEY(company_name, company_address) REFERENCES Companies(name, address) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(manager_creator) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Employees_Assigned_For_Project(
    project_name VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    employee_assigned VARCHAR(50) NOT NULL,
    manager VARCHAR(50) NOT NULL,
    PRIMARY KEY(project_name, company_name, company_address, employee_assigned),
    FOREIGN KEY(project_name, company_name, company_address) REFERENCES Projects(name, company_name, company_address) ON DELETE CASCADE ON UPDATE CASCADE,
    --REGULAR EMPLOYEE ACTIONS EDITED
    FOREIGN KEY(employee_assigned) REFERENCES Regular_Employees(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(manager) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE Tasks(
    name VARCHAR(50) NOT NULL,
    project_name VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    deadline DATE NOT NULL,
    description VARCHAR(280) NOT NULL,
    status VARCHAR(10),
    manager_creator VARCHAR(50) NOT NULL,
    employee_assigned VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(name, project_name, company_name, company_address),
    --EDITED DELETE ACTIONS FOR PROJECTS
    FOREIGN KEY(project_name, company_name, company_address) REFERENCES Projects(name, company_name, company_address) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(manager_creator) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(employee_assigned) REFERENCES Regular_Employees(username) ON DELETE SET NULL ON UPDATE CASCADE   
)

CREATE TABLE Task_Comments(
    comment VARCHAR(280) NOT NULL,
    task_name VARCHAR(50) NOT NULL,
    project_name VARCHAR(50) NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    PRIMARY KEY(comment, task_name, project_name, company_name, company_address),
    FOREIGN KEY(task_name, project_name, company_name, company_address) REFERENCES Tasks(name, project_name, company_name, company_address) ON DELETE CASCADE ON UPDATE CASCADE,
)

--Requests Part
CREATE TABLE Requests(
    code INT IDENTITY NOT NULL,
    date_created DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_days AS DATEDIFF(DAY , start_date ,end_date),
    manager_decision VARCHAR(50),
    hr_decision VARCHAR(50),
    hr_rejecting_reason VARCHAR(50),
    manager_rejecting_reason VARCHAR(50),
    employee_username VARCHAR(50) NOT NULL,
    manager_reviewer VARCHAR(50),
    hr_employee_reviewer_username VARCHAR(50)
    PRIMARY KEY(code),
    FOREIGN KEY(manager_reviewer) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(hr_employee_reviewer_username) REFERENCES HR_Employees(username) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(employee_username) REFERENCES Staff_Members(username)
)

--CODE IS PRIMARY KEY IN REPLACEMENTS TABLES
CREATE TABLE HR_Replacements(
    code INT NOT NULL,
    hr_username VARCHAR(50) NOT NULL,
    hr_replacement_username VARCHAR(50),
    PRIMARY KEY(code),
    FOREIGN KEY(code) REFERENCES Requests(code) ON DELETE NO ACTION ON UPDATE NO ACTION,
    --USERNAME REFERNCE DELETE NO ACTION
    FOREIGN KEY(hr_username) REFERENCES HR_Employees(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(hr_replacement_username) REFERENCES HR_Employees(username) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Manager_Replacements(
    code INT NOT NULL,
    manager_username VARCHAR(50) NOT NULL,
    manager_replacement_username VARCHAR(50),
    PRIMARY KEY(code),
    FOREIGN KEY(code) REFERENCES Requests(code) ON DELETE NO ACTION ON UPDATE NO ACTION,
    --USERNAME REFERNCE DELETE NO ACTION
    FOREIGN KEY(manager_username) REFERENCES Managers(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(manager_replacement_username) REFERENCES Managers(username) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Regular_Employee_Replacements(
    code INT NOT NULL,
    regular_employee_username VARCHAR(50) NOT NULL,
    regular_employee_replacement_username VARCHAR(50),
    PRIMARY KEY(code),
    FOREIGN KEY(code) REFERENCES Requests(code) ON DELETE NO ACTION ON UPDATE NO ACTION,
    --USERNAME REFERNCE DELETE NO ACTION
    FOREIGN KEY(regular_employee_username) REFERENCES Regular_Employees(username) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(regular_employee_replacement_username) REFERENCES Regular_Employees(username) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Leave_Requests(
    code INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY(code),
    FOREIGN KEY(code) REFERENCES Requests(code) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Business_Requests(
    code INT NOT NULL,
    trip_destination VARCHAR(50) NOT NULL,
    trip_purpose VARCHAR(280) NOT NULL,
    PRIMARY KEY(code),
    FOREIGN KEY(code) REFERENCES Requests(code) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Announcements(
    id INT IDENTITY,
    time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(50) NOT NULL,
    type VARCHAR(50),
    description VARCHAR(200) NOT NULL,
    hr_username VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(hr_username) REFERENCES HR_Employees(username)
)