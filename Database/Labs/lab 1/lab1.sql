CREATE DATABASE ITI_Company;
USE ITI_Company;

CREATE TABLE Employee(
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20),
    SSN CHAR(9) PRIMARY KEY,
    BDATE DATE NOT NULL,
    Addresss VARCHAR(20),
    Sex CHAR(1),
    SALARY DECIMAL(10,2) NOT NULL,
    SUPERSSN CHAR(9),
    Dno INT,
    FOREIGN KEY (SUPERSSN) REFERENCES Employee(SSN)
);

CREATE TABLE Department(
    Dname VARCHAR(20),
    DNum INT PRIMARY KEY,
    MGRSSN CHAR(9),
    MGRStartDate DATE,
    FOREIGN KEY (MGRSSN) REFERENCES Employee(SSN)
);

ALTER TABLE Employee 
ADD CONSTRAINT FK_Dno FOREIGN KEY (Dno) REFERENCES Department(DNum);

CREATE TABLE Works_for(
    ESSN CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(4,1) NOT NULL,
    FOREIGN KEY (ESSN) REFERENCES Employee(SSN),
    PRIMARY KEY (ESSN, Pno)
);

CREATE TABLE Project (
    Pname VARCHAR(20) NOT NULL,
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50) NOT NULL,
    City VARCHAR(10) NOT NULL,
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Department(DNum)
);

ALTER TABLE Works_for 
ADD CONSTRAINT fk_pnum FOREIGN KEY (Pno) REFERENCES Project(Pnumber);

CREATE TABLE Dependent(
    Essn CHAR(9),
    Dependent_name VARCHAR(20),
    Sex CHAR(1) NOT NULL,
    Bdate DATE NOT NULL,
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES Employee(SSN)
);


INSERT INTO Employee
VALUES ('Ali', 'Kamal', '223344', '1980-05-10', 'Cairo', 'M', 5000.00, NULL, NULL);

INSERT INTO Department 
VALUES ('DP1', 10, '223344', '2005-01-01');


insert into Project  values('AL Solimaniah',100, 'Cairo_Alex Road', 'Alex', 10);

INSERT INTO Works_for values('223344', 100, 10) ;

insert into Dependent values('223344','Hala Saied Ali', 'F', '1970-10-18');

ALTER TABLE Employee 
MODIFY Addresss VARCHAR(100);

INSERT INTO Employee VALUES
('Amr','Omran','321654','1963-09-14','44 Hilopolis.Cairo','M',2500,NULL,NULL);

INSERT INTO Employee VALUES
('Noha','Mohamed','968574','1975-02-01','55 Orabi St. El Mohandiseen.Cairo','F',1600,'321654',NULL),
('Edward','Hanna','512463','1972-08-19','18 Abaas El 3akaad St. Nasr City.Cairo','M',1500,'321654',NULL);



INSERT INTO Department VALUES
('DP2', 20, '968574', '2006-03-01'),
('DP3', 30, '512463', '2006-06-01');

ALTER TABLE Department
MODIFY COLUMN MGRSSN CHAR(9) NOT NULL;

INSERT INTO Employee VALUES
('Ahmed','Ali','112233','1965-01-01','15 Ali fahmy St.Giza','M',1300,'223344',10),
('Hanaa','Sobhy','123456','1973-03-18','38 Abdel Khalik Tharwat St. Downtown.Cairo','F',800,'223344',10),
('Mariam','Adel','669955','1982-06-12','269 El-Haram st. Giza','F',750,'512463',20),
('Maged','Raoof','521634','1980-04-06','18 Kholosi st.Shobra.Cairo','M',1000,'968574',30);

select * from   Employee;

INSERT INTO Project VALUES
('Al Rabwah', 200, '6th of October City', 'Giza', 10),
('Al Rawdah', 300, 'Zaied City', 'Giza', 10),
('Al Rowad', 400, 'Cairo_Faiyom Road', 'Giza', 20),
('Al Rehab', 500, 'Nasr City', 'Cairo', 30),
('Pitcho american', 600, 'Maady', 'Cairo', 30),
('Ebad El Rahman', 700, 'Ring Road', 'Cairo', 20);

INSERT INTO Works_for VALUES
('968574',400,15),
('968574',700,15),
('968574',300,10),
('669955',400,20),
('669955',700,7),
('669955',300,10),
('512463',500,10),
('512463',600,25),
('521634',500,10),
('521634',600,20),
('521634',300,6),
('521634',400,4);


INSERT INTO Dependent VALUES
('112233','Hala Saied Ali','F','1970-10-18'),
('321654','Ramy Amr Omran','M','1990-01-26'),
('321654','Omar Amr Omran','M','1993-03-30'),
('321654','Sanaa Gawish','F','1973-05-16'),
('512463','Sara Edward','F','2001-09-15'),
('512463','Nora Ghaly','F','1976-06-22');


update Employee set Dno = 10 where SSN = '968574' or SSN = '512463';
select * from   Employee;


--   Data Manipulating Language:
-- Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233.

insert into Employee values('Ahmed', 'Faheem', '102672', '2002-10-28', 'Mansoura','M',2000, '112233', 30);


-- Insert another employee with, personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.
insert into Employee
 values('Mohamed', 'Saaf', '102660', '2002-05-28', 'Mansoura','M', 2000,'102672', 30);
 
 
 insert into Employee(Fname,Lname,SSN,BDATE,Addresss,Sex,Dno)
 values('saad', 'saad', '102689', '2002-05-28', 'Mansoura','M', 2000, 30);
-- error salary not null

-- In the department table insert new department called "DEPT IT", 
-- with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
INSERT INTO Department
VALUES ('DEPT IT', 100, '112233', '2006-11-01');

-- Do what is required if you know that: Mrs.Noha Mohamed(SSN=968574)
-- moved to be the manager of the new department (id = 100), and they give you (use your SSN from question1) her position (Dept. 20 manager) 
-- First try to update her record in the department table
-- Update your record to be department 20 manager.
-- Update your friend data (entered in question2) to be in your teamwork (supervised by you)

update Department
set MGRSSN = '968574'
where DNum = 100;

update Department
set MGRStartDate = '2025-12-02'
where DNum = 100;

update Department
set MGRSSN = '102672'
where DNum = 20;

update Department
set MGRStartDate = '2025-12-02'
where DNum = 20;

update Employee
set SuperSSN = '102672', Dno = 20
WHERE SSN = '102660';

-- Unfortunately, the company ended the contract with Mr. Kamel Mohamed (SSN=223344) 
-- so try to delete his data from your database in case you know that your friend will be temporarily in his position.
-- Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees
-- or works in any projects and handle these cases).


select * from Employee where SSN = 223344;  -- no superSSn

select * from Employee where SUPERSSN = 223344;  -- is supevisor of ahmed ali and hanaa

select * from department where MGRSSN = 223344;  -- manger for DP1

select * from Works_for; -- in work for for Pno 100
select * from Dependent where Essn = '223344';
-- start to update

 
 
UPDATE Employee SET SUPERSSN = '102660' WHERE SUPERSSN = '223344';
UPDATE department SET MGRSSN = '102660' WHERE MGRSSN = '223344';
delete from Works_for where ESSN = '223344';
delete from Dependent where Essn = '223344';
delete from Employee where  SSN = '223344';

update Employee set salary= 2000 where ssn = '102672';

-- And your salary has been upgraded by 20 percent of its last value.
update Employee set salary= salary * 1.2 where ssn = '102672';
select * from Employee;



-- Try to create the following Queries:

-- Display all the employees Data.
select * from Employee;

-- Display the employee First name, last name, Salary and Department number
select Fname, Lname, Salary, Dno from  Employee;

-- Display all the projects names, locations and the department which is responsible about it.

select Pname, Plocation, Dnum from Project;


-- If you know that the company policy is to pay an annual commission for each employee 
-- with specific percent equals 10% of his/her annual salary. Display each employee full name 
-- and his annual commission in an ANNUAL COMM column (alias).

select concat(Fname,' ' ,Lname)  as 'full name', Salary*12*.1 as ' ANNUAL COMM'
from Employee;

-- Display the employees Id, name who earns more than 1000 LE monthly.
select ssn, concat(Fname,' ' ,Lname)  as 'full name'
 from Employee where salary > 1000;


-- Display the employees Id, name who earns more than 10000 LE annually.

select ssn, concat(Fname,' ' ,Lname)  as 'full name'
 from Employee where salary*12 > 10000;
 
 -- Display the names and salaries of the female employees 
select  concat(Fname,' ' ,Lname)  as 'full name' , Salary
from  Employee
where Sex = 'F';

-- Display each department id, name which managed by a manager with id equals 968574.
select * from department;
select Dnum, Dname
from department
 where MGRSSN = '968574';
 
 
 -- Display the IDs, names and locations of the pojects which controlled with department 10.
select * from Project;
select * from Project where Dnum = 10;










