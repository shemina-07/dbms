delimiter $$
create function getweekdayname(input_date date)
returns varchar(20)
deterministic
begin 
return dayname(input_date);
end $$
delimiter ;
select getweekdayname('2025-03-18')as weekday;