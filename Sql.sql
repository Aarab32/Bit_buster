create database ecommerce;
use ecommerce;
create table User(
userId int auto_increament primary key,
userName varchar(100) not null,
userEmail varchar(100) not null unique,
userPassword varchar(50) not null,
usephone varchar(50),
userpic varchar(500),
userAddress varchar(1000));


create table Category(
categoryId int(10) not null primary key unique,
categoryTitle varchar(50),
categoryDiscription varchar(1000));

create table Product(
Pid int(10) primary key unique,
pName varchar(50),
pDesc varchar(400),
pPhoto varchar(50),
pPrice int(9),
pDiscount int(3),
pQuantity int(6));
