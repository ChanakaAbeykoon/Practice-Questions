drop table if exists patient_logs;
create table patient_logs
(
  account_id int,
  date date,
  patient_id int
);

insert into patient_logs values (1,'2020-01-02', 100);
insert into patient_logs values (1,'2020-01-27', 200);
insert into patient_logs values (2,'2020-01-01', 300);
insert into patient_logs values (2,'2020-01-21', 400);
insert into patient_logs values (2,'2020-01-21', 300);
insert into patient_logs values (2,'2020-01-01', 500);
insert into patient_logs values (3,'2020-01-20', 400);
insert into patient_logs values (1,'2020-03-04', 500);
insert into patient_logs values (3,'2020-01-20', 450);

select * from patient_logs;
with cte1 as
		(select distinct monthname(date) as months, account_id, patient_id
		from patient_logs),
	cte2 as
		(select months, account_id, count(patient_id) as no_of_unique_patients
        from cte1
        group by months, account_id),
	cte3 as 
		(select *, rank() over(partition by months order by account_id) as rnk
        from cte2)
select months, account_id, no_of_unique_patients from cte3
where rnk<3
         