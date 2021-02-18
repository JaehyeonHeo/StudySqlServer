--1번 문항
--1-1
select lower(email) as 'email'
	 , Mobile
	 , Names
	 , Addr
from membertbl 
order by Names desc;

--1-2
select names
	 , author
	 , releaseDate
	 , price
from bookstbl

--2번 문항
--2-1
select concat(right(names,2), ', ', left(names, 1)) as '변경이름'
     , levels
	 , substring(Addr,0,3) as '도시'
	 , lower(Email) as '이메일'
from membertbl
where Idx <= 10;

--2-2
select Idx
     , concat(N'제목 : ',Names) as 'Names'
	 , concat(N'저자 > ',Author) as 'Author'
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일'
	 , ISBN
	 , format(Price, '#,#원') as '가격'
  from bookstbl
 order by idx desc  

--3번 문항
--3-1
SELECT b.Idx as '번호'
     , d.Division as '장르번호'
	 , d.Names as '장르'
	 , b.Names as '책제목'
	 , b.Author as '저자'
  FROM  bookstbl as b
inner join divtbl as d
   on b.Division = d.Division
   where d.Division = 'B002';

--3-2
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
from membertbl as m
left outer join rentaltbl as r 
on m.Idx = r.memberIdx
where rentalDate is null;

--4번 문항
--4-1
begin tran; 

 insert into divtbl  
	values ('I002', '자기개발서')
		  

rollback; 

commit; 

select * from divtbl ;

--4-2
begin tran; 

 update membertbl 
   set Addr = '부산시 해운대구'
     , Mobile = '010-6683-7732' 
 where Idx = 26

rollback; 

commit; 

select * from membertbl ;

--5번 문항
select d.Names
     , sum(b.Price) as '총합계금액'
from bookstbl as b
inner join divtbl as d 
on b.Division = d.Division
group by d.Names
with rollup; 
