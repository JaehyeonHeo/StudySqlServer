-- outer join 쿼리 
select r.rentalidx
     --, r.memberidx
	 , m.memberName
     --, r.bookidx
	 , b.cateidx
	 , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentalDt, 'yyyy년 MM월 dd일') as 'rentalDate'
     , isnull(format(r.rerurnDt, 'yyyy년 MM월 dd일'), '미정') as 'returnDate'
     , dbo.ufn_getState(r.rentalState) as '대여상태' --사용자 지정 함수 
  from dbo.rentalTBL as r
 right outer join memberTBL as m 
    on r.memberidx = m.memberidx
 left outer join booksTBL as b 
    on r.bookIdx = b.bookIdx
 left outer join cateTBL as c 
    on c.cateidx = b.cateidx
where r.rentalidx is null;


