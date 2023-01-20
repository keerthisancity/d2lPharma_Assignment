Create Database d2hpharmaassignment
 --Begin Step 1
 --Create table Expert with ExpertID (IDENTITY column), Expert Name, Qualification, DOB, DOJ, Hospital, Country, State, City.
use d2hpharmaassignment
Go
Create table tblCountry(
	CountryID int primary key identity(1,1),
	CountryName varchar(200) not null
)
Go
Create table tblState(
	StateID int primary key identity(1,1),
	StateName varchar(200) not null,
	CountryID int foreign key references tblCountry(CountryID)
)
Go
Create table tblCity(
	CityID int primary key identity(1,1),
	CityName varchar(200) not null,
	StateID int foreign key references tblState(StateID)
)
Go
Create table tblExperts(
	ExpertID int primary key identity(1,1),
	ExpertName varchar(200),
	Qualification varchar(50),
	DOB datetime,
	DOJ datetime,
	Country int foreign key references tblCountry(CountryID),
	State int foreign key references tblState(StateID),
	City int foreign key references tblCity(CityID)
)
GO
Insert into tblCountry Values('Austria'),('Belgium'),('Canada'),('Denmark'),('France'),('India'),('Japan')
Go
Insert into tblState Values('Andrapradesh',5),('Bihar',5),('Delhi',5),('Karnataka',5),('Kerala',5),('Tamil Nadu',5),('Telangana',5)
Go
Insert into tblCity Values('Anantapuram',1),('Amaravathi',1),('Vizag',1),('Kurnool',1),('Tirupathi',1),('Chittor',1),('East Godavari',1)
Insert into tblCity Values('Bangalore',1),('Mysore',1),('Tumkur',1),('Mangalore',1),('Coorg',1),('Davanagere',1),('Bidar',1)
Go
--End

--Begin Step 2
--Select * into tblExperts_Temp from tblExperts --- We can use this approach but it will not add constrains
CREATE TABLE [dbo].[tblExperts_temp](
	[ExpertID] [int] IDENTITY(1,1) NOT NULL,
	[ExpertName] [varchar](200) NULL,
	[Qualification] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[DOJ] [datetime] NULL,
	[Hospital] Varchar(200) NULL,
	[Country] [int] NULL,
	[State] [int] NULL,
	[City] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblExperts_temp]  WITH CHECK ADD FOREIGN KEY([Country])
REFERENCES [dbo].[tblCountry] ([CountryID])
GO

ALTER TABLE [dbo].[tblExperts_temp]  WITH CHECK ADD FOREIGN KEY([State])
REFERENCES [dbo].[tblState] ([StateID])
GO

ALTER TABLE [dbo].[tblExperts_temp]  WITH CHECK ADD FOREIGN KEY([City])
REFERENCES [dbo].[tblCity] ([CityID])
GO

Insert into tblExperts_temp Values('	Expert 1	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 2	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 3	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 4	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 5	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 6	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 7	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 8	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 9	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 10	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 11	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 12	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 13	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 14	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 15	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 16	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 17	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 18	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 19	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 20	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 21	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 22	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 23	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 24	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 25	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 26	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 27	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 28	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 29	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 30	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 31	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 32	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 33	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 34	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 35	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 36	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 37	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 38	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 39	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 40	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 41	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 42	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 43	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 44	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 45	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 46	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 47	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 48	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 49	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 50	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 51	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 52	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 53	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 54	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 55	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 56	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 57	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 58	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 59	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 60	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 61	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 62	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 63	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 64	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 65	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 66	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 67	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 68	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 69	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 70	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 71	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 72	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 73	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 74	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 75	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 76	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 77	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 78	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 79	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 80	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 81	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 82	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 83	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 84	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 85	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 86	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 87	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 88	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 89	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 90	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 91	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 92	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 93	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 94	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 95	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 96	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 97	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 98	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 99	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 100	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 101	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 102	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 103	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 104	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 105	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 106	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 107	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 108	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 109	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 110	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 111	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 112	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 113	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 114	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 115	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 116	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 117	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 118	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 119	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 120	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 121	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 122	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 123	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 124	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 125	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 126	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 127	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 128	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 129	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 130	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 131	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 132	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 133	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 134	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 135	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 136	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 137	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 138	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 139	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 140	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 141	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 142	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 143	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 144	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 145	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 146	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 147	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
Insert into tblExperts_temp Values('	Expert 148	 ','MBBS','1993/02/21','2021/01/01','Apollo',6,1,1)
Insert into tblExperts_temp Values('	Expert 149	 ','MBBS MS','1981/03/30','2020/05/23','People Tree',6,1,3)
Insert into tblExperts_temp Values('	Expert 150	 ','MD','1983/01/01','2019/05/05','Seven Hills',6,1,4)
--End

--Begin Step 3

Insert into tblExperts(ExpertName,Qualification,DOB,DOJ,Hospital,Country,State,City)
Select ExpertName,Qualification,DOB,DOJ,Hospital,Country,State,City from tblExperts_temp

