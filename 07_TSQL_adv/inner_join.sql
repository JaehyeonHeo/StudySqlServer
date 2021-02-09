select  s.id, s.stdName, c.clubName, c.description 
	from stdTBL as s 
	inner join clTBL as c
	on s.id = c.id
	inner join registerTBL as r 
	on r.std_id = s.id 