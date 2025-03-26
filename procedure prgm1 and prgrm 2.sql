create table account
(
account_no int  primary key,
account_holder varchar(20),
balance decimal(10,2)
);
insert into account values
(1,'Alice',10000.00),
(2,'Bob',5000.00);
delimiter //
create procedure deposit_money(in p_account_no int,in p_amount decimal(10,2))
begin
update account
set balance=balance + p_amount where account_no=p_account_no;
select 'Deposit Successful' as message;
end //
delimiter ;
delimiter //
create procedure withdraw_money(in p_account_no int,in p_amount decimal(10,2))
begin
declare current_balance decimal(10,2);
select balance into current_balance from account where account_no=p_account_no;
if current_balance>=p_amount then
update account
set balance = balance-p_amount where account_no=p_account_no;
select 'Withdrawal Successful' as Message;
else
select 'insufficient balance' as Message;
end if;
end //
delimiter ;
delimiter // 
create procedure check_balance(in p_account_no int)
begin
select balance as current_balance from account where account_no=p_account_no;
end //
delimiter ;

call deposit_money(1,2000.00);
call withdraw_money(1,3000.00);
call check_balance(1);


create table products
(
product_id int auto_increment primary key,
product_name varchar(255),
price decimal(10,2)
);
insert into products (product_name,price)values
('product A',200),
('product B',300),
('product C',400);

delimiter //
create procedure updatePrice(in selected_id int)
begin
declare current_price decimal(10,2);
declare exit handler for sqlexception 
begin
select 'An error occurred while updating the price' as ErrorMessage;
end ;
select price into current_price from products where product_id =selected_id;
if current_price is null then
signal sqlstate'45000'
set message_text ='Record not found for the given product_id';
end if;
update products set price=price+100 where product_id=selected_id;
select * from products;
end //
delimiter ;
call updatePrice(1);

