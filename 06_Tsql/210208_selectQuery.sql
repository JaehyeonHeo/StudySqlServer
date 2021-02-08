use sqlDB;
go

--이름이 김경호인 사람 조회
select * from userTBL
 where userName = '김경호'; 

--1970년 이후 출생이고 키 182 이상인 사람의 아이디, 이름만 조회 
select userID, userName, height
  from userTBL
 where birthYear >= 1970 
   and height >= 182;

--1970년 이후 출생이거나 키 182 이상인 사람의 아이디, 이름만 조회 
select userID, userName 
  from userTBL
 where birthYear >= 1970 
    or height >= 182;

-- 키가 180~183인 사람만 조회 
select userID, userName, height 
  from userTBL
 where height >= 180 
   and height <= 183;
   select userID, userName, height 
  from userTBL
 where height between 180 and 183;

 -- 지역이 경남, 전남, 전북
 select userID, userName, height 
   from userTBL
  where addr = '경남' 
     or addr = '전남'
     or addr = '경북'; 

select userID, userName, height 
  from userTBL
 where addr in ('경남', '전남', '경북');

 --like문
 select userID, userName, height 
  from userTBL
 where userName like '김%';

 
 select userID, userName, height 
  from userTBL
 where userName like '_종신';

 --SUBQUERY
select userName, height
  from userTBL
 where height > 177;

select userName, height 
  from userTBL 
 where height > 
    ( select height from userTBL where userName = '김경호' ); --177

select userName, height, addr 
  from userTBL 
 where height >= any --조건 중에 하나만 만족하면 됨 
    ( select height from userTBL where addr = '경남' ); --170, 173

select userName, height, addr 
  from userTBL 
 where height >= all --조건 두개 다 만족 해야함 
    ( select height from userTBL where addr = '경남' ); --170, 173


-- order by : 정렬
select userName, mDate 
  from userTBL 
  order by mDate asc; -- asc(오름차순), desc(내림차순) 

select * 
  from userTBL 
  order by userID desc;

--distinct 
select distinct addr 
  from userTBL;

select top(5) * 
  from userTBL 
 order by mDate desc; 

--복사 
select * into buyTBL2 from buyTBL; --복사본에는 pk가 지정 안됨 
select userID, prodName into buyTBL3 from buyTBL;

--GROUP BY 
select userID, amount 
  from buyTBL 
  order by userID; 

select userID, sum(amount) '구매합계'
  from buyTBL 
  group by userID;

--min, max 
select min(height) as '작은키' 
  from userTBL; 

select userID, userName, min(height) as '작은키', max(height) as '큰키' 
  from userTBL 
  group by userID, userName; 

select userID, userName 
from userTBL 
where height = (select min(height) from userTBL)
  or height = (select max(height) from userTBL) ;

--총 데이터 개수 
select count(*) as '회원수' from userTBL; 
select count(*) as '구매내역수' from buyTBL;








  




