delimiter $$
create procedure findFactorial(in num int,out result BIGINT)
begin 
declare i int default 1;
set result=1;
if num<0 then
set result =NULL;
else
while i<=num do
set result =result*i;
set i=i+1;
end while;
end if;
end $$
delimiter ;
CALL findFactorial(3,@factorial);
select @factorial;
