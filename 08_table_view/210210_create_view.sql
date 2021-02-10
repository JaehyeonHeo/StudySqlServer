use sqlDB; 
go 

create view v_userTBL 
as 
	select userID, userName, addr from userTBL 
go 

select * from v_userTBL
	where userID = 'LSG';


create view v_userbuyTBL
as
  select u.userID, u.userName, b.prodName, u.addr, u.mobile1 + '-' + left(u.mobile2, 4) + '-'+ right(u.mobile2, 4) as [연락처]
	from userTBL as u 
	inner join buyTBL as b 
	on u.userID = b.userID ; 

