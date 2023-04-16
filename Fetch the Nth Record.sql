drop table if exists employee;
create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'jehan', 'Admin', 4000);
insert into employee values(102, 'kasun', 'HR', 3000);
insert into employee values(103, 'chanaka', 'IT', 4000);
insert into employee values(104, 'ramesh', 'Finance', 6500);
insert into employee values(105, 'udith', 'HR', 3000);
insert into employee values(106, 'nimal',  'Finance', 5000);
insert into employee values(107, 'danushka', 'HR', 7000);
insert into employee values(108, 'kamal', 'Admin', 4000);
insert into employee values(109, 'Sanjaya', 'IT', 6500);
insert into employee values(110, 'Vikum', 'IT', 7000);
insert into employee values(111, 'Malinda', 'IT', 8000);
insert into employee values(112, 'Kelum', 'IT', 10000);
insert into employee values(113, 'Gehan', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chalani', 'IT', 4500);
insert into employee values(116, 'Saduni', 'Finance', 6500);
insert into employee values(117, 'Amali', 'HR', 3500);
insert into employee values(118, 'Taniya', 'Finance', 5500);
insert into employee values(119, 'Chanika', 'HR', 8000);
insert into employee values(120, 'Monika', 'Admin', 5000);
insert into employee values(121, 'Roshani', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'nawfer', 'IT', 8000);
insert into employee values(124, 'janith', 'IT', 11000);

#Question
#Write a query to fetch Nth record subject to emp id

with cte as 
	(select *,
    row_number() over(order by emp_ID desc) as rw_no
    from employee)
select * 
from cte 
where rw_no = 2