delimiter //
create procedure handleDivideByZero
(in numerator int,
in denominator int
)
begin
declare result decimal(10,2);
if denominator=0 then
signal sqlstate '45000'
set message_text='Division by zero is not allowed';
else 
set result=numerator/denominator;
select result as divisionResult;
end if ;
end //
delimiter ;
call handleDivideByZero(10,2);
call handleDivideByZero(10,0);