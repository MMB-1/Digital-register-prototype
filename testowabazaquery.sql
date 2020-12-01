create database testowabaza
use testowabaza

create table informacje
(
	id int identity (1,1) primary key not null,
	firstName varchar (30) not null,
	secondName varchar (30) not null,
	phoneNumber varchar(9) check(len(phoneNumber)=9)
)