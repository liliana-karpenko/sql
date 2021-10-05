
--«Создание таблиц и определение связей между таблицами с помощью SQL-запросов»

alter table Запись
  drop FK_ЗаписьМедперсонал, FK_ЗаписьКарточки, FK_ЗаписьБолезнь
go

alter table Рецепт
  drop FK_РецептЛекарства
go


drop table Рецепт
go
drop table Процедуры
go
drop table Запись
go
drop table Карточки
go
drop table [Вид процедур]
go
drop table Болезнь	
go
drop table Лекарства
go
drop table Медперсонал
go
drop table Специальность
go

create table Специальность
(Код int identity primary key
,Специальность varchar(40) not null 
)

create table Медперсонал
(Код int identity primary key
,[код специальности] int not null references Специальность
,ФИО varchar(40) not null
,[номер телефон] varchar(10) not null unique
)

create table Лекарства
(Код int identity primary key
,[вид препоратов] varchar(40) not null 
)

create table Болезнь
(Код int identity primary key
,название varchar(40) not null 
)

create table [Вид процедур]
(код int identity primary key
,[вид процудур] varchar(40) not null 
)

create table Карточки
(Код int identity primary key
,ФИО varchar(40) not null
,пол varchar(1) not null
,[дата рождения] date not null
,адрес varchar(100) not null
,телефон varchar(10) not null unique
)

create table Запись
(Код int identity primary key
,[Код медперсонала] int not null 
,[Код карточки] int not null 
,[Код болезни] int not null
,[дата, время] datetime not null
,[явка] int not null
)

alter table Запись
  add constraint FK_ЗаписьМедперсонал
  foreign key([Код медперсонала]) references Медперсонал,
  constraint FK_ЗаписьКарточки
  foreign key([Код карточки]) references Карточки,
  constraint FK_ЗаписьБолезнь
  foreign key([Код болезни]) references Болезнь,
  unique ([дата, время], [Код медперсонала] )
go

create table Процедуры
(код int identity primary key
,[код записи] int not null references Запись
,[код вида процедур]  int not null references [Вид процедур]
,[дата, время] datetime not null
)

create table Рецепт
(код int identity primary key
,[код записи] int not null references Запись
,[код лекарства] int not null 
,[дозировка(мг)] int not null default 100
,[срок(дни)] int not null check ([срок(дни)] > 0)
)

alter table Рецепт
add constraint FK_РецептЛекарства
foreign key([Код лекарства]) references Лекарства,
constraint [дозировка(мг)] check ([дозировка(мг)] > 0) 
go



--«Использование SQL-запросов для модификации данных»


Insert into Специальность values
	 ('Терапевт')
	,('оториноларинголог')
	,('хирург')
	,('гинеколог')
	,('ортопед')

Insert into [Медперсонал] values
	 (4, 'Комаров Роман Матвеевич', 315874)
	,(2, 'Лазарева Анна Романовна',458956)
	,(3, 'Смирнова Ульяна Марковна', 315879)
	,(1, 'Гаврилов Егор Никитич', 315696)
	,(3, 'Голубев Сергей Даниилович', 311214)
	,(5, 'Митько Аллёна Сергеевна', 318874)


Insert into Лекарства values
	 ('Слизерин')
	,('Омепразол')
	,('Орвиколд')
	,('Цетрациклин')
	,('Амоксицилин')

Insert into Болезнь values
	 ('ОРВИ')
	,('Ангина')
	,('Грипп')
	,('РПП')
	,('Гастрит')


Insert into [Вид процедур] values
	 ('МРТ')
	,('Анализ крови')
	,('Узи')
	,('Массаж')
	,('Электрофорез')

Insert into Карточки values
	 ('Дюков Елизар Федотович', 'м', '19750612', 'пр. Победы 6', '317533')
	,('Шастин Ким Федорович', 'м', '19600201', 'ул.Мазурова 127Б', '314444')
	,('Шкиряк Семен Алексеевич', 'м', '19641112', 'ул.Советска 12', '312111')
	,('Пургин Ярослав Ульянович', 'м', '19980413', 'ул.Советска 125', '312900')
	,('Костина Рената Феликсовна', 'ж', '19961028', 'ул.Барыкина 45', '316547')


Insert into [Запись] values
	 (3, 1, 1, '2020-12-10 13:00:00',1)
	,(2, 4, 4, '2020-10-10 13:00:00',3)
	,(5, 2, 3, '2020-11-01 11:00:00',4)
	,(3, 2, 2, '2020-09-08 09:23:00',2)
	,(1, 3, 1, '2020-08-11 09:23:00',5)
	,(2, 1, 5, '2020-01-11 14:00:00',1)
	,(3, 4, 1, '2020-06-07 13:20:00',3)


Insert into [Процедуры] values
	 (1, 1, '2019-12-10 09:00:00')
	,(4, 5, '2020-02-03 13:40:00')
	,(1, 1, '2020-09-08 09:23:00')
	,(3, 4, '2020-12-10 11:00:00')
	,(2, 3, '2020-12-05 10:00:00')
	,(3, 5, '2020-07-07 11:00:00')
	,(1, 4, '2020-08-07 12:00:00')
	,(2, 3, '2020-07-01 11:00:00')

Insert into Рецепт values
	 (1, 1, 200, 10)
	,(1, 1, 500, 7)
	,(1, 1, 1000, 14)
	,(1, 1, 1500, 14)
	,(1, 1, 100, 5)
	,(3, 1, 2000, 7)
	,(3, 2, 1000, 5)
	,(3, 1, 150, 10)

Update Карточки set адрес = 'ул.Владимирова 22'
	where адрес = 'ул.Бочкина 9'

Delete from [Лекарства]
	where Код = (Select max(Код) from [Лекарства])



/*

«Создание представлений»

*/


drop view Пациенты_и_их_болезни
go

create view	Пациенты_и_их_болезни
as select ФИО, пол , [дата рождения], адрес, телефон, название
  from Карточки, Болезнь, Запись
    where Карточки.Код = [Код карточки] and Болезнь.код = [Код болезни]
go

select * from Пациенты_и_их_болезни

/*

«Создание простейшей хранимой процедуры»

*/



drop proc время_процедур_пациента
go

create proc время_процедур_пациента @код int
as														   
select Процедуры.[дата, время]
from  Запись, Процедуры
  where [код карточки] = @код and [код записи] = Запись.код
go

execute время_процедур_пациента 2
GO
