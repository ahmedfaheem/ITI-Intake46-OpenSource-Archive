#Display the Department id, name and id and the name of its manager.
select DNum, Dname, Fname 
from department 
inner join  employee
on MGRSSN = SSN;

#Display the name of the departments and the name of the projects under its control.

select Pname, Dname 
from department d
inner join project p
on d.Dnum = p.Dnum;

#Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select e.Fname as "Emp Name", d.*
from employee e
inner join dependent d
on e.ssn = d.Essn;

#Display the full data of the employees who is managing any of the company's departments.
select employee.* , department.Dname
from department 
inner join  employee
on MGRSSN = SSN;

#Display the Id, name and location of the projects in Cairo or Alex city.

select Pnumber, Pname, Plocation 
from project
where  City in ('Alex', 'Cairo');

#Display the Projects full data of the projects with a name starts with "a" letter.

select *
from project
where  Pname like 'a%';

#display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

select * 
from employee 
where Dno = 30 and SALARY between 1000 and 2000;


#Retrieve the names of all employees in department 10 
#who works more than or equal 10 hours per week on "AL Rabwah" project.

select distinct Fname 
from employee
inner join works_for
on  ESSN = SSN
inner join project
where  dno = 10 
and  Hours > 10
and  Pname = 'AL Rabwah';


#Find the names of the employees who directly supervised with Kamel Mohamed.

select e.Fname as "Emp Name" , s.Fname as "Supervisor"
from employee e 
inner join  employee s
on e.SUPERSSN = s.SSN 
where  S.Fname = 'Kamel'
AND S.Lname = 'Mohamed';


#For each project, list the project name and the total hours per week (for all employees) spent on that project.

select p.Pname , sum(Hours)
from employee e
inner join works_for w
on e.SSN = w.Essn
inner join project p 
on w.Pno = p.Pnumber
group by  p.Pname;

#Display the data of the department which has the smallest employee ID over all employees' ID.
select d.*
from department d
join employee e
on d.Dnum = e.Dno
where  e.SSN = (
    select MIN(SSN)
    from employee
);

#Retrieve a list of employees and the projects they are working on
select e.Fname , p.Pname
from employee e
inner join works_for w
on e.SSN = w.Essn
inner join project p 
on w.Pno = p.Pnumber




