drop table if exists login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

insert into login_details values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);

select * from login_details;

#Question
#Write a query to fetch users who logged 3 or more times consecatively

with cte as
	(select *,
			case when user_name = lead(user_name) over(order by login_id)
				and user_name = lead(user_name,2) over(order by login_id)
			then user_name else null
            end as repeated
	from login_details)
select distinct repeated, login_id, user_name,login_date
from cte
where repeated is not null 
