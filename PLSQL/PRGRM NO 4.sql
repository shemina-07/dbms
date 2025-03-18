create table sailors(
sid int primary key,
name varchar(50),
rating int
);
insert into sailors(sid,name,rating)values
(101,'john',5),
(102,'mary',5),
(103,'alex',5);
delimiter $$
create function getsailorRating(sailor_id int)
returns int
deterministic
begin
declare sailor_rating int;
select rating into sailor_rating
from sailors
where sid=sailor_id;
return sailor_rating;
end $$
delimiter ;
select getsailorRating(101)as rating;

