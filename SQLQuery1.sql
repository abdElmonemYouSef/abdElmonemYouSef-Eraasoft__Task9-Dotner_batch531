create database Task9Db
use Task9DB 


--part 1 :
--create a table Employees with columns: Id, FirstName, LastName, Salary.

create table Employees (
	Id int primary key identity ,
	FirstName varchar(50) not null, 
	LastName varchar(50) not null, 
	Salary decimal(7,2) 
)

-- 1- Create a stored procedure named GetAllEmployees that selects all rows from Employees.
go
Create procedure SP_GetAllFromEmployees 
as 
begin 
select * from Employees 
end
	
exec SP_GetAllFromEmployees 


-- 2- Create a stored procedure GetHighSalaryEmployees with one input parameter @MinSalary which Select all employees with Salary > @MinSalary
go
create procedure SP_GetHighSalaryEmployees @MinSalary decimal (7,2)
as 
begin
	select* from Employees 
	where Salary > @MinSalary
end 


exec SP_GetHighSalaryEmployees 7000


-- 3- Create AddEmployee SP with @FirstName, @LastName, @Salary which Insert a new row into Employees. 
go
create procedure SP_insertNewEmployee  @FirstName varchar(50), @LastName varchar(50), @Salary decimal(7 , 2)
as
begin
	insert into Employees (FirstName , LastName , Salary)
	values (@FirstName , @LastName , @Salary)
end

exec SP_insertNewEmployee 'Mohamed' , 'Hamed' , 45675 ;


--part 2 :
--Create a table EmployeeLog(Id, EmployeeId, Action, ActionDate).
--create AFTER INSERT Trigger which Automatically log when a new employee is added.  

create table EmployeeLog(
	id int primary key identity , 
	EmployeeId int not null , 
	Action varchar(50) not null , 
	ActionDate datetime not null 
)

go
create trigger TR_NewEmployeeAddedLog
on Employees
after insert
as
begin 
	insert into EmployeeLog
	select 
		i.Id, 
		'New Employee Added',
		GETDATE() 

	from 
		inserted i 
end 

	



exec SP_insertNewEmployee 'Yassin' , 'Youssef' , 23456 ;
select * from EmployeeLog

