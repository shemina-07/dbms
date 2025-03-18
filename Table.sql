create table jobs
(
job_id int primary key,
job_title varchar(25),
salary int
);
insert into jobs values
(200,'developer',30000),
(300,'web developer',40000),
(400,'android developer',35000),
(500,'tester',55000);
select * from jobs;
select job_title from jobs where job_id>200;
select salary from jobs where job_title='developer';


create table regions
(
region_id int primary key,
region_name varchar(20)
);
insert into regions values
(670034,'Alapuzha'),
(680026,'Thrissur'),
(670024,'Kozhikode');
select * from regions;
select region_name from regions where region_id=680026;

create table countries
(
country_id int primary key,

 region_id int,foreign key (region_id) references regions(region_id) ,
country_name varchar(20)
);
insert into countries values
(1,670034,'India'),
(2,680026,'Sri lanka'),
(3,670024,'Malasia');
select * from countries;
select country_name from countries where region_id=680026;



create table locations
(
location_id int primary key,
street_address varchar(35),
postal_code int,
city varchar(20),
state_province varchar(20),
 country_id int,foreign key (country_id) references countries(country_id) 
);

insert into locations values
(10,'sn nagar',680027,'thrissur','kerala',1),
(20,'koorkenchery',680029,'alapuzha','kerala',2),
(30,'vagayil road',680022,'malapuram','kerala',3);
select * from locations;

create table departments
(
department_id int primary key,
department_name varchar(20),
location_id int,foreign key (location_id) references locations(location_id) 
);
insert into departments values
(450,'chemistry dept',10),
(500,'cs dept',20),
(550,'arts dept',30);
select * from departments;

select * from departments;
update departments set department_name='programming' where department_id=450;
update departments set department_name='finance' where department_id=500;
update departments set department_name='testing' where department_id=550;
select * from dependants;
select * from departments;
select * from employees;


create table employees
(
employee_id int primary key,
first_name varchar(25),
last_name varchar(25),
email varchar(30),
phone_number varchar(15),
hire_date date,
job_id int foreign key(job_id) references jobs(job_id),
salary int,
manager_id int,
department_id int foreign key(department_id) references departments(department_id)
);

insert into employees values
(112,'aiswarya','nair','aiswarya@gmail.com',9645418607,'2025-04-30',300,100000,205,500),
(113,'hana','nasrin','hananasrin28@gmail.com',828140846,'2025-05-28',400,80000,209,550),
(114,'seena','shamsudheen','seenashamsudheen@gmail.com',9567973221,'2025-02-25',500,50000,201,550);

(111,'mariam','noora','mariamnooraaluva@gmail.com',8714283129,'2025-02-26',500,50000,201,550),


select * from employees;

create table dependants
(
dependant_id int primary key,
first_name varchar(25),
last_name varchar(25),
relationship varchar(15),
employee_id int foreign key(employee_id) references employees(employee_id)
);

insert into dependants values
(1000, 'shamla', 's', 'mother', 111),
(2000, 'shamsudheen', 'kadhar', 'father', 114),
(3000, 'hadiq', 'rahman', 'brother', 113),
(4000, 'girija', 'sundharanpilla', 'grandmother', 112);
