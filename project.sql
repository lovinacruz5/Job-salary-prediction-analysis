create database project;

use project;

describe job_salary_prediction_dataset;

select * from job_salary_prediction_dataset;

select count(*) from job_salary_prediction_dataset;

select sum(skills_count) from job_salary_prediction_dataset;

select min(skills_count) from job_salary_prediction_dataset;

select max(skills_count) from job_salary_prediction_dataset;

select max(experience_years) from job_salary_prediction_dataset;

select education_level,sum(skills_count) as skill_count from job_salary_prediction_dataset
group by education_level;

select industry,min(salary) as salary from job_salary_prediction_dataset
group by industry;

select industry,max(salary) as salary from job_salary_prediction_dataset
group by industry;

select job_title,sum(experience_years) as total_experience from job_salary_prediction_dataset 
group by job_title;

select job_title,sum(certifications) as certificate from job_salary_prediction_dataset 
where location="Australia"
group by job_title
having certificate>=1800;

# average salary by job role
select job_title,round(avg(salary),2) as avg_salary from job_salary_prediction_dataset
group by job_title;

# total salary by industry
select industry,sum(salary) as count from job_salary_prediction_dataset
group by industry;

# count of employees by company size
select company_size,count(*) as count from job_salary_prediction_dataset
group by company_size;

# top 5 highest salary by job_title
select job_title,sum(salary) as top_10 from job_salary_prediction_dataset
group by job_title
order by top_10 desc
limit 5;

# lowest salary job
select job_title,sum(salary) as low_salary from job_salary_prediction_dataset
group by job_title
order by low_salary
limit 1;

# top 5 job title by experience year
select job_title,sum(experience_years) as total_experience from job_salary_prediction_dataset
group by job_title order by total_experience desc 
limit 5;

select job_title,round(avg(salary),2) as avg_salary from job_salary_prediction_dataset
where location='Canada'
group by job_title
having avg_salary >= 50000;

# Subqueries
select industry,salary from job_salary_prediction_dataset
where salary >= (select min(salary) from job_salary_prediction_dataset);

select industry,location,salary from job_salary_prediction_dataset
where salary >= (select max(salary) from job_salary_prediction_dataset);

# Case statement
select job_title,experience_years,
case
when experience_years >= 15 then 'High experience'
when experience_years >= 10 then 'Medium experience'
else 'Low experience'
end as top_based
from job_salary_prediction_dataset;

# Rank
select education_level,salary,
rank() over (order by salary desc) as salary_rank
from job_salary_prediction_dataset;

# Joins
# Customer table
create table customer
(customer_id int,customer_name varchar(50),city varchar(50));

insert into customer values 
(1,'Asha','Kochi'),
(2,'Rahul','Delhi'),
(3,'Meena','Mumbai'),
(4,'John','Bangalore'),
(5,'Fathima','Chennai');

# Order table
create table orders
(order_id int,customer_id int,product varchar(40),amount int);

insert into orders values
(101,1,'Laptop',50000),
(102,2,'Mobile',20000),
(103,2,'Tablet',15000),
(104,6,'Headphones',3000),
(105,3,'Monitor',12000);

 select * from customer;
 select * from orders;
 
 # Inner join
 select * from customer as c
 join orders as o
 on c.customer_id = o.customer_id;
 
 # Left join
 select * from customer as c
 left join orders as o
 on c.customer_id = o.customer_id;
 
 # Right join
 select * from customer as c
 right join orders as o
 on c.customer_id = o.customer_id;
 
 # Full outer join
 select * from customer as c
 left join orders as o
 on c.customer_id = o.customer_id
 union
 select * from customer as c
 right join orders as o
 on c.customer_id = o.customer_id;