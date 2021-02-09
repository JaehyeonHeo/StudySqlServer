use sqlDB;
go

declare @myVar1 int; 
declare @myVar2 smallint, @myVar3 decimal(10, 6);   --decimal(총자리수, 소수점자리수)
declare @myVar4 char(20); 

set @myVar1 = 5; 
set @myVar2 = 3; 
set @myVar3 = 3.141592; 
set @myVar4 = '가수이름 =>  '; 

select @myVar1; 
select @myVar2 + @myVar3; 
select '100' + @myVar3;                             --데이터베이스에서는 숫자는 알아서 계산, 문자+숫자 = 오류 
select @myVar4, userName from userTBL where height > 180; 

declare @myVar5 tinyint; --255
set @myVar5 = 3; 

select top(@myVar5) userName, height from userTBL order by height desc; 

select @@VERSION;

