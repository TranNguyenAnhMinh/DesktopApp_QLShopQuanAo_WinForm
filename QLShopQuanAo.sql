create database QLShopQuanAo;
go
use QLShopQuanAo;
go
create table Accounts
(
ID char(20) primary key,
AccountName char(50),
Pass char(30),
FullName nvarchar(1000),
PhoneNumber char(500),
Email char(500),
Duty nvarchar(300),
StartingDate datetime,
Stt char(50)
);
go

 go
 create table Categories
 (
 ID char(20) primary key,
 CateName nvarchar(100)
 );
 go
  create table Products
  (
  ID char(20) PRIMARY key,
  CategoryID char(20),
  ProductName nvarchar(1000),
  ImportPrice int,
  ExportPrice int,
  Size char(10),
  Color nvarchar(100),
  ImportNumber int,
  Remained int,
  ImportDate datetime,
  Unit nvarchar(100),
  FOREIGN key (CategoryID) references Categories(ID)
  );
  go


CREATE TABLE Bills
(
	ID char(20) PRIMARY KEY,
	EstablishedDate datetime,
	Amount int,
	ProductID char(20),
	Size char(10),
    Color nvarchar(100),
	Quantity int,
	FOREIGN KEY (ProductID) references Products(ID)
)

GO

-------------------------------------------------------------------
--====================== Nhập dữ lẹo cho bảng =====================
-------------------------------------------------------------------
--Bảng Account
SET DATEFORMAT dmy;
INSERT	INTO	Accounts (ID, AccountName, Pass, FullName, PhoneNumber, Email, Duty, StartingDate, Stt)
		VALUES	('F01', 'dtqnhu', 'nhu00001', N'Đặng Thị Quỳnh Như', '0356474872', 'nhudtq@gmail.com', N'Quản Lý', 23/07/2019,'Active'),
				('E01', 'tnaminh', 'minh0001', N'Trần Nguyễn Ánh Minh', '0923682454', 'minhtna@gmail.com', N'Nhân Viên', 16/11/2020,NULL),
				('E02', 'ntnha', 'nha00001', N'Nguyễn Thanh Nhã', '0369172553', 'nhant@gmail.com', N'Nhân Viên', 07/04/2021,'Active')

--Bảng Category
INSERT	INTO	Categories(ID, CateName)
		VALUES	('A', N'Áo'),
				('Q', N'Quần')
				

--Bảng Product
SET DATEFORMAT dmy;
INSERT	INTO	Products (ID, CategoryID, ProductName, ImportPrice, ExportPrice, Size, Color, ImportNumber, Remained, ImportDate, Unit)
		VALUES	('SP0001', 'A', N'Áo Thun in hình Mỹ Diệu', 150000, 190000, 'XL', N'Trắng', 50, 4, 23/05/2023, N'Cái'),
				('SP0002', 'Q', N'Quần Ống Loa', 190000, 220000, 'L', N'Đen', 16, 15, 03/09/2022, N'Cái'),
				('SP0003', 'Q', N'Quần Jean Ống Rộng', 200000, 300000, 'L', N'Xanh', 55, 17, 16/05/2023, N'Cái'),
				('SP0004', 'A', N'Áo Khoác Thể Thao Bomber', 240000, 350000, 'XL', N'Đen', 34, 5, 28/11/2021, N'Cái'),
				('SP0005', 'A', N'Áo Crop Nhung', 110000, 150000, 'M', N'Trắng', 34, 15, 17/04/2020, N'Cái'),
				('SP0007', 'A', N'Áo Sơ Mi Trắng', 150000, 220000, 'L', N'Trắng', 56, 5, 22/03/2019, N'Cái'),
				('SP0008', 'Q', N'Quần Lửng', 100000, 120000, 'M', N'Trắng', 10, 3, 02/12/2021, N'Cái'),
				('SP0009', 'A', N'Áo Thun 3 Lỗ', 150000, 200000, 'M', N'Trắng', 47, 5, 23/07/2018, N'Cái')

--Bảng Bills
SET DATEFORMAT dmy;
INSERT	INTO	Bills (ID, EstablishedDate,	Amount,	 ProductID, Size, Color, Quantity)
		VALUES	('B0001', 22/05/2023,  570000,  'SP0001', 'XL', N'Trắng', 3),
				('B0002', 28/04/2023,  570000,  'SP0004', 'L', N'Xanh', 2),
				('B0003', 16/03/2023,  600000, 'SP0008', 'M', N'Trắng', 5),
				('B0004', 05/12/2022,  8800000, 'SP0007', 'L', N'Trắng', 40)

select * from dbo.Accounts
select * from dbo.Categories
select * from dbo.Products
select * from dbo.Bills