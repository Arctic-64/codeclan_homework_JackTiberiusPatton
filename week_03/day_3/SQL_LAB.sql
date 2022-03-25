--q1

select
count(*)
from employees
where salary is null and grade is null;

--q2

select
concat(first_name,' ',last_name),
department
from employees
order by department, last_name;

--q3

select 
salary
from employees
where last_name like ~ '^A.*'
order by salary desc nulls last
limit 10;

--q4

select
department,
count(*)
from employees
where start_date between '2003-01-01' and '2003-12-31'
group by department;

--q5

select
department,
fte_hours,
count(id)
from employees
group by department, fte_hours
order by department, fte_hours asc;


--q6

select 
count(id),
pension_enrol 
from employees
group by pension_enrol

--q7

select *
from employees
where department = 'Accounting' and pension_enrol = false 
order by salary desc nulls last
limit 1;

--q8

select 
count(id),
avg(salary),
country
from employees
group by country
having count(id) >30 
order by avg(salary) desc;

--q9

--q16
select
department,
sum(cast(grade = '1'as int))/cast(count(id) as real)
from employees
group by department;




