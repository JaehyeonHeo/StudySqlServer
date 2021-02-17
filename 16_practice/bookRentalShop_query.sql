--실제 회원 정보 불러오기 (레벨순, 이름순)
select memberID, memberName, levels, mobile, email 
  from memberTBL
 where levels <> 'S' --s레벨 제외하기
 order by levels asc, memberName asc; 

select cateidx, bookName, author, 
       interpreter, company, price  
  from booksTBL
 order by price desc;

select * from cateTBL; 



--사용자 정의 함수사용 쿼리
select memberID, 
       concat(right(memberName, 2), ' ',left(memberName, 1)) as '이름 성',
	   dbo.ufn_getlevel(levels) as '회원레벨', 
	   mobile, 
	   upper(email) as '이메일' 
  from memberTBL
 where levels <> 'S' 
 order by levels asc, memberName asc; 



 --책정보, 시스템 함수, 포맷 함수 쿼리 
 SELECT bookidx
      , cateidx
      , concat(N'책제목 -> ', bookName) as bookName
      , author
      , isnull(interpreter, '역자없음') as '번역가' --isnull : 널값 안보이게 
      , company
      , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      , format(price, '#,# 원') as '가격'
  FROM booksTBL

 --책정보 조인
 SELECT b.bookidx
      , b.cateidx
	  , c.cateName
      , b.bookName
      , b.author
      , b.interpreter
      , b.company
  FROM  dbo.booksTBL as b
inner join cateTBL as c 
   on b.cateidx = c.cateidx; 


--대여된 책의 정보 쿼리 조인
SELECT  r.rentalidx
      --, r.memberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      , isnull(format(r.rerurnDt, 'yyyy-MM-dd'), '알수없음') as '반납일'
      , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r 
  inner join booksTBL as b 
	on r.bookidx = b.bookidx
  inner join memberTBL as m 
    on r.memberidx = m.memberidx


--책을 안빌린 회원 조회
SELECT  r.rentalidx
      --, r.memberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r 
  left outer join booksTBL as b 
	on r.bookidx = b.bookidx
  right outer join memberTBL as m 
    on r.memberidx = m.memberidx
  where r.rentalidx is null; 

 --우리 책 대여점에 없는 소설장르 조회
 select  c.cateidx 
	   , c.cateName
	   , b.bookName
   from cateTBL as c 
   left outer join booksTBL as b 
   on c.cateidx = b.cateidx 

/* inner join : 우리 상점을 이용한 사람 조회할 때 사용 
   outer join : 우리 상점을 이용하지 않은 사람을 조회할 때 사용*/
   

			



 

