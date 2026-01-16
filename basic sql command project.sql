create database pro1;
use pro1;
create table employee(
ename varchar(50),
e_id int,
salary int,
joining_date date,
e_type varchar(50));

select * from employee;

insert into employee(ename,e_id,salary,joining_date,e_type)
values("harry",25001,60000,"2025-10-11" ,"full time"),
("ron",25005,55000,"2025-11-22","full time"),
("lily",25006,95000,"2024-11-15","full time"),
("hermoine",25010,85000,"2025-11-19","full time"),
("hagrid",25002,60000,"2024-10-10","part time"),
("snape",25009,90000,"2024-12-02","full time"),
("henry",25004,50000,"2025-12-11","part time"),
("scammander",25009,70000,"2024-12-10","full time");

create table emp_2(
emname varchar(50),
position varchar(50),
branch varchar(50),
mobile_no  int(50),
foreign Key (emname) references employee(ename)
);

select*from emp_2;
insert into emp_2
values("harry","hr","chennai",995266553),
("ron","tl","chennai",995266555),
("lily","hr","banglore",895266554),
("hermoine","tl","chennai",995266556),
("hagrid","member","banglore",895266557),
("snape","tl","banglore",895266551),
("henry","member","chennai",995266552),
("scammander","manager","banglore",795266554);

select ename,salary from employee
where salary>50000;

set sql_safe_updates=1;
update employee
set salary=50000
where ename= "lily";

update employee
set e_id=25003
where ename="scammander";

alter table employeTablese
add constraint unique(e_id);

alter table employee
modify salary int not null;

alter table employee
add constraint exceed check (salary<=200000);

alter table employee
add constraint primary Key(ename);

show keys from emp_2;
select * from emp_2;

select* from employee right join emp_2
on employee.ename=emp_2.emname;
select* from employee inner join emp_2
on employee.ename=emp_2.emname;
select* from employee left join emp_2
on employee.ename=emp_2.emname;

select sum(salary) from employee;

select sum(salary) from employee
where salary>=50000;
select min(salary) from employee;
select avg(salary) from employee;

select max(salary) from employee;
select ename from employee
where salary=(select max(salary) from employee);

select count(ename)from employee;
select concat(emname,position)from emp_2;

select *from employee
where e_type="full time" and joining_date like "2025-__-__";

select *from employee
order by joining_date;
select *from emp_2
order by position desc;

select ename , salary from employee
union all
select position,branch from emp_2;

create view employee_branch as
select emname, branch from emp_2;
select *from employee_branch;

select branch,count(emname) as count from emp_2
group by branch;

delimiter !
create procedure emp()
begin
	select e_id,salary,ename from employee;
end !

delimiter ;

call emp();





