use sqlDB;
go

--�̸��� ���ȣ�� ��� ��ȸ
select * from userTBL
 where userName = '���ȣ'; 

--1970�� ���� ����̰� Ű 182 �̻��� ����� ���̵�, �̸��� ��ȸ 
select userID, userName, height
  from userTBL
 where birthYear >= 1970 
   and height >= 182;

--1970�� ���� ����̰ų� Ű 182 �̻��� ����� ���̵�, �̸��� ��ȸ 
select userID, userName 
  from userTBL
 where birthYear >= 1970 
    or height >= 182;

-- Ű�� 180~183�� ����� ��ȸ 
select userID, userName, height 
  from userTBL
 where height >= 180 
   and height <= 183;
   select userID, userName, height 
  from userTBL
 where height between 180 and 183;

 -- ������ �泲, ����, ����
 select userID, userName, height 
   from userTBL
  where addr = '�泲' 
     or addr = '����'
     or addr = '���'; 

select userID, userName, height 
  from userTBL
 where addr in ('�泲', '����', '���');

 --like��
 select userID, userName, height 
  from userTBL
 where userName like '��%';

 
 select userID, userName, height 
  from userTBL
 where userName like '_����';

 --SUBQUERY
select userName, height
  from userTBL
 where height > 177;

select userName, height 
  from userTBL 
 where height > 
    ( select height from userTBL where userName = '���ȣ' ); --177

select userName, height, addr 
  from userTBL 
 where height >= any --���� �߿� �ϳ��� �����ϸ� �� 
    ( select height from userTBL where addr = '�泲' ); --170, 173

select userName, height, addr 
  from userTBL 
 where height >= all --���� �ΰ� �� ���� �ؾ��� 
    ( select height from userTBL where addr = '�泲' ); --170, 173


-- order by : ����
select userName, mDate 
  from userTBL 
  order by mDate asc; -- asc(��������), desc(��������) 

select * 
  from userTBL 
  order by userID desc;

--distinct 
select distinct addr 
  from userTBL;

select top(5) * 
  from userTBL 
 order by mDate desc; 

--���� 
select * into buyTBL2 from buyTBL; --���纻���� pk�� ���� �ȵ� 
select userID, prodName into buyTBL3 from buyTBL;

--GROUP BY 
select userID, amount 
  from buyTBL 
  order by userID; 

select userID, sum(amount) '�����հ�'
  from buyTBL 
  group by userID;

--min, max 
select min(height) as '����Ű' 
  from userTBL; 

select userID, userName, min(height) as '����Ű', max(height) as 'ūŰ' 
  from userTBL 
  group by userID, userName; 

select userID, userName 
from userTBL 
where height = (select min(height) from userTBL)
  or height = (select max(height) from userTBL) ;

--�� ������ ���� 
select count(*) as 'ȸ����' from userTBL; 
select count(*) as '���ų�����' from buyTBL;








  




