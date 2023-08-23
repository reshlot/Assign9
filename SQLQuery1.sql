
create database Order1DB
use Order1DB

create table Customers
(
	CustId int primary key,
	FirstName nvarchar(50),
	LastName nvarchar(50)
)

insert into Customers values(1,'Jhon','Dae'),
							(2,'James','Smith')
insert into Customers values (3, 'Michael', 'Johnson'),
    (4, 'Emily', 'Williams'),
    (5, 'David', 'Brown'),
    (6, 'Sarah', 'Jones'),
    (7, 'Robert', 'Miller'),
    (8, 'Olivia', 'Davis'),
    (9, 'William', 'Garcia'),
    (10, 'Sophia', 'Martinez');
create table Orders
(
	OrderId int primary key identity(1,1),
	CustId int foreign key references Customers,
	OrderDate datetime ,
	TotalAmount decimal(10,2)
)

create proc PlaceOrder1
@cid int,
@tamt float
as 
insert into Orders(CustId,OrderDate,TotalAmount) values (@cid,GETDATE(),@tamt)

exec PlaceOrder1 1,100.20
select * from Customers
select * from Orders