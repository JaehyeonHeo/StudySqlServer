use sqlDB;

/*create table bankBook (
	uName nvarchar(10),
	umoney int, 
		constraint CK_money
		check (uMoney >= 0) 
);
go 
insert into bankBook values (N'구매자', 1000); 
insert into	bankBook values (N'판매자', 0); 
*/

begin try
	begin tran
	update bankBook set uMoney = umoney - 500 where uname = N'구매자'; 
	update bankBook set uMoney = umoney + 500 where uname = N'판매자'; 
	commit tran
end try 
begin catch 
	rollback
end catch 
	select * from bankBook; 

begin try 
	begin tran
	update bankBook set umoney = umoney - 600 where uName = N'구매자';
	update bankBook set umoney = umoney + 600 where uName = N'판매자'; 
	commit tran
end try


begin catch 
	rollback 
end catch

select * from bankBook; 
