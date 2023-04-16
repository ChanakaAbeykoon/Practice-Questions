drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'amal', 'amal@gmail.com'),
(2, 'kamal', 'kamal@gmail.com'),
(3, 'sunil', 'sunil@gmail.com'),
(4, 'nimal', 'nimal@gmail.com'),
(5, 'nimal', 'nimal@gmail.com');

select * from users;

#Question
#Write a SQL Query to fetch all the duplicate records in a table

with cte as
		(select *,
		row_number() over(partition by user_name order by user_id) as rw_no
		from users
		order by user_id)
select user_id,user_name,email
from cte
where rw_no <>1


