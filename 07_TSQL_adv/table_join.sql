--join (조인) : 두개 이상의 테이블을 서로 묶어서 하나의 결과 집합으로 만들어내는 작업
select * from userTBL;
select * from buyTBL; 

select * from userTBL --기준이 되는 테이블을 먼저 쓴다 
	inner join buyTBL 
	on userTBL.userID = buyTBL.userID
	where buyTBL.prodName = '운동화'

select u.userName, u.addr, 
	CONCAT(u.mobile1,'-', left(u.mobile2,4), '-', right(u.mobile2,4) ) as mobile,
	b.prodName, b.price, b.amount
 from buyTBL as b --코딩을 줄이기위해 buyTBL, userTBL을 각각 b, u로 지정 (as 사용)
 inner join userTBL as u 
 on b.userID = u.userID
 where u.userID = 'JYP'




