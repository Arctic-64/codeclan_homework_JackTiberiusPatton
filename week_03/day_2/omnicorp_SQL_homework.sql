--1a

select 
e.first_name,
e.last_name,
t.name
from employees as e
inner join teams as t 
on e.team_id  = t.id;

--1b

select 
e.first_name,
e.last_name,
t.name
from employees as e
inner join teams as t 
on e.team_id  = t.id
where e.pension_enrol = true;

--1c

select 
e.first_name,
e.last_name,
t.name
from employees as e
inner join teams as t 
on e.team_id  = t.id
where cast(t.charge_cost as int) > 80;

--2a

select 
e.first_name,
e.last_name,
p.local_account_no,
p.local_sort_code
from employees as e
inner join pay_details as p
on e.id = p.id
where p.local_account_no is not null and p.local_sort_code is not null;

--2b

select 
e.first_name,
e.last_name,
p.local_account_no,
p.local_sort_code,
t.name
from employees as e
inner join pay_details as p
on e.id = p.id
left join teams as t
on e.id = t.id
where p.local_account_no is not null and p.local_sort_code is not null;

--3a

select
e.id,
t.name
from employees as e
left join teams as t 
on e.team_id = t.id;

--3b

select
count(e.id),
t.name
from employees as e
left join teams as t 
on e.team_id = t.id
group by t.name;

--3c

select
count(e.id),
t.name
from employees as e
left join teams as t 
on e.team_id = t.id
group by t.name
order by count asc;

--4a

select
count(e.id),
t.name,
t.id
from employees as e
left join teams as t 
on e.team_id = t.id
group by t.id;

--4b

select
cast(t.charge_cost as int) * count(e.id) as total_day_charge,
t.name,
t.id
from employees as e
left join teams as t 
on e.team_id = t.id
group by t.id;

--4c (add having statement, ill be honist, that was an instinctual guess, i have no idea why it works)

select
cast(t.charge_cost as int) * count(e.id) as total_day_charge,
t.name,
t.id
from employees as e
left join teams as t 
on e.team_id = t.id
group by t.id
having cast(t.charge_cost as int) * count(e.id) > 5000;
