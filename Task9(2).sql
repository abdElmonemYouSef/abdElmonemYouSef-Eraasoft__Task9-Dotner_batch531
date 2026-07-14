create database BarownHealthCare
use BarownHealthCare

create table Companies
(	
	CompanyId int primary key identity , 
	CompanyName varchar(30) unique not null,
	City varchar(30) not null , 
	Covernort varchar(30) not null ,
	Street varchar(50) not null 

)

 Create table CompanyPhoneNumbers  (
	PhoneNumber varchar(50)  , 
	CompanyId int references Companies (CompanyId), 
	primary key (PhoneNumber , CompanyId)
 
 )

 create table Doctors(
	DoctorId int primary key identity , 
	specialisation varchar(30) not null , 
	YearsOfExpriences int not null , 
	PhoneNumber varchar(15) not null , 
	Email varchar(100) not null 
 
 )


 create table Druges(
	DrugId int primary key identity , 
	TradeName varchar(30) not null  , 
	srength varchar(10) not null , 
	CompanyId int references Companies(CompanyId) , 
	DoctorId int references Doctors (DoctorId) , 
 )

create table CompaniesPhoneNumbers (
	PhoneNumber varchar(50) not null , 
	CompanyId int references Companies(CompanyId) , 
	primary key (PhoneNumber ,CompanyId ) , 
)	
	
 
 create table Patients(
	PatientId int primary key identity , 
	PatirntName varchar(50) not null, 
	PhoneNumber varchar (15) not null , 
	Email varchar(100) not null , 
	MedicalCardNumber int not null unique, 
	DoctorId int references Doctors(DoctorId)
 
 )

 create table patientGivenDruges (
	DrugId int  references Druges(DrugId),
	PatientId int references Patients (PatientId), 
	primary key (DrugId , PatientId)

 )
 
 