declare @year int; 
set @year = 1987; 

if @year = 1987 
begin 
	select * from userTBL where birthYear = 1987;
end 
else
begin
	print 'no ';
end