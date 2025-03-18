create table sailors
(
sid int primary key,
sname varchar(25),
rating int,
age float
);
insert into sailors values
(22,'Dustin',7,45),
(29,'Brutus',1,33),
(31,'Lubber',8,55.5),
(32,'Dustin',8,25.5),
(58,'Dustin',10,35),
(64,'Dustin',7,35),
(71,'Dustin',10,16),
(74,'Dustin',9,35),
(85,'Dustin',3,25.5),
(95,'Dustin',3,63.5);
update sailors set sname='Andy' where sid=32;
update sailors set sname='Rusty' where sid=58;
update sailors set sname='Horataio' where sid=64;
update sailors set sname='Zorba' where sid=71;
update sailors set sname='Horataio' where sid=74;
update sailors set sname='Art' where sid=85;
update sailors set sname='Bob' where sid=95;

select * from sailors;
create table boats
(
bid int primary key,
bname varchar(25),
color varchar(15)
);
insert into boats values
(101,'Interlake','blue'),
(102,'Interlake','red'),
(103,'Clipper','green'),
(104,'Marine','red');

create table reserves
(
sid int,foreign key(sid) references sailors(sid),
bid int,foreign key(bid) references boats(bid),
day date
);

insert into reserves values
(22,101,'10-10-98'),
(22,102,'10-10-98'),
(22,103,'08-10-98'),
(22,104,'07-10-98'),
(31,102,'10-11-98'),
(31,103,'06-11-98'),
(31,104,'12-11-98'),
(64,101,'05-09-98'),
(64,102,'08-09-98'),
(74,103,'08-09-98');
select * from reserves;