use tempdb;
go 

create database sqlDB;
go

-- DB ���� 
use sqlDB;
go
create table userTBL --ȸ�����̺�
(
	userID char(8) not null primary key, --����ھ��̵� 
	userName	nvarchar(10) not null, --�̸� 
	birthYear	int not null, --�������
	addr	nchar(2) not null, --���� 
	mobile1		char(3), --�޴��� ����(010~019)
	mobile2		char(8), --�޴��� ������(������-����)
	height		smallint, --Ű
	mDate		date --ȸ�� ������ 
);
go 
create table buyTBL -- �������̺�
(
	num int identity not null primary key, --����(pk)
	userID char(8) not null                --����� ���̵� (FK)
		foreign key references userTBL(userID), 
	prodName	nvarchar(20) not null,    --��ǰ�� 
	groupName	nchar(4), --�з�
	pice	int not null, --�ܰ� 
	amount	smallint not null  --����
);
go