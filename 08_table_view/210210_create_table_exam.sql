/*
use sqlDB ;
go 
*/
--create table testTBL (num int); 
--drop table testTBL; 

use tempdb; 
go 
/*
drop database tableDB; 
go 
create database tableDB; 
*/

use tableDB; 
go 
drop table buyTBL, userTBL; --자식 테이블을 먼저 지우고 부모 테이블을 지워야 지워진다! 
go

create table userTBL
(
	userID		char(8)			not null	primary key,					--아이디	
	userName	nvarchar(10)	not null,									--이름
	birthYear	int				not null	default year(getdate()),		--출생년도
	addr		nchar(2)		not null	default '서울',					--지역
	mobile1		char(3)			null,										--폰번호 앞
	mobile2		char(8)			null,										--폰번호 뒤
	height		smallint		null		default 170,					--키 
	email		varchar(150)	not null	unique,							--이메일 추가 21.02.10. 14:25 
	mDate		date			null										--회원가입일 
);
go 

create table buyTBL
(
	num			int				not null	identity(1,1) primary key,		--순번(PK)
	userID		char(8)			not null
				foreign key references userTBL(userID),						--아이디
	prodName	nchar(6)		not null,									--품명
	groupName	nchar(4)		null,										--분류
	price		int				not null,									--단가
	amount		smallint		not null									--수량
);
go

