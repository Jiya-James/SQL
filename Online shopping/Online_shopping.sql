create database if not exists Online_shop;
use Online_shop;

CREATE TABLE PRODUCTS(ProductID int auto_increment primary key,
name varchar(40),price decimal(10,2),stock int,category varchar(40));

CREATE TABLE CUSTOMERS(CustomerID int auto_increment primary key,
name varchar(40) not null,email varchar(40),phone varchar(15));

CREATE TABLE ORDERS(OrderID int auto_increment primary key,CustomerID int,order_date date,
totalamount decimal(10,2),foreign key(CustomerID) 
REFERENCES CUSTOMERS(CustomerID));

CREATE TABLE orderdetails(Orderdetailid int auto_increment primary key,
OrderID int,foreign key(OrderID) references ORDERS(OrderID),ProductID int,
foreign key(ProductID) references PRODUCTS(ProductID),quantity int);

INSERT INTO PRODUCTS(name,price,stock,category) 
values('T-Shirt',100,50,1);
INSERT INTO PRODUCTS(name,price,stock,category) values ('Churidar',800,40,2);
insert into products(name,price,stock,category) values ('Top',600,30,3);
insert into products(name,price,stock,category) values ('Pants',700,40,4);
insert into products(name,price,stock,category) values ('Dupatta',300,20,5);
insert into products(name,price,stock,category) values ('Saree',1000.99,300,6);
insert into products(name,price,stock,category) values ('palazo pant',400,100,7);
insert into products(name,price,stock,category) values ('blouse',400,100,8);
insert into products(name,price,stock,category) values ('Churidar material',1500,50,9);
insert into products(name,price,stock,category) values ('scarf',700,46,10);

select * from products;

insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('ARUN','ARUN@GMAIL.COM','1234567890');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('AMAL','AMAL@GMAIL.COM','5415434438');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('AJAL','AJAL@GMAIL.COM','454445454');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('VIHAAN','VIHAAN@GMAIL.COM','12647457666');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('ACHU','ACHU@GMAIL.COM','6425696422');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('LIYA','LIYA@GMAIL.COM','7642356789');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('SHINO','SHINO@GMAIL.COM','6343563777');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('USHA','USHA@GMAIL.COM','5463275432');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('ANJI','ANJI@GMAIL.COM','45764323344');
insert into CUSTOMERS(NAME,EMAIL,PHONE) VALUES('ALLU','ALLU@GMAIL.COM','7532222455');

INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(1,'2026-02-28',5900);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(2,'2026-01-23',8970);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(3,'2025-12-23',6500);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(4,'2026-03-02',5600);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(5,'2026-02-27',6700);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(6,'2026-02-20',4900);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(7,'2026-01-03',3000);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(8,'2025-12-02',2000);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(9,'2026-03-01',1000);
INSERT INTO ORDERS(CustomerID,order_date,totalamount) VALUES(10,'2026-02-15',2200);

SELECT * FROM ORDERS;

insert into orderdetails(OrderID,ProductID,quantity) values(1,1,100);
insert into orderdetails(OrderID,ProductID,quantity) values(2,2,500);
insert into orderdetails(OrderID,ProductID,quantity) values(3,3,900);
insert into orderdetails(OrderID,ProductID,quantity) values(4,4,700);
insert into orderdetails(OrderID,ProductID,quantity) values(5,5,200);
insert into orderdetails(OrderID,ProductID,quantity) values(6,6,560);
insert into orderdetails(OrderID,ProductID,quantity) values(7,7,999);
insert into orderdetails(OrderID,ProductID,quantity) values(8,8,880);
insert into orderdetails(OrderID,ProductID,quantity) values(9,9,790);
insert into orderdetails(OrderID,ProductID,quantity) values(10,10,760);

select * from orderdetails;

select p.name,p.price,ord.quantity from products p join orderdetails ord 
on p.ProductID=ord.ProductID order by ord.quantity desc limit 5;

select c.name,ord.order_date,ord.totalamount from customers c join orders ord 
on c.CustomerID=ord.CustomerID where ord.order_date >= current_date-interval 30 day;

select sum(totalamount) as Total_Revenue from orders;


