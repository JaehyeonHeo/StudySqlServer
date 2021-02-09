use sqlDB;
go

declare @myVar1 int; 
declare @myVar2 smallint, @myVar3 decimal(10, 6);   --decimal(총자리수, 소수점자리수)
declare @myVar4 char(20); 

set @myVar1 = 5; 
set @myVar2 = 3; 
set @myVar3 = 3.141592; 
set @myVar4 = '가수이름 =>  '; 

select @myVar1; 
select @myVar2 + @myVar3; 
select '100' + @myVar3;                             --데이터베이스에서는 숫자는 알아서 계산, 문자+숫자 = 오류 
select @myVar4, userName from userTBL where height > 180; 

declare @myVar5 tinyint; --255
set @myVar5 = 3; 

select top(@myVar5) userName, height from userTBL order by height desc; 

select @@VERSION;

--
select CONVERT(float, amount) as amount from buyTBL; 
select TRY_CONVERT(float, amount) as amount from buyTBL; 
select avg(CONVERT(float, amount)) as '평균구매개수' from buyTBL; 

select price, amount, price/amount as [단가/수량] from buyTBL; --sql에서 대괄호는 문자로 인식해주는데 정식은 아니므로 사용지양 

--
--'1000' --> 숫자 
SELECT parse('2021년 2월 9일' as date); --글자,숫자 오타나면 데이터 안들어감 
select try_PARSE('2021연 2월 9일' as date); --try_parse 는 오타나면 널값 


select PARSE('123.45' as int); 
select TRY_PARSE('123.45' as int); 

select PARSE('123.45' as decimal(5,2)); 
select TRY_PARSE('123.45' as float); 

select CAST('11' as int); 

--스칼라함수 (단일 리턴 함수)
select GETDATE() as '현재날짜'; 

select year(GETDATE()) as '금년';
select month(GETDATE()) as '이번달';
select day(GETDATE()) as '오늘일';

select ABS(-100); --절대값

select round(3.1415, 2); --반올림 
select round(314.145, -2); 

select round(RAND() * 100, 0); 

select iif(200 > 400, 'true', 'false');

--문자열 함수 (중요!!)
select ascii('a'), ASCII('A');
select char(98), char(66);
select UNICODE('갸'); 
select nchar(45909); 

--진짜 많이 쓰이는 것들!!!!
--문자열 결합 
select CONCAT('SQL', 'Server ', 2019); 

--문자열 시작위치 
select CHARINDEX('server', 'sql server 2019');
--왼쪽에서 글자 추출, 오른쪽에서 글자 추출 
select LEFT('sql server 2019', 3), RIGHT('sql server 2019', 4);
--substing
select SUBSTRING('Hello, world!', 7, 6);
select SUBSTRING('안녕하세요, SQL서버입니다.', 8, 3); 
--len
select len('안녕하세요'), len('Hello world!'); 
--lower, upper
select lower('ABCDEFG'), upper('abcdefg'); 
--lrim, rtrim(여백 없애기)
select ltrim('     Hello, world!     '), 
	   rtrim('     Hello, world!     '), 
		trim('     Hello, world!     ');

--replace 
select REPLACE('(2016년 발표)SQL Server 2016', '2016', '2019');



--format (정말정말정말정말정말 많이 쓰는 함수)
select FORMAT(getdate(), ''); --기본
select FORMAT(getdate(), 'dd/MM/yyyy');
select FORMAT(getdate(), 'yyyy/MM/dd hh:mm:ss:ms'); 
select FORMAT(getdate(), 'yyyy/MM/dd '); 
select FORMAT(getdate(), 'hh/mm/ss');
select getdate();

select CHAR(105); 
select ASCII('a');

select CONCAT('sql', 'server', '2019'); 

select LEFT('adfasdfasdfasdfasdfasdfasdf', 5), RIGHT('adsfasdfasdfadsf', 6);
select SUBSTRING('adfdfkldjlkdf', 5, 2); 

select LEN('adfasdfasdf'); 

select LOWER('KALSDJLKASJD');
select UPPER('adfasdfasdfds'); 

select LTRIM('     adsfasdfasdf'); 
select RTRIM('adfasdfasdf     '); 
select TRIM('          asdfasdfasdf        '); 

select REPLACE('SQL server 2019버전입니다.(2019출시)', '2019', '2020' ); 

select FORMAT(GETDATE(), 'dd/MM/yyyy'); 

select year(getdate()) as '년'; 
select MONTH(getdate()) as '월'; 
select day(getdate()) as '일'; 

select round(rand() * 100, 0) ; 

