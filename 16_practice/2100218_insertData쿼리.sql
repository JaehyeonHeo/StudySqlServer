-- 데이터 입력 
insert into booksTBL 
(
	cateidx
  , bookName
  , author
  , company
  , releaseDate
  , ISBN
  , price
) 
values 
(
	    'N0002'
	  , '순수하지 않은 감각'
	  , '요안나'
	  , '로코코'
	  , '2019-10-02'
	  , '9791135445705'
	  , 12500
); 

--책테이블 위 책정보 중, description, regDate 정보 수정 (update 사용시에는 where절 매우 중요!!!!)
			-- 비긴트랜을 사용하면 롤백을 통해 데이터를 다시 되돌릴 수 있다.
			-- 비긴트랜 사용시 반드시 롤백 또는 커밋을 해야 종료됨 (안하면 데이터수정불가)
begin tran; 

update booksTBL 
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
     , regDate = '2021-02-18' 
 where bookidx = 13


 rollback;
 commit;

 select * from booksTBL; 


 -- 카테고리 입력 (insert into)
 begin tran; 

 insert into cateTBL /*(cateidx, cateName)*/ 
	values ('I0001', '대화/협상')
		 , ('I0002', '성공/처세')					
	     , ('I0003', '시간관리')
		 , ('I0004', '인간관계'); 

rollback; 
commit; 

select * from cateTBL ; 


-- 카테고리 삭제 (delete from)
delete from cateTBL where cateidx  = 'I0003'; 

delete from cateTBL where cateidx in ('I0001', 'I0002'); 
