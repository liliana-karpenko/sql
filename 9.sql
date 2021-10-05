
--��������� ������ � ����������� ������ ����� ��������� � ������� SQL-��������

alter table ������
  drop FK_�����������������, FK_��������������, FK_�������������
go

alter table ������
  drop FK_���������������
go


drop table ������
go
drop table ���������
go
drop table ������
go
drop table ��������
go
drop table [��� ��������]
go
drop table �������	
go
drop table ���������
go
drop table �����������
go
drop table �������������
go

create table �������������
(��� int identity primary key
,������������� varchar(40) not null 
)

create table �����������
(��� int identity primary key
,[��� �������������] int not null references �������������
,��� varchar(40) not null
,[����� �������] varchar(10) not null unique
)

create table ���������
(��� int identity primary key
,[��� ����������] varchar(40) not null 
)

create table �������
(��� int identity primary key
,�������� varchar(40) not null 
)

create table [��� ��������]
(��� int identity primary key
,[��� ��������] varchar(40) not null 
)

create table ��������
(��� int identity primary key
,��� varchar(40) not null
,��� varchar(1) not null
,[���� ��������] date not null
,����� varchar(100) not null
,������� varchar(10) not null unique
)

create table ������
(��� int identity primary key
,[��� ������������] int not null 
,[��� ��������] int not null 
,[��� �������] int not null
,[����, �����] datetime not null
,[����] int not null
)

alter table ������
  add constraint FK_�����������������
  foreign key([��� ������������]) references �����������,
  constraint FK_��������������
  foreign key([��� ��������]) references ��������,
  constraint FK_�������������
  foreign key([��� �������]) references �������,
  unique ([����, �����], [��� ������������] )
go

create table ���������
(��� int identity primary key
,[��� ������] int not null references ������
,[��� ���� ��������]  int not null references [��� ��������]
,[����, �����] datetime not null
)

create table ������
(��� int identity primary key
,[��� ������] int not null references ������
,[��� ���������] int not null 
,[���������(��)] int not null default 100
,[����(���)] int not null check ([����(���)] > 0)
)

alter table ������
add constraint FK_���������������
foreign key([��� ���������]) references ���������,
constraint [���������(��)] check ([���������(��)] > 0) 
go



--�������������� SQL-�������� ��� ����������� �������


Insert into ������������� values
	 ('��������')
	,('�����������������')
	,('������')
	,('���������')
	,('�������')

Insert into [�����������] values
	 (4, '������� ����� ���������', 315874)
	,(2, '�������� ���� ���������',458956)
	,(3, '�������� ������ ��������', 315879)
	,(1, '�������� ���� �������', 315696)
	,(3, '������� ������ ����������', 311214)
	,(5, '������ ����� ���������', 318874)


Insert into ��������� values
	 ('��������')
	,('���������')
	,('��������')
	,('�����������')
	,('�����������')

Insert into ������� values
	 ('����')
	,('������')
	,('�����')
	,('���')
	,('�������')


Insert into [��� ��������] values
	 ('���')
	,('������ �����')
	,('���')
	,('������')
	,('������������')

Insert into �������� values
	 ('����� ������ ���������', '�', '19750612', '��. ������ 6', '317533')
	,('������ ��� ���������', '�', '19600201', '��.�������� 127�', '314444')
	,('������ ����� ����������', '�', '19641112', '��.�������� 12', '312111')
	,('������ ������� ���������', '�', '19980413', '��.�������� 125', '312900')
	,('������� ������ ����������', '�', '19961028', '��.�������� 45', '316547')


Insert into [������] values
	 (3, 1, 1, '2020-12-10 13:00:00',1)
	,(2, 4, 4, '2020-10-10 13:00:00',3)
	,(5, 2, 3, '2020-11-01 11:00:00',4)
	,(3, 2, 2, '2020-09-08 09:23:00',2)
	,(1, 3, 1, '2020-08-11 09:23:00',5)
	,(2, 1, 5, '2020-01-11 14:00:00',1)
	,(3, 4, 1, '2020-06-07 13:20:00',3)


Insert into [���������] values
	 (1, 1, '2019-12-10 09:00:00')
	,(4, 5, '2020-02-03 13:40:00')
	,(1, 1, '2020-09-08 09:23:00')
	,(3, 4, '2020-12-10 11:00:00')
	,(2, 3, '2020-12-05 10:00:00')
	,(3, 5, '2020-07-07 11:00:00')
	,(1, 4, '2020-08-07 12:00:00')
	,(2, 3, '2020-07-01 11:00:00')

Insert into ������ values
	 (1, 1, 200, 10)
	,(1, 1, 500, 7)
	,(1, 1, 1000, 14)
	,(1, 1, 1500, 14)
	,(1, 1, 100, 5)
	,(3, 1, 2000, 7)
	,(3, 2, 1000, 5)
	,(3, 1, 150, 10)

Update �������� set ����� = '��.����������� 22'
	where ����� = '��.������� 9'

Delete from [���������]
	where ��� = (Select max(���) from [���������])



/*

��������� �������������

*/


drop view ��������_�_��_�������
go

create view	��������_�_��_�������
as select ���, ��� , [���� ��������], �����, �������, ��������
  from ��������, �������, ������
    where ��������.��� = [��� ��������] and �������.��� = [��� �������]
go

select * from ��������_�_��_�������

/*

��������� ���������� �������� ����������

*/



drop proc �����_��������_��������
go

create proc �����_��������_�������� @��� int
as														   
select ���������.[����, �����]
from  ������, ���������
  where [��� ��������] = @��� and [��� ������] = ������.���
go

execute �����_��������_�������� 2
GO
