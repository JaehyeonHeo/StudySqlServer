--join (����) : �ΰ� �̻��� ���̺��� ���� ��� �ϳ��� ��� �������� ������ �۾�
select * from userTBL;
select * from buyTBL; 

select * from userTBL --������ �Ǵ� ���̺��� ���� ���� 
	inner join buyTBL 
	on userTBL.userID = buyTBL.userID
	where buyTBL.prodName = '�ȭ'

select u.userName, u.addr, 
	CONCAT(u.mobile1,'-', left(u.mobile2,4), '-', right(u.mobile2,4) ) as mobile,
	b.prodName, b.price, b.amount
 from buyTBL as b --�ڵ��� ���̱����� buyTBL, userTBL�� ���� b, u�� ���� (as ���)
 inner join userTBL as u 
 on b.userID = u.userID
 where u.userID = 'JYP'




