declare @var1 int; 
set @var1 = 100; 

if @var1 = 100 
begin 
	select '@var1 = 100' 
end 

else
begin
	select '@var1 = 100이 아님'
end 

