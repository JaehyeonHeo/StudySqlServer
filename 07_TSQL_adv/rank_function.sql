use sqlDB; 
go 

select dense_rank() over( order by height desc ) as 'Űū ����', userName, addr, height 
	from userTBL; --���� 2�� ���� 3��
select rank() over( order by height desc ) as 'Űū ����', userName, addr, height 
	from userTBL; --���� 2�� ���� 4�� 

select rank() over( partition by addr order by height desc ) as 'Űū ����', userName, addr, height 
	from userTBL; --partition by�� ������ Ű������ ���� 

--PIVOT 
create table pivotTBL 
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTBL values 
('�����', '�ܿ�', 10),
('������', '����', 15),
('�����', '����', 25),
('�����', '��', 3),
('�����', '��', 37),
('������', '�ܿ�', 40),
('�����', '����', 14),
('�����', '�ܿ�', 22),
('������', '����', 64);
go

select * from pivotTBL; 

select * from pivotTBL
	pivot(sum(amount)
		  for season 
		  in ( [��], [����], [����], [�ܿ�])) as resultPivot;

 insert into pivotTBL values 
          ('���ð�', '�ܿ�', 15) ;

--json 
select userID, userName, height from userTBL where height >= 180
	for json auto; 

