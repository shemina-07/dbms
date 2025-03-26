create table professor 
(
professorID int primary key,
name varchar(255),
department varchar(255)
);
insert into professor values
(1,'Dr.Smith','Physics'),
(2,'Dr.Jhonson','Mathematics');
delimiter //
create trigger restrictProfessorDeletion
before delete on professor for each row
begin
signal sqlstate '45000'
set message_text='Deletion of the records from professor table is not allowed';
end //
delimiter ;
delete from professor where professorID=1;

create table students 
(studentID int primary key,
name varchar(255),
gender enum('male','female')
);
create table studentCounts(
gender enum('male','female')primary key,
count int default 0
);
insert into studentCounts (gender,count)values ('male',0),('female',0);
delimiter //
create trigger updateCountsAfterInsert
after insert on students for each row
begin
if new.gender='male' then
update studentCounts
set count=count+1 where gender='male';
elseif
new.gender='female' then
update studentCounts
set count=count+1 where gender='female';
end if ;
end //
delimiter ;
delimiter //
create trigger updateCountsAfterDelete
after delete on students for each row 
begin
if old.gender='male' then
update studentCounts
set count=count-1 where gender='male';
elseif
old.gender='female' then
update studentCounts
set count=count-1 where gender='female';
end if ;
end //
delimiter ;
insert into students values
(1,'mariam','female'),
(2,'athul','male');
select * from studentCounts;
delete from students where studentID=1;
select * from studentCounts;

create table goldPrices
(
priceID int primary key auto_increment,
goldPrice decimal(10,2),
updatedAt timestamp default current_timestamp on update current_timestamp
);
insert into goldPrices (goldPrice)values(5000.00);
create table goldPriceLog
(
logID int primary key auto_increment,
oldPrice decimal(10,2),
newPrice decimal(10,2),
changedAt timestamp default current_timestamp
);
delimiter //
create trigger logGoldPriceChange before update on goldPrices
for each row
begin
insert into goldPriceLog (oldPrice,newPrice)values (old.goldPrice,new.goldPrice);
end //
delimiter ;
update goldPrices set goldPrice=5200.00 where priceID=1;
select * from goldPriceLog;