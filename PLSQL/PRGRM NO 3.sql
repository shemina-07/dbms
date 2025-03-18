delimiter $$
create function sumtwonumbers(num1 int,num2 int)
returns int
deterministic
begin
return num1+num2;
end$$
delimiter ;
select sumtwonumbers(20,20)as result;

