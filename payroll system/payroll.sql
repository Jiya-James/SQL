create database Payroll;
use Payroll;

Create TABLE EMPLOYEES(employee_id int auto_increment primary key,
employee_name varchar(255) not null,
department varchar(100),
position varchar(100),
hire_date date,
base_salary decimal(10,2));

CREATE TABLE ATTENDANCE(attendance_id int auto_increment primary key,
employee_id int,foreign key(employee_id) references EMPLOYEES(employee_id),
attendance_date date,status enum('PRESENT','ABSENT','LEAVE'));

CREATE TABLE SALARIES(salaryid int auto_increment primary key,
employee_id int,foreign key(employee_id) references EMPLOYEES(employee_id),
base_salary decimal(10,2),
bonus decimal(10,2),
deductions decimal(10,2),
month varchar(20),
year int);

create TABLE PAYROLL(payroll_id int auto_increment primary key,
employee_id int,foreign key(employee_id) references EMPLOYEES(employee_id),
total_salary decimal(10,2),
payment_date date);

insert into EMPLOYEES(employee_name,department,position,hire_date,base_salary)
VALUES('JIYA','IT','ASSITANT MANGER','2019-12-04',15000);
insert into EMPLOYEES(employee_name,department,position,hire_date,base_salary)
VALUES('ANGEL','IT','DEPUTY MANGER','2025-12-04',20000);
insert into EMPLOYEES(employee_name,department,position,hire_date,base_salary)
VALUES('ANJANA','ACCOUNTS','TRAINEE','2026-01-04',10000);
insert into EMPLOYEES(employee_name,department,position,hire_date,base_salary)
VALUES('SNEHA','ADMIN','ASSITANT MANGER','2021-09-08',18000);
insert into EMPLOYEES(employee_name,department,position,hire_date,base_salary)
VALUES('MALU','LEGAL','ASSITANT MANGER','2024-02-08',19000);

INSERT INTO ATTENDANCE(employee_id,attendance_date,status) VALUES(1,'2026-03-02','present');
INSERT INTO ATTENDANCE(employee_id,attendance_date,status) VALUES(2,'2026-03-02','present');
INSERT INTO ATTENDANCE(employee_id,attendance_date,status) VALUES(3,'2026-03-02','absent');
INSERT INTO ATTENDANCE(employee_id,attendance_date,status) VALUES(4,'2026-03-02','absent');
INSERT INTO ATTENDANCE(employee_id,attendance_date,status) VALUES(5,'2026-03-02','leave');

insert into salaries(employee_id,
base_salary,bonus,deductions,month,year) values(1,15000,500,100,'february',2026);
insert into salaries(employee_id,
base_salary,
bonus,
deductions,
month,
year) values(2,20000,500,100,'february',2026);
insert into salaries(employee_id,
base_salary,bonus,deductions,month,year) values(3,10000,500,100,'february',2026);
insert into salaries(employee_id,
base_salary,bonus,deductions,month,year) values(4,18000,600,100,'february',2026);
insert into salaries(employee_id,
base_salary,bonus,deductions,month,year) values(5,19000,700,100,'february',2026);

insert into payroll(employee_id,total_salary,
payment_date ) values(1,40000,'2026-02-28');
insert into payroll(employee_id,total_salary,
payment_date ) values(2,45000,'2026-02-28');
insert into payroll(employee_id,total_salary,
payment_date ) values(3,25000,'2026-02-28');
insert into payroll(employee_id,total_salary,
payment_date ) values(4,30000,'2026-02-28');
insert into payroll(employee_id,total_salary,
payment_date ) values(5,35000,'2026-02-28');

select * from employees;
SELECT * FROM PAYROLL;
update employees set department='information technology' where employee_id=1;
update employees set position='DEPUTY MANAGER' WHERE EMPLOYEE_ID=4;

DELETE FROM PAYROLL WHERE EMPLOYEE_ID=5;
SELECT * FROM PAYROLL;

SELECT * FROM ATTENDANCE WHERE attendance_date='2026-03-02';

SELECT base_salary+bonus-deductions AS TOTAL_SALARY FROM SALARIES WHERE EMPLOYEE_ID=2;

UPDATE SALARIES SET BONUS=1000 WHERE EMPLOYEE_ID=1;
UPDATE SALARIES SET DEDUCTIONS=70 WHERE EMPLOYEE_ID=1;
SELECT * FROM SALARIES;

SELECT E.EMPLOYEE_NAME,P.TOTAL_SALARY,P.PAYMENT_DATE FROM EMPLOYEES E
JOIN PAYROLL P ON E.EMPLOYEE_ID=P.EMPLOYEE_ID;

SELECT E.EMPLOYEE_NAME,S.base_salary,S.bonus,S.deductions,S.base_salary+S.bonus-S.deductions AS
 TOTAL_SALARY FROM EMPLOYEES E JOIN
SALARIES S ON E.EMPLOYEE_ID=S.EMPLOYEE_ID;

SELECT E.EMPLOYEE_NAME,E.POSITION,E.DEPARTMENT,P.TOTAL_SALARY,
A.STATUS,A.ATTENDANCE_DATE FROM EMPLOYEES E JOIN ATTENDANCE A ON 
A.EMPLOYEE_ID=E.EMPLOYEE_ID JOIN PAYROLL P ON P.EMPLOYEE_ID=E.EMPLOYEE_ID;





