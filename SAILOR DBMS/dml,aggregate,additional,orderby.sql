--DML
select * from sailors;
select * from boats;
select * from reserves;
select sname as name,age from sailors;
select * from sailors where rating>8;
select sname as "name" from sailors where rating>7 and age>25;
select bname,color from boats;
select * from boats where color='red';
select s.sname from sailors s,reserves r where s.sid=r.sid and r.bid=103;
select distinct s.sname from sailors s,reserves r,boats b where s.sid=r.sid and r.bid=b.bid and b.color like'red';
select b.color from sailors s,reserves r,boats b where s.sid=r.sid and r.bid=b.bid and s.sname='lubber';
select distinct s.sname from sailors s,reserves r where s.sid=r.sid;
select s.sname from sailors s where s.sid in (select s.sid from sailors s,reserves r,boats b where s.sid=r.sid and b.bid=r.bid group by s.sid having count(b.bid)>1);

--AGGREGATE FUNCTIONS
select count(sid) from sailors;
select count(bid) from reserves;
select count (bid) from boats;
select sum(rating)from sailors;
select sum(distinct age) from sailors;

--avg
select avg(distinct age)from sailors;
select max(age)from sailors;
select min(age) from sailors;

--additional
select avg(age)from sailors where rating=10;
select count(distinct sname)from sailors;
select sname ,age from sailors where age=(select max(age) from sailors);
select count(*)as "no_sailors"from sailors;
select sname from sailors where age>(select max(age) from sailors where rating=10);

--order by
select * from sailors order by sname;
select * from sailors order by sname desc;
select * from sailors order by rating desc;
select * from sailors order by age;
select * from sailors order by rating,age;
