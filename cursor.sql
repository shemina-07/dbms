create table sailors
(
sid int primary key,
sname varchar(255),
rating int
);
insert into sailors(sid,sname,rating)values
(1,'john',10),
(2,'jane',7),
(3,'mark',8);
delimiter //
create procedure displaySailors()
begin
declare sailor_id int;
declare sailor_rating int;
declare done int default false;
declare sailor_cursor cursor for select sid,rating from sailors;
declare continue handler for not found set done=true;
open sailor_cursor;
read_loop:loop
fetch sailor_cursor into sailor_id,sailor_rating;
if done then 
leave read_loop;
end if;
select sailor_id as sid,sailor_rating as rating;
end loop;
close sailor_cursor;
end //
delimiter //
call displaySailors();

