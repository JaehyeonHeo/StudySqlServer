declare @i int = 0, @hap bigint = 0 ; 

while ( @i <= 100 )
begin 
	if (@i % 7 = 0)
	begin
	  print concat('7의 배수 = ', @i); 
	  set @i += 1; 
	  continue;
	end

	set @hap += @i; 
	set @i += 1; 
end 

print @hap; 
