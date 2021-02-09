use sqlDB; 
go 

select dense_rank() over( order by height desc ) as '키큰 순서', userName, addr, height 
	from userTBL; --공동 2위 다음 3위
select rank() over( order by height desc ) as '키큰 순서', userName, addr, height 
	from userTBL; --공동 2위 다음 4위 

select rank() over( partition by addr order by height desc ) as '키큰 순서', userName, addr, height 
	from userTBL; --partition by로 지역별 키순위를 만듦 

--PIVOT 
create table pivotTBL 
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTBL values 
('김범수', '겨울', 10),
('윤종신', '여름', 15),
('김범수', '가을', 25),
('김범수', '봄', 3),
('김범수', '봄', 37),
('윤종신', '겨울', 40),
('김범수', '여름', 14),
('김범수', '겨울', 22),
('윤종신', '여름', 64);
go

select * from pivotTBL; 

select * from pivotTBL
	pivot(sum(amount)
		  for season 
		  in ( [봄], [여름], [가을], [겨울])) as resultPivot;

 insert into pivotTBL values 
          ('성시경', '겨울', 15) ;

--json 
select userID, userName, height from userTBL where height >= 180
	for json auto; 

