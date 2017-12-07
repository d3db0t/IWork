USE IWork

GO

/*Companies*/
INSERT INTO Companies (name,domain_name,vision,email,field,type,address) 
VALUES ('Apple','apple.com','better future','applesupportdep@apple.com','portable electronic devices','International','WashingtonDC')

INSERT INTO Companies (name,domain_name,vision,email,field,type,address) 
VALUES ('Dell','dell.com','easier life','dellsupportdep@dell.com','portable electronic devices','International','NYC')

INSERT INTO Companies (name,domain_name,vision,email,field,type,address) 
VALUES ('HP','hp.com','faster life','hpsupportdep@hp.com','electronic devices','National','California')


/*Company_Phones*/
INSERT INTO Company_Phones (phone_number, company_name, company_address) 
VALUES ('0112345233', 'Apple', 'WashingtonDC')

INSERT INTO Company_Phones (phone_number, company_name, company_address) 
VALUES ('0100045678', 'Apple', 'WashingtonDC')

INSERT INTO Company_Phones (phone_number, company_name, company_address) 
VALUES ('0142884657', 'Dell', 'NYC')

INSERT INTO Company_Phones (phone_number, company_name, company_address) 
VALUES ('0112356783', 'Dell', 'NYC')

INSERT INTO Company_Phones (phone_number, company_name, company_address) 
VALUES ('0112233223', 'HP', 'California')


/*Departments*/ /*HR Department*/
INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#HR','HR Department','Apple','WashingtonDC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#HR','HR Department','Dell','NYC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#HR','HR Department','HP','California')


/*Departments*/ /*IT Department*/
INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#IT','IT Department','Apple','WashingtonDC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#IT','IT Department','Dell','NYC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#IT','IT Department','HP','California')


/*Departments*/ /*Marketing Department*/
INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#MK','Marketing Department','Apple','WashingtonDC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#MK','Marketing Department','Dell','NYC')

INSERT INTO Departments (code ,name ,company_name, company_address) 
VALUES ('#MK','Marketing Department','HP','California')


/*Users AND Job_Seekers*/
INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('amrtato','amrtato',1,'amr@gmail.com','10/08/1987','Amr','Mostafa','Ahmed')

INSERT INTO Job_Seekers VALUES('amrtato')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Shady_TheBot','121195',11,'shady@gmail.com','10/12/1985','Shady','Ahmed','Tantawy')

INSERT INTO Job_Seekers VALUES('Shady_TheBot')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Omar_Emad','PING',8,'omar@gmail.com','10/09/1988','Omar','Emad','Abdelrehim')

INSERT INTO Job_Seekers VALUES('Omar_Emad')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('hanoos','3455',6,'hanoos@gmail.com','10/08/1990','Ahmed','Hatem','Elmowelhy')

INSERT INTO Job_Seekers VALUES('hanoos')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Yasser_Artist','YaFanan',6,'yasser@gmail.com','10/01/1990','Mohamed','Yasser','Nawar')

INSERT INTO Job_Seekers VALUES('Yasser_Artist')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('HeshamSalah9','NoPass',15,'hesham@gmail.com','10/09/1980','Hesham','Mohamed','Salah')

INSERT INTO Job_Seekers VALUES('HeshamSalah9')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Sheikh_El3arab','$$$$$',1,'ramy@gmail.com','01/04/1996','Ramy','Mohamed','Ismail')

INSERT INTO Job_Seekers VALUES('Sheikh_El3arab')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Samy','yaslamyaslam',3,'sami@gmail.com','12/10/1994','Samy','Mohamed','Sherif')

INSERT INTO Job_Seekers VALUES('Samy')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Chikooo','AtGym',0,'sheeko@gmail.com','10/9/1997','Sherif','Mohamed','Farid')

INSERT INTO Job_Seekers VALUES('Chikooo')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Hussin','MeshMhmElCourseSa7',5,'hussain@gmail.com','01/09/1993','Hussain','Mohamed','Seliem')

INSERT INTO Job_Seekers VALUES('Hussin')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Chewbacca','ChewbaccaMeshShubaka',10,'mostafa@gmail.com','10/07/1990','Mostafa','Ahmed','Sherif')

INSERT INTO Job_Seekers VALUES('Chewbacca')

INSERT INTO Users (username,password,experience_years,email,birth_date,first_name,middle_name,last_name) 
VALUES ('Disho','KefayaTatoB2a',3,'darwish@gmail.com','10/09/1994','Mohamed','Sayed','Darwish')

INSERT INTO Job_Seekers VALUES('Disho')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Lolo', 'FeenElCreativity', 15, 'ali@gmail.com', '01/01/1980', 'Ali', 'Ahmed', 'Kareem')

INSERT INTO Job_Seekers VALUES('Lolo')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Chikoo2', 'sheelGUC', 17, 'sherif@gmail.com', '02/02/1977', 'Sherif', 'Ali', 'Ali')

INSERT INTO Job_Seekers VALUES('Chikoo2')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Kimo', 'FeenElOCD', 10, 'kareem@gmail.com', '03/03/1988', 'Kareem', 'Mohamed', 'Ashraf')

INSERT INTO Job_Seekers VALUES('Kimo')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Anwar_Ali33', '332266', 18, 'anwar@gmail.com', '04/04/1978', 'Anwar', 'Ali', 'Masry')

INSERT INTO Job_Seekers VALUES('Anwar_Ali33')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Shehab11', 'AnaT3bt', 14, 'shehab@gmail.com', '05/05/1991', 'Shehab', 'Sayed', 'Tantawy')

INSERT INTO Job_Seekers VALUES('Shehab11')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Ziko', 'zikoguc', 2, 'ziko@gmail.com', '09/05/1993', 'Zaki', 'Ahmed', 'Metwally')

INSERT INTO Job_Seekers VALUES('Ziko')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('HanaKimo', 'AnaKrehtGUC5las', 2, 'hana@gmail.com', '06/06/1995', 'Hana', 'Kareem', 'Mowelhy')

INSERT INTO Job_Seekers VALUES('HanaKimo')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('kamel2020', 'kimo123', 2, 'kamel@gmail.com', '06/06/1995', 'Kamel', 'Kareem', 'Zaki')

INSERT INTO Job_Seekers VALUES('kamel2020')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Sarah123', 'suso', 10, 'sara@gmail.com', '05/06/1998', 'Sara', 'Mohamed', 'Sayed')

INSERT INTO Job_Seekers VALUES('Sarah123')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Fuffy', '050695', 12, 'farida@gmail.com', '05/06/1995', 'Farida', 'Sherif', 'Sayed')

INSERT INTO Job_Seekers VALUES('Fuffy')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Mariam-Mostafa', 'YaBatatesAnaT3bt', 6, 'mariam@gmail.com', '03/07/1994', 'Mariam', 'Mostafa', 'Ahmed')

INSERT INTO Job_Seekers VALUES('Mariam-Mostafa')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('NadaSaso', 'ElTagdeed7lw', 2, 'nada@gmail.com', '11/11/1997', 'Nada', 'Ashraf', 'Kareem')

INSERT INTO Job_Seekers VALUES('NadaSaso')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Aliaaa', 'Aliaaa222', 0, 'alia@gmail.com', '12/12/1997', 'Alia', 'Shreif', 'Ashraf')

INSERT INTO Job_Seekers VALUES('Aliaaa')

/*More Users*/
/*Users*/
INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Honda', 'edeee', 15, 'honda@gmail.com', '10/10/1978', 'Mohannad', 'Hesham', 'Khalaf')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Maro', 'kofta', 11, 'maro@yahoo.com', '11/12/1980', 'Marwan', 'Alaa', 'Ahmed')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('3os', '7mam', 9, '3os@hotmail.com', '12/01/1982', 'Omar', 'Mohamed', 'AlOsmaly')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Ihab', 'flGbna', 0, 'ihab@yahoo.com', '03/02/1996', 'Mohamed', 'Ihab', 'Sabry')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Han_Solo', 1276, 1, 'hansolo@yahoo.com', '04/05/1995', 'Ahmed', 'Hatem', 'Ahmed')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Mr_Taha', 23334344, 4, 'taha@gmail.com', '07/01/1991', 'Amr', 'Mostafa', 'Ahmed')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Potato', 'jj99', 2, 'potato@hotmail.com', '02/02/1995', 'Amr', 'Mostafa', 'Ibrahim')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('AmrBatates', '000aaa', 13, 'amrbatates@yahoo.com', '03/02/1979', 'Amr', 'Mohamed', 'Aly')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('MarwanAlaa', 330099, 14, 'marwanalaa@gmail.com', '09/10/1978', 'Marwan', 'Alaa', 'Shawky')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('KimoW', 'haram', 10, 'kimow@hotmail.com', '11/12/1984', 'Karim', 'Walid', 'Mohamed')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Batates', 'kfaya', 0, 'batates@yahoo.com', '12/04/1993', 'Amr', 'Ahmed', 'Hussien')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Mo_Yasser', 't3bt', 5, 'moyasser@hotmail.com', '02/08/1990', 'Mohamed', 'Yasser', 'Nawar')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Salah', 111222, 5, 'salah@hotmail.com', '08/08/1991', 'Mohamed', 'Salah', 'Hussien')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Mo_Salah', 333, 4, 'mosalah@hotmail.com', '05/02/1993', 'Mohamed', 'Salah', 'Ghaly')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('ShadShad', 44444555, 1, 'shadshad@protonmail.com', '09/11/1995', 'Shady', 'Ahmed', 'Tantawy')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Messi', 000999111, 22, 'messi@gmail.com', '11/12/1972', 'Lionel', 'Andres', 'Messi')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('MohannadK', 'enough', 16, 'mohannad@gmail.com', '05/08/1975', 'Mohannad', 'Mohamed', 'Khalid')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('ThePinger', 222, 11, 'pinger@gmail.com', '03/09/1982', 'Omar', 'Emad', 'Sabry')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Ramy', 111, 1, 'ramy@yahoo.com', '04/04/1995', 'Ramy', 'Ahmed', 'Ahmed')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Youssef', 'DB', 2, 'youssefe@gmail.com', '04/06/1993', 'Youssef', 'Emad', 'Sabry')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Joe', 'kkk', 3, 'joeee@yahoo.com', '06/04/1993', 'Youssef', 'Emad', 'Hafez')

INSERT INTO Users (username, password, experience_years, email, birth_date, first_name, middle_name, last_name)
VALUES ('Ibrahimovic', 'ok', 6, 'ibra@hotmail.com', '07/06/1987', 'Zlatan', 'Ibrahimovic', 'Besic')

/*More Job_Seekers*/
INSERT INTO Job_Seekers (username)
VALUES ('Honda')

INSERT INTO Job_Seekers (username)
VALUES ('Maro')

INSERT INTO Job_Seekers (username)
VALUES ('3os')

INSERT INTO Job_Seekers (username)
VALUES ('Ihab')

INSERT INTO Job_Seekers (username)
VALUES ('Han_Solo')

INSERT INTO Job_Seekers (username)
VALUES ('Mr_Taha')

INSERT INTO Job_Seekers (username)
VALUES ('Potato')

INSERT INTO Job_Seekers (username)
VALUES ('AmrBatates')

INSERT INTO Job_Seekers (username)
VALUES ('MarwanAlaa')

INSERT INTO Job_Seekers (username)
VALUES ('KimoW')

INSERT INTO Job_Seekers (username)
VALUES ('Batates')

INSERT INTO Job_Seekers (username)
VALUES ('Mo_Yasser')

INSERT INTO Job_Seekers (username)
VALUES ('Salah')

INSERT INTO Job_Seekers (username)
VALUES ('Mo_Salah')

INSERT INTO Job_Seekers (username)
VALUES ('ShadShad')

INSERT INTO Job_Seekers (username)
VALUES ('Messi')

INSERT INTO Job_Seekers (username)
VALUES ('MohannadK')

INSERT INTO Job_Seekers (username)
VALUES ('ThePinger')

INSERT INTO Job_Seekers (username)
VALUES ('Ramy')

INSERT INTO Job_Seekers (username)
VALUES ('Youssef')

INSERT INTO Job_Seekers (username)
VALUES ('Joe')

INSERT INTO Job_Seekers (username)
VALUES ('Ibrahimovic')


/*User_Previous_Jobs*/
INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Honda', 'HR Supervisor', 'Microsoft', 'Develops and administers human resources programs and policies')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Maro', 'Advertising Sales Manager', 'Balabizoo Inc.', 'Ads Sales Manager')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('3os', 'Database Engineer', 'Google', 'Database Engineer')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Mr_Taha', 'HR Adminstrator', 'Vodafone', 'HR Admin')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('AmrBatates', 'HR Adminstartor', 'Orange', 'HR Admin')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('MarwanALaa', 'Traffic Manager', 'Adidas', 'Ads Traffic Manager')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('KimoW', 'Senior Web developer', 'Yahoo', 'Web Developer')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Salah', 'HR Assistant', 'Mcdonalds', 'HR Assistant')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Messi', 'Global Marketing Manager', 'Balabizoo Inc.', 'Marketing Manager')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Mohannadk', 'HR General Manager', 'Nike', 'HR General Manager')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('ThePinger', 'Senior Database Analyst', 'Airbnb', 'Database Engineer')

INSERT INTO User_Previous_Jobs (username, job_title, previous_company, job_description)
VALUES ('Ibrahimovic', 'HR Assistant', 'Etisalat', 'HR Assistant')


/*Jobs_Available*/
/*HR JOBS*/
INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#HR', '08/08/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#HR', '08/08/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 6, 15000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR General Manager', 'Dell', 'NYC', '#HR', '08/08/2018', 8, 'Develops policy and directs and coordinates human resources activities', 'Analayzes wage and salary , develops and maintains HR system ,Identifies legal requirements', 15, 70000.0, 1)

--New
INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR Director', 'Dell', 'NYC', '#HR', '08/08/2018', 8, 'Promotes and implements human resource values', 'Promotes and implements human resource values by planning and managing human resources programs ,directing staff', 15, 170000.0, 0)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#HR', '09/12/2017', 9, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 8)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#HR', '01/01/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 8, 30000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR General Manager', 'Apple', 'WashingtonDC', '#HR', '02/12/2017', 9, 'Develops policy and directs and coordinates human resources activities', 'Analayzes wage and salary , develops and maintains HR system ,Identifies legal requirements', 16, 100000.0, 2)

--New
INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR Director', 'Apple', 'WashingtonDC', '#HR', '02/12/2017', 9, 'Promotes and implements human resource values', 'Promotes and implements human resource values by planning and managing human resources programs ,directing staff', 16, 200000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'HP', 'California', '#HR', '08/01/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 1000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#HR', '07/12/2017', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 5, 12000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR General Manager', 'HP', 'California', '#HR', '08/12/2017', 9, 'Develops policy and directs and coordinates human resources activities', 'Analayzes wage and salary , develops and maintains HR system ,Identifies legal requirements', 12, 50000.0, 1)

--New
INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - HR Director', 'HP', 'California', '#HR', '02/12/2017', 9, 'Promotes and implements human resource values', 'Promotes and implements human resource values by planning and managing human resources programs ,directing staff', 16, 100000.0, 2)

/*MK JOBS*/

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Internet Marketing Specialist', 'Dell', 'NYC', '#MK', '08/12/2017', 8, 'Marketing company business online', 'Marketing company business online through various channels including website, email campaigns and advertising campaigns', 1, 5000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#MK', '08/08/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#MK', '08/08/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 6, 15000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Global Marketing Manager', 'Dell', 'NYC', '#MK', '08/12/2017', 8, 'Responsible for maximizing their firms international market share', 'Responsible for maximizing their firms international market share and profits and requires being aware of global market trends', 6, 15000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Marketing Director', 'Dell', 'NYC', '#MK', '12/12/2017', 8, 'Develops marketing strategy by studying economic indicators', 'Develops marketing strategy by studying economic indicators and tracking changes in supply', 11, 60000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Internet Marketing Specialist', 'Apple', 'WashingtonDC', '#MK', '03/11/2017', 8, 'Marketing company business online', 'Marketing company business online through various channels including website, email campaigns and advertising campaigns', 3, 8000.0, 5)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#MK', '09/12/2017', 9, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 8)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#MK', '01/01/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 8, 30000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Global Marketing Manager', 'Apple', 'WashingtonDC', '#MK', '08/11/2018', 8, 'Responsible for maximizing their firms international market share', 'Responsible for maximizing their firms international market share and profits and requires being aware of global market trends', 7, 80000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Marketing Director', 'Apple', 'WashingtonDC', '#MK', '03/11/2018', 8, 'Develops marketing strategy by studying economic indicators', 'Develops marketing strategy by studying economic indicators and tracking changes in supply', 15, 200000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Internet Marketing Specialist', 'HP', 'California', '#MK', '09/01/2018', 8, 'Marketing company business online', 'Marketing company business online through various channels including website, email campaigns and advertising campaigns', 0, 2000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'HP', 'California', '#MK', '08/01/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 1000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#MK', '07/12/2017', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 5, 12000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Global Marketing Manager', 'HP', 'California', '#MK', '09/01/2018', 8, 'Responsible for maximizing their firms international market share', 'Responsible for maximizing their firms international market share and profits and requires being aware of global market trends', 5, 11000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Marketing Director', 'HP', 'California', '#MK', '09/01/2018', 8, 'Develops marketing strategy by studying economic indicators', 'Develops marketing strategy by studying economic indicators and tracking changes in supply', 10, 50000.0, 1)

/*IT Jobs*/ -- UPDATED
INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Project Manager', 'Dell', 'NYC', '#IT', '01/08/2018', 7, 'Manage projects', 'Assign certain Employees to certain tasks as websites or applications', 15, 80000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Senior Database Administrator', 'Dell', 'NYC', '#IT', '09/08/2018', 7, 'Manage Databases', 'Responsible for maintaining the company database', 11, 100000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#IT', '08/08/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#IT', '08/08/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 6, 15000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT', '12/03/2017', 8, 'Develop Backend of website', 'Have good experience on PHP and SQL', 0, 4000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Application Engineer', 'Dell', 'NYC', '#IT', '12/19/2017', 5, 'Develop apps for company', 'Have good experience on Desktop Applications ', 2, 10000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Project Manager', 'Apple', 'WashingtonDC', '#IT', '01/11/2018', 7, 'Manage projects', 'Assign certain Employees to certain tasks as websites or applications', 11, 150000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Senior Database Administrator', 'Apple', 'WashingtonDC', '#IT', '12/11/2018', 7, 'Manage Databases', 'Responsible for maintaining the company database', 7, 200000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#IT', '09/12/2017', 9, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 2000.0, 8)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#IT', '01/01/2018', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 8, 30000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Junior Web Developer', 'Apple', 'WashingtonDC', '#IT', '01/03/2018', 8, 'Develop Backend of website', 'Have good experience on PHP and SQL', 1, 5000.0, 2)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Application Engineer',  'Apple', 'WashingtonDC' ,'#IT', '02/9/2018', 5, 'Develop apps for company', 'Have good experience on developing IOS Applications and Swift Programming Language', 5, 50000.0, 6)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Project Manager','HP', 'California' , '#IT', '01/11/2018', 7, 'Manage projects', 'Assign certain Employees to certain tasks as websites or applications', 10, 50000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Manager - Senior Database Administrator','HP', 'California' , '#IT', '01/11/2018', 7, 'Manage Databases', 'Responsible for maintaining the company database', 8, 80000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Assistant', 'HP', 'California', '#IT', '08/01/2018', 8, 'HR Manager Assistant', 'Good English Language and Data Entry Skills', 0, 1000.0, 4)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#IT', '07/12/2017', 8, 'Develops and administers human resources programs and policies', 'Ensures human resources strategies align with organizational business goals', 5, 12000.0, 1)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Junior Web Developer', 'HP', 'California', '#IT', '01/03/2018', 8, 'Develop Backend of website', 'Have good experience on PHP and SQL', 1, 2000.0, 9)

INSERT INTO Jobs_Available (title, company_name, company_address, department_code, application_deadline, working_hours, short_description, detailed_description, experience_years, salary, vacancies)
VALUES ('Regular Employee - Application Engineer',  'HP', 'California' ,'#IT', '02/09/2018', 5, 'Develop apps for company', 'Have good experience on developing Desktop Applications', 2, 10000.0, 6)



/*Staff_Members*/ /*Company: Apple*/
INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('amrtato',2000.0,10,'thursday','amrtato@apple.com','WashingtonDC','Apple','#HR','HR - HR Assistant')--HR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Omar_Emad',30000.0,15,'saturday','omaremad@apple.com','WashingtonDC','Apple','#HR','HR - HR Supervisor')--HR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Anwar_Ali33',100000.0,8,'saturday','anwarali33@apple.com','WashingtonDC','Apple','#HR','Manager - HR General Manager')--Manager

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('HanaKimo',5000.0,15,'saturday','hanakimo@apple.com','WashingtonDC','Apple','#IT','Regular Employee - Junior Web Developer')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('kamel2020',5000.0,15,'saturday','kamel2020@apple.com','WashingtonDC','Apple','#IT','Regular Employee - Junior Web Developer')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Shady_TheBot',150000.0,15,'wednesday','shadythebot@apple.com','WashingtonDC','Apple','#IT','Manager - Project Manager')--MANAGER

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('hanoos',8000.0,15,'sunday','hansolo1@apple.com','WashingtonDC','Apple','#MK','Regular Employee - Internet Marketing Specialist')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Lolo',200000.0,15,'sunday','lolo@apple.com','WashingtonDC','Apple','#MK','Manager - Marketing Director')--MANAGER

--NEW
INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Honda', 'Apple', 'WashingtonDC', '#HR', 'Manager - HR Director', 200000.0, 30, 'friday', 'honda@apple.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Maro', 'Apple', 'WashingtonDC', '#MK', 'Manager - Global Marketing Manager', 80000.0, 30, 'friday', 'maro@apple.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('3os', 'Apple', 'WashingtonDC', '#IT', 'Manager - Senior Database Administrator', 200000.0, 25, 'saturday', '3os@apple.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Ihab', 'Apple', 'WashingtonDC', '#MK', 'HR - HR Assistant', 2000.0, 15, 'tuesday', 'ihab@apple.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Han_Solo', 'Apple', 'WashingtonDC', '#MK', 'HR - HR Assistant', 2000.0, 15, 'wednesday', 'hassolo@apple.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Mr_Taha', 'Apple', 'WashingtonDC', '#IT', 'HR - HR Supervisor', 30000.0, 20, 'saturday', 'taha@apple.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Potato', 'Apple', 'WashingtonDC', '#IT', 'HR - HR Assistant', 2000.0, 15, 'saturday', 'potato@apple.com')--HR


/*Staff_Members*/ /*Company: Dell*/
INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Yasser_Artist',1000.05,15,'wednesday','yasser@dell.com','NYC','Dell','#HR','HR - HR Assistant')--HR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('HeshamSalah9',70000.0,15,'friday','hesho@dell.com','NYC','Dell','#HR','Manager - HR General Manager')--MANAGER

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Mariam-Mostafa',15000.0,15,'friday','mariammostafa@dell.com','NYC','Dell','#MK','Manager - Global Marketing Manager')--MANAGER

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('NadaSaso',5000.0,15,'friday','nadasaso@dell.com','NYC','Dell','#MK','Regular Employee - Internet Marketing Specialist')--REGULAR

INSERT INTO  Staff_members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Sheikh_El3arab',5000.0,15,'friday','sheikh@dell.com','NYC','Dell','#MK','Regular Employee - Internet Marketing Specialist')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Samy',10000.0,15,'saturday','samy@dell.com','NYC','Dell','#IT','Regular Employee - Application Engineer')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Chikoo2',80000.0,15,'saturday','chikoo2@dell.com','NYC','Dell','#IT','Manager - Project Manager')--MANAGER

--NEW
INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('AmrBatates', 'Dell', 'NYC', '#HR', 'Manager - HR Director', 170000.0, 30, 'saturday', 'amrbatates@dell.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('MarwanAlaa', 'Dell', 'NYC', '#MK', 'Manager - Marketing Director', 60000.0, 25, 'saturday', 'marwanalaa@dell.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('KimoW', 'Dell', 'NYC', '#IT', 'Manager - Senior Database Administrator', 100000.0, 30, 'saturday', 'kimowalid@dell.com')--MANAGER

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Batates', 'Dell', 'NYC', '#MK', 'HR - HR Assistant', 2000.0, 15, 'saturday', 'batates@dell.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Mo_Yasser', 'Dell', 'NYC', '#MK', 'HR - HR Assistant', 2000.0, 15, 'sunday', 'moyasser@dell.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Salah', 'Dell', 'NYC', '#IT', 'HR - HR Supervisor', 15000.0, 20, 'sunday', 'salah@dell.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Mo_Salah', 'Dell', 'NYC', '#IT', 'HR - HR Assistant', 2000.0, 15, 'sunday', 'mosalah@dell.com')--HR

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('ShadShad', 'Dell', 'NYC', '#HR', 'HR - HR Assistant', 2000.0, 15, 'friday', 'shadshad@dell.com')--HR


/*Staff_Members*/ /*Company: HP*/
INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Chikooo',1000.0,15,'thursday','sheeko44@hp.com','California','HP','#HR','HR - HR Assistant')--HR

INSERT INTO Staff_Members(username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Hussin',12000.0,15,'monday','hussain@hp.com','California','HP','#HR','HR - HR Supervisor')--HR

INSERT INTO Staff_Members(username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Shehab11',50000.0,15,'monday','sheebo@hp.com','California','HP','#HR','Manager - HR General Manager')--MANAGER

INSERT INTO Staff_Members(username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Aliaaa',2000.0,15,'monday','alia45@hp.com','California','HP','#MK','Regular Employee - Internet Marketing Specialist')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Chewbacca',50000.0,15,'sunday','baka33@hp.com','California','HP','#MK','Manager - Marketing Director')--MANAGER

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Disho',10000.0,15,'saturday','mo@hp.com','California','HP','#IT','Regular Employee - Application Engineer')--REGULAR

INSERT INTO Staff_Members (username,salary,annual_leaves,day_off,staff_company_email,company_address,company_name,department_code,job_title) 
VALUES ('Kimo',50000.0,15,'saturday','kimo324@hp.com','California','HP','#IT','Manager - Project Manager')--MANAGER

--NEW
INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Messi', 'HP', 'California', '#HR', 'Manager - HR Director', 100000.0, 30, 'sunday', 'messi@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('MohannadK', 'HP', 'California', '#MK', 'Manager - Global Marketing Manager', 11000.0, 30, 'sunday', 'mohannadk@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('ThePinger', 'HP', 'California', '#IT', 'Manager - Senior Database Administrator', 80000.0, 30, 'sunday', 'thepinger@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Ramy', 'HP', 'California', '#MK', 'HR - HR Assistant', 1000.0, 10, 'monday', 'ramyyyy@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Youssef', 'HP', 'California', '#MK', 'HR - HR Supervisor', 12000.0, 15, 'monday', 'youssef@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Joe', 'HP', 'California', '#IT', 'HR - HR Supervisor', 12000.0, 15, 'monday', 'joe@hp.com')

INSERT INTO Staff_Members (username, company_name, company_address, department_code, job_title, salary, annual_leaves, day_off, staff_company_email)
VALUES ('Ibrahimovic', 'HP', 'California', '#IT', 'HR - HR Supervisor', 12000.0, 20, 'tuesday', 'ibrahimovic@hp.com')


/*HR_Employees*/
INSERT INTO HR_Employees (username) 
VALUES ('amrtato')

INSERT INTO HR_Employees (username) 
VALUES ('Omar_Emad')

INSERT INTO HR_Employees (username) 
VALUES ('Yasser_Artist')

INSERT INTO HR_Employees (username) 
VALUES ('Chikooo')

INSERT INTO HR_Employees (username) 
VALUES ('Hussin')

INSERT INTO HR_Employees (username)
VALUES ('Ihab')

INSERT INTO HR_Employees (username)
VALUES ('Han_Solo')

INSERT INTO HR_Employees (username)
VALUES ('Mr_Taha')

INSERT INTO HR_Employees (username)
VALUES ('Potato')

INSERT INTO HR_Employees (username)
VALUES ('Batates')

INSERT INTO HR_Employees (username)
VALUES ('Mo_Yasser')

INSERT INTO HR_Employees (username)
VALUES ('Salah')

INSERT INTO HR_Employees (username)
VALUES ('Mo_Salah')

INSERT INTO HR_Employees (username)
VALUES ('ShadShad')

INSERT INTO HR_Employees (username)
VALUES ('Ramy')

INSERT INTO HR_Employees (username)
VALUES ('Youssef')

INSERT INTO HR_Employees (username)
VALUES ('Joe')

INSERT INTO HR_Employees (username)
VALUES ('Ibrahimovic')


/*Managers*/
INSERT INTO Managers (username , type) 
VALUES ('Anwar_Ali33' , 'HR')

INSERT INTO Managers (username , type) 
VALUES ('Shady_TheBot' , 'Technical')

INSERT INTO Managers (username , type) 
VALUES ('Lolo' , 'Marketing')

INSERT INTO Managers (username , type) 
VALUES ('HeshamSalah9' , 'HR')

INSERT INTO Managers (username , type) 
VALUES ('Mariam-Mostafa' , 'Marketing')

INSERT INTO Managers (username , type) 
VALUES ('Chikoo2' , 'Technical')

INSERT INTO Managers (username , type) 
VALUES ('Shehab11' , 'HR')

INSERT INTO Managers (username , type) 
VALUES ('Chewbacca' , 'Marketing')

INSERT INTO Managers (username , type) 
VALUES ('Kimo' , 'Technical')

INSERT INTO Managers (username, type)
VALUES ('Honda', 'HR')

INSERT INTO Managers (username, type)
VALUES ('Maro', 'Marketing')

INSERT INTO Managers (username, type)
VALUES ('3os', 'Technical')

INSERT INTO Managers (username, type)
VALUES ('AmrBatates', 'HR')

INSERT INTO Managers (username, type)
VALUES ('MarwanAlaa', 'Marketing')

INSERT INTO Managers (username, type)
VALUES ('KimoW', 'Technical')

INSERT INTO Managers (username, type)
VALUES ('Messi', 'HR')

INSERT INTO Managers (username, type)
VALUES ('MohannadK', 'Marketing')

INSERT INTO Managers (username, type)
VALUES ('ThePinger', 'Technical')



/*Regular_Employees*/
INSERT INTO Regular_Employees (username)
VALUES ('HanaKimo')

INSERT INTO Regular_Employees (username)
VALUES ('kamel2020')

INSERT INTO Regular_Employees (username)
VALUES ('hanoos')

INSERT INTO Regular_Employees (username)
VALUES ('NadaSaso')

INSERT INTO Regular_Employees (username)
VALUES ('Sheikh_El3arab')

INSERT INTO Regular_Employees (username)
VALUES ('Samy')

INSERT INTO Regular_Employees (username)
VALUES ('Aliaaa')

INSERT INTO Regular_Employees (username)
VALUES ('Disho')



/*Emails*/
SET IDENTITY_INSERT Emails ON

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (1,'messi@hp.com','Attendance records', 'Please send me the employees attendance records in last 3 months')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (2,'thepinger@hp.com', 'DB Bugs report', 'October bugs report in the below attatchment')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (3,'salah@dell.com','Attendance Review', 'Please pass by my office tommorow for your attendance review')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (4,'marwanalaa@dell.com',  'Marketing camaign report', 'October month marketing campaign results')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (5,'3os@apple.com', 'Milestone 3', 'Here is your next milestone')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (6,'hanakimo@apple.com','RE: Milestone 3', 'A question regarding milestone 3')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (7,'shadshad@dell.com', 'October attendance ', 'Please send me october attendance records')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (8,'mosalah@dell.com','Working hours review', 'This is last warning sent regarding your working hours')

INSERT INTO Emails (id,sender_email, subject, body)
VALUES (9,'mohannadK@hp.com', 'New marketing plan', 'Here is our new marketing plan for the next 3 months')

SET IDENTITY_INSERT Emails OFF

/*Emails_Recepients*/
INSERT INTO Emails_Recepients (id,sender_email ,recepient_email)
VALUES (1,'messi@hp.com','hussain@hp.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (2,'thepinger@hp.com', 'mo@hp.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (3,'salah@dell.com', 'samy@dell.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (4,'marwanalaa@dell.com','mariammostafa@dell.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (5,'3os@apple.com','hanakimo@apple.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (6,'hanakimo@apple.com', '3os@apple.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (7,'shadshad@dell.com', 'yasser@dell.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (7,'shadshad@dell.com', 'hesho@dell.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (8,'mosalah@dell.com', 'samy@dell.com')

INSERT INTO Emails_Recepients (id,sender_email, recepient_email)
VALUES (9,'mohannadK@hp.com','baka33@hp.com')


/*Attendance*/
INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Yasser_Artist', '12/12/2017', '08:07:40', '15:05:40')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('amrtato', '12/12/2017', '09:05:40', '12:01:01')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Samy', '12/12/2017', '11:01:01', '17:05:06')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Han_Solo', '12/12/2017', '08:02:02', '14:07:09')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Shady_TheBot', '12/12/2017', '07:03:03', '13:10:10')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Honda', '12/11/2017', '08:07:50', '18:30:00')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Maro', '12/11/2017', '09:09:59', '15:20:00')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Ihab', '12/09/2017', '10:09:45', '19:40:00')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Aliaaa', '12/09/2017', '07:08:03', '13:01:00')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Chewbacca', '12/01/2017', '09:11:59', '15:50:13')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('ShadShad', '10/09/2017', '08:30:00', '12:20:11')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Salah', '03/11/2017', '08:32:03', '16:23:11')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Ibrahimovic', '08/11/2017', '09:49:11', '17:24:00')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('Potato', '07/11/2017', '11:50:00', '14:33:22')

INSERT INTO Attendance (username, date, start_time, end_time)
VALUES ('NadaSaso', '09/09/2017', '10:08:13', '17:20:19')



/*HR_Employee_Created_Jobs*/
--HR Department
INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#HR', 'Yasser_Artist')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#HR', 'Yasser_Artist')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - HR General Manager', 'Dell', 'NYC', '#HR', 'Yasser_Artist')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#HR', 'amrtato')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#HR', 'amrtato')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - HR General Manager', 'Apple', 'WashingtonDC', '#HR', 'Omar_Emad')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - HR Director', 'Apple', 'WashingtonDC', '#HR', 'Omar_Emad')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'HP', 'California', '#HR', 'Chikooo')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#HR', 'Chikooo')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - HR General Manager', 'HP', 'California', '#HR', 'Chikooo')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - HR Director', 'HP', 'California', '#HR', 'Chikooo')

--MK Department
INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Internet Marketing Specialist', 'Dell', 'NYC', '#MK', 'Mo_Yasser')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#MK', 'Mo_Yasser')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#MK', 'Mo_Yasser')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Global Marketing Manager', 'Dell', 'NYC', '#MK', 'Mo_Yasser')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Marketing Director', 'Dell', 'NYC', '#MK', 'Mo_Yasser')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Internet Marketing Specialist', 'Apple', 'WashingtonDC', '#MK', 'Ihab')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#MK', 'Ihab')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#MK', 'Ihab')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Global Marketing Manager', 'Apple', 'WashingtonDC', '#MK', 'Han_Solo')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Marketing Director', 'Apple', 'WashingtonDC', '#MK', 'Han_Solo')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'HP', 'California', '#MK', 'Ramy')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#MK', 'Ramy')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Global Marketing Manager', 'HP', 'California', '#MK', 'Youssef')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Marketing Director', 'HP', 'California', '#MK', 'Youssef')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Internet Marketing Specialist', 'HP', 'California', '#MK', 'Youssef')

--IT Department
INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Project Manager', 'Dell', 'NYC', '#IT', 'Mr_Taha')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Senior Database Administrator', 'Dell', 'NYC', '#IT', 'Mr_Taha')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Dell', 'NYC', '#IT', 'Mr_Taha')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Dell', 'NYC', '#IT', 'Mr_Taha')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT', 'Potato')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Application Engineer', 'Dell', 'NYC', '#IT', 'Potato')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Project Manager', 'Apple', 'WashingtonDC', '#IT', 'Mo_Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Senior Database Administrator', 'Apple', 'WashingtonDC', '#IT', 'Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'Apple', 'WashingtonDC', '#IT', 'Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'Apple', 'WashingtonDC', '#IT', 'Mo_Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Junior Web Developer', 'Apple', 'WashingtonDC', '#IT', 'Mo_Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Application Engineer', 'Apple', 'WashingtonDC', '#IT', 'Mo_Salah')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Project Manager', 'HP', 'California', '#IT', 'Joe')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Manager - Senior Database Administrator', 'HP', 'California', '#IT', 'Joe')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Assistant', 'HP', 'California', '#IT', 'Ibrahimovic')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('HR - HR Supervisor', 'HP', 'California', '#IT', 'Ibrahimovic')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Junior Web Developer', 'HP', 'California', '#IT', 'Ibrahimovic')

INSERT INTO HR_Employee_Created_Jobs (job_title, company_name, company_address, department_code, hr_username)
VALUES ('Regular Employee - Application Engineer', 'HP', 'California', '#IT', 'Joe')


/*Job_Applications*/
INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status,hr_employee_reviewer)
VALUES ('Messi', 'Manager - HR General Manager', 'Dell', 'NYC', '#HR', 2, 'HRAccepted', 'ShadShad')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, manager_response, hr_employee_reviewer, manager_reviewer)
VALUES ('Fuffy', 'Manager - HR Director', 'Apple', 'WashingtonDC', '#HR', 2, 'Accepted', 'You are accepted', 'Omar_Emad', 'Honda')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, hr_employee_reviewer)
VALUES ('Fuffy', 'Manager - HR Director', 'HP', 'California', '#HR', 2, 'Rejected','Hussin')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status,hr_employee_reviewer)
VALUES ('Sarah123', 'Manager - Global Marketing Manager', 'Dell', 'NYC', '#MK', 1, 'Rejected','Mo_Yasser')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, hr_employee_reviewer)
VALUES ('Sarah123', 'Manager - Global Marketing Manager', 'Apple', 'WashingtonDC', '#MK', 2, 'HRAccepted','Han_Solo')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, hr_employee_reviewer)
VALUES ('Sarah123', 'Manager - Marketing Director', 'HP', 'California', '#MK', 0, 'HRAccepted','Youssef')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, manager_response, hr_employee_reviewer, manager_reviewer)
VALUES ('Ziko', 'Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT', 2, 'Accepted', 'You are accepted', 'Mo_Salah', 'KimoW')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, hr_employee_reviewer)
VALUES ('Ziko', 'Regular Employee - Junior Web Developer', 'Apple', 'WashingtonDC', '#IT', 0, 'Rejected', 'Potato')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status,hr_employee_reviewer)
VALUES ('Ziko', 'Regular Employee - Application Engineer', 'HP', 'California', '#IT', 1, 'Rejected','Ibrahimovic')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status,hr_employee_reviewer)
VALUES ('Ziko', 'Regular Employee - Junior Web Developer', 'HP', 'California', '#IT', 1, 'HRAccepted','Ibrahimovic')

INSERT INTO Job_Applications (job_seeker_username, job_title, company_name, company_address, department_code, score, status, manager_response, hr_employee_reviewer, manager_reviewer)
VALUES ('Messi', 'Manager - HR Director', 'Apple', 'WashingtonDC', '#HR', 2, 'Accepted', 'You are accepted', 'Omar_Emad', 'Honda')


/*Interview_Questions*/
SET IDENTITY_INSERT Interview_Questions ON
--Dell
INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (1,'The official hiring age is 15', 'HR - HR Assistant', 'Dell', '#HR', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (2,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Dell', '#HR', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (3,'The official hiring age is 15', 'HR - HR Assistant', 'Dell', '#MK', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (4,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Dell', '#MK', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (5,'The official hiring age is 15', 'HR - HR Assistant', 'Dell', '#IT', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (6,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Dell', '#IT', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (7,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Dell', '#HR', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (8,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Dell', '#HR', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (9,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Dell', '#MK', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (10,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Dell', '#MK', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (11,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Dell', '#IT', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (12,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Dell', '#IT', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (13,'A Console Manager is above the HR Manager', 'Manager - HR Director', 'Dell', '#HR', 0, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (14,'Promotion to Head Official at age 18', 'Manager - HR Director', 'Dell', '#HR', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (15,'Console Assistant Manager is equal to a HR Supervisor', 'Manager - HR General Manager', 'Dell', '#HR', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (16,'Promotion to Head Official at age 18', 'Manager - HR General Manager', 'Dell', '#HR', 1, 'NYC')

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (17,'marketing strategy specifies a target market', 'Regular Employee - Internet Marketing Specialist', 'Dell', 'NYC', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (18,'"mass marketing" and "mass marketer" mean the same', 'Regular Employee - Internet Marketing Specialist', 'Dell', 'NYC', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (19,'marketing strategy specifies a target market', 'Manager - Marketing Director', 'Dell', 'NYC', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (20,'"mass marketing" and "mass marketer" mean the same', 'Manager - Marketing Director', 'Dell', 'NYC', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (21,'marketing strategy specifies a target market', 'Manager - Global Marketing Manager', 'Dell', 'NYC', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (22,'"mass marketing" and "mass marketer" mean the same', 'Manager - Global Marketing Manager', 'Dell', 'NYC', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (23,'Is java used in ios programming', 'Regular Employee - Application Engineer', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (24,'Can an abstract method declared final', 'Regular Employee - Application Engineer', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (25,'Is java used in ios programming', 'Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (26,'Can an abstract method declared final', 'Regular Employee - Junior Web Developer', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (27,'Is java used in ios programming', 'Manager - Senior Database Administrator', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (28,'Can an abstract method declared final', 'Manager - Senior Database Administrator', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (29,'Is java used in ios programming', 'Manager - Project Manager', 'Dell', 'NYC', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (30,'Can an abstract method declared final', 'Manager - Project Manager', 'Dell', 'NYC', '#IT', 0)

--Apple
INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (31,'The official hiring age is 15', 'HR - HR Assistant', 'Apple', '#HR', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (32,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Apple', '#HR', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (33,'The official hiring age is 15', 'HR - HR Assistant', 'Apple', '#MK', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (34,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Apple', '#MK', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (35,'The official hiring age is 15', 'HR - HR Assistant', 'Apple', '#IT', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (36,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'Apple', '#IT', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question , title, company_name, department_code, answer, company_address)
VALUES (37,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Apple', '#HR', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (38,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Apple', '#HR', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question , title, company_name, department_code, answer, company_address)
VALUES (39,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Apple', '#MK', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (40,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Apple', '#MK', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (41,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'Apple', '#IT', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (42,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'Apple', '#IT', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (43,'A Console Manager is above the HR Manager', 'Manager - HR Director', 'Apple', '#HR', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (44,'Promotion to Head Official at age 18', 'Manager - HR Director', 'Apple', '#HR', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (45,'Console Assistant Manager is equal to a HR Supervisor', 'Manager - HR General Manager', 'Apple', '#HR', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (46,'Promotion to Head Official at age 18', 'Manager - HR General Manager', 'Apple', '#HR', 1, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (47,'marketing strategy specifies a target market', 'Regular Employee - Internet Marketing Specialist', 'Apple','#MK', 1,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (48,'"mass marketing" and "mass marketer" mean the same', 'Regular Employee - Internet Marketing Specialist', 'Apple','#MK', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (49,'marketing strategy specifies a target market', 'Manager - Marketing Director', 'Apple',  '#MK', 1,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (50,'"mass marketing" and "mass marketer" mean the same', 'Manager - Marketing Director', 'Apple', '#MK', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (51,'marketing strategy specifies a target market', 'Manager - Global Marketing Manager', 'Apple', '#MK', 1,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (52,'"mass marketing" and "mass marketer" mean the same', 'Manager - Global Marketing Manager', 'Apple', '#MK', 0,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (53,'Is java used in ios programming', 'Regular Employee - Application Engineer', 'Apple', '#IT', 0,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (54,'Can an abstract method declared final', 'Regular Employee - Application Engineer', 'Apple', '#IT', 0 ,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (55,'Is java used in ios programming', 'Regular Employee - Junior Web Developer', 'Apple', '#IT', 0,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (56,'Can an abstract method declared final', 'Regular Employee - Junior Web Developer', 'Apple','#IT', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (57,'Is java used in ios programming', 'Manager - Senior Database Administrator', 'Apple','#IT', 0, 'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (58,'Can an abstract method declared final', 'Manager - Senior Database Administrator', 'Apple', '#IT', 0,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (59,'Is java used in ios programming', 'Manager - Project Manager', 'Apple', '#IT', 0,'WashingtonDC')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (60,'Can an abstract method declared final', 'Manager - Project Manager', 'Apple', '#IT', 0,'WashingtonDC')

--HP 
INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (61,'The official hiring age is 15', 'HR - HR Assistant', 'HP', '#HR', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (62,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'HP', '#HR', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (63,'The official hiring age is 15', 'HR - HR Assistant', 'HP', '#MK', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (64,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'HP', '#MK', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (65,'The official hiring age is 15', 'HR - HR Assistant', 'HP', '#IT', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (66,'Promotion to Head Official at age 18', 'HR - HR Assistant', 'HP', '#IT', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (67,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'HP', '#HR', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (68,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'HP', '#HR', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (69,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'HP', '#MK', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (70,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'HP', '#MK', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (71,'A Console Manager is above the HR Manager', 'HR - HR Supervisor', 'HP', '#IT', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (72,'Console Assistant Manager is equal to a HR Supervisor', 'HR - HR Supervisor', 'HP', '#IT', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (73,'A Console Manager is above the HR Manager', 'Manager - HR Director', 'HP', '#HR', 0, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (74,'Promotion to Head Official at age 18', 'Manager - HR Director', 'HP', '#HR', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (75,'Console Assistant Manager is equal to a HR Supervisor', 'Manager - HR General Manager', 'HP', '#HR', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, department_code, answer, company_address)
VALUES (76,'Promotion to Head Official at age 18', 'Manager - HR General Manager', 'HP', '#HR', 1, 'California')

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (77,'marketing strategy specifies a target market', 'Regular Employee - Internet Marketing Specialist', 'HP', 'California', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (78,'"mass marketing" and "mass marketer" mean the same', 'Regular Employee - Internet Marketing Specialist', 'HP', 'California', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (79,'marketing strategy specifies a target market', 'Manager - Marketing Director', 'HP', 'California', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (80,'"mass marketing" and "mass marketer" mean the same', 'Manager - Marketing Director', 'HP', 'California', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (81,'marketing strategy specifies a target market', 'Manager - Global Marketing Manager', 'HP', 'California', '#MK', 1)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (82,'"mass marketing" and "mass marketer" mean the same', 'Manager - Global Marketing Manager', 'HP', 'California', '#MK', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (83,'Is java used in ios programming', 'Regular Employee - Application Engineer', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (84,'Can an abstract method declared final', 'Regular Employee - Application Engineer', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (85,'Is java used in ios programming', 'Regular Employee - Junior Web Developer', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (86,'Can an abstract method declared final', 'Regular Employee - Junior Web Developer', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (87,'Is java used in ios programming', 'Manager - Senior Database Administrator', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (88,'Can an abstract method declared final', 'Manager - Senior Database Administrator', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (89,'Is java used in ios programming', 'Manager - Project Manager', 'HP', 'California', '#IT', 0)

INSERT INTO Interview_Questions (id,question, title, company_name, company_address,department_code, answer)
VALUES (90,'Can an abstract method declared final', 'Manager - Project Manager', 'HP', 'California', '#IT', 0)

SET IDENTITY_INSERT Interview_Questions OFF


/*Job_Seeker_Interview_Answers*/
INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 15, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 16, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 43, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 44, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 73, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Fuffy', 74, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 21, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 22, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 51, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 52, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 79, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Sarah123', 80, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 25, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 26, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 55, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 56, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 83, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Ziko', 84, 1)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Messi', 43, 0)

INSERT INTO Job_Seeker_Interview_Answers (job_seeker, id, answer)
VALUES ('Messi', 44, 1)


/*Projects*/
INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Iphone Release', 'Apple', 'WashingtonDC', '01/01/2017', '01/01/2018', '3os')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Iphone Marketing Plan', 'Apple', 'WashingtonDC', '01/01/2017', '01/01/2018', 'Maro')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Mac Release', 'Apple', 'WashingtonDC', '02/02/2017', '02/02/2018', 'Shady_TheBot')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Laptop Release', 'HP', 'California', '03/03/2017', '08/08/2018', 'ThePinger')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Laptop Marketing plan', 'HP', 'California', '03/03/2017', '08/08/2018', 'MohannadK')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Website', 'HP', 'California', '04/04/2017', '09/09/2018', 'ThePinger')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Laptop Release', 'Dell', 'NYC', '05/05/2017', '10/10/2018', 'KimoW')

INSERT INTO Projects (name, company_name, company_address, start_date, end_date, manager_creator)
VALUES ('New Laptop Marketing plan', 'Dell', 'NYC', '05/05/2017', '10/10/2018', 'MarwanAlaa')

/*Employees_Assigned_For_Project*/
INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Mac Release', 'Apple', 'WashingtonDC', 'Shady_TheBot', 'kamel2020')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Mac Release', 'Apple', 'WashingtonDC', 'Shady_TheBot', 'HanaKimo')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Iphone Release', 'Apple', 'WashingtonDC', '3os', 'HanaKimo')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Iphone Marketing plan', 'Apple', 'WashingtonDC', 'Maro', 'hanoos')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Laptop Release', 'Dell', 'NYC', 'Chikoo2', 'Samy')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Laptop Marketing plan', 'Dell', 'NYC', 'MarwanALaa', 'Sheikh_El3arab')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Laptop Marketing plan', 'Dell', 'NYC', 'MarwanALaa', 'NadaSaso')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Website', 'HP', 'California', 'ThePinger', 'Disho')

INSERT INTO Employees_Assigned_For_Project (project_name, company_name, company_address, manager, employee_assigned)
VALUES ('New Laptop Marketing plan', 'HP', 'California', 'Chewbacca', 'Aliaaa')


/*Tasks*/
INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('New Web Application', 'Apple', 'WashingtonDC', '01/01/2018', 'By the deadline should provide a new backend design of the website', 'Assigned', 'Shady_TheBot', 'kamel2020', 'New Mac Release')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('New Web Application Design', 'Apple', 'WashingtonDC', '01/01/2018', 'By the deadline you should finish the website frontend design', 'Fixed', 'Shady_TheBot', 'HanaKimo', 'New Mac Release')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, project_name)
VALUES ('New App Design', 'Apple', 'WashingtonDC', '01/01/2018', 'By the deadline you should design the app interface', 'Open', '3os', 'New Iphone Release')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('Marketing plan', 'Apple', 'WashingtonDC', '01/01/2018', 'Finish your desired marketing plan', 'Fixed', 'Maro', 'hanoos', 'New Iphone Marketing plan')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('App release', 'Dell', 'NYC', '05/01/2018', 'Finish the new dell app', 'Assigned', 'KimoW', 'Samy', 'New Laptop release')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('Application design', 'Dell', 'NYC', '05/01/2018', 'Finish the app design', 'Closed', 'KimoW', 'Samy', 'New Laptop release')

INSERT INTO Tasks (name, company_name, company_address, deadline, description, status, manager_creator, employee_assigned, project_name)
VALUES ('Marketing plan', 'HP', 'California', '11/12/2017', 'Finish your desired marketing plan', 'Assigned', 'MohannadK', 'Aliaaa', 'New Laptop Marketing plan')


/*Task_Comments*/
INSERT INTO Task_Comments (comment, task_name, project_name, company_name, company_address)
VALUES ('Yla 5alas', 'New Web Application', 'New Mac Release', 'Apple', 'WashingtonDC')

INSERT INTO Task_Comments (comment, task_name, project_name, company_name, company_address)
VALUES ('Yla ybny 5alas', 'Marketing Plan', 'New Iphone Marketing plan', 'Apple', 'WashingtonDC')


/*Requests*/
SET IDENTITY_INSERT Requests ON

INSERT INTO Requests (code,employee_username, date_created, start_date, end_date, manager_reviewer, manager_decision ,hr_decision,hr_employee_reviewer_username)
VALUES (1, 'Sheikh_El3arab','01/01/2017', '01/01/2017', '01/12/2017', 'MarwanAlaa', 'Accepted','Accepted','Mo_Yasser')

INSERT INTO Requests (code,employee_username, date_created, start_date, end_date, manager_reviewer, manager_decision , hr_decision,hr_employee_reviewer_username)
VALUES (2,'HanaKimo', '02/02/2017', '03/15/2017', '03/19/2017', 'Shady_TheBot', 'Accepted','Accepted','Mr_Taha')

INSERT INTO Requests (code,employee_username, date_created, start_date, end_date, manager_reviewer, manager_decision , hr_decision,hr_employee_reviewer_username , hr_rejecting_reason)
VALUES (3, 'Yasser_Artist','03/03/2017', '03/03/2017', '03/10/2017', 'AmrBatates', 'Accepted','Rejected','ShadShad','The company is having many projects')

INSERT INTO Requests (code,employee_username, date_created, start_date, end_date, manager_reviewer,manager_decision)
VALUES (4, 'Shady_TheBot','04/04/2017', '04/04/2017', '04/08/2017', '3os', 'Rejected')

INSERT INTO Requests (code,employee_username, date_created, start_date, end_date, manager_reviewer, manager_decision , hr_decision,hr_employee_reviewer_username)
VALUES (5, 'Chikooo','05/05/2017', '05/05/2017', '05/10/2017', 'Shehab11', 'Accepted','Accepted','Chikooo')

SET IDENTITY_INSERT Requests OFF
/*more Users  for but not used in insertion */

/*HR_Replacements*/

INSERT INTO HR_Replacements (code, hr_username, hr_replacement_username)
VALUES (3, 'Yasser_Artist', 'Batates')

INSERT INTO HR_Replacements (code, hr_username, hr_replacement_username)
VALUES (5, 'Chikooo', 'Hussin')


/*Manager_Replacements*/
INSERT INTO Manager_Replacements (code, manager_username, manager_replacement_username)
VALUES (4, 'Shady_TheBot', '3os')


/*Regular_Employee_Replacements*/
INSERT INTO Regular_Employee_Replacements (code, regular_employee_username, Regular_Employee_Replacement_username)
VALUES (2, 'HanaKimo', 'kamel2020')

INSERT INTO Regular_Employee_Replacements (code, regular_employee_username, Regular_Employee_Replacement_username)
VALUES (1, 'Sheikh_El3arab', 'NadaSaso')


/*Leave_Requests*/
INSERT INTO Leave_Requests (code, type)
VALUES (1, 'sick leave')

INSERT INTO Leave_Requests (code, type)
VALUES (3, 'annual leave')

INSERT INTO Leave_Requests (code, type)
VALUES (5, 'annual leave')

INSERT INTO Leave_Requests (code, type)
VALUES (2, 'sick leave')

/*Business_Requests*/
INSERT INTO Business_Requests (code, trip_destination, trip_purpose)
VALUES (4, 'Paris', 'Conference meeting')


/*Announcment*/
INSERT INTO Announcements (title, type, description, hr_username)
VALUES ('Amr Batates fired' , 'Employee Fired','We are sorry to announce that Amr Batates is fired','ShadShad')



