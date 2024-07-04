--create database QLShopQuanAo;
go
use QLShopQuanAo;
go
create table Account
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
 create table Category
 (
 ID char(20) primary key,
 CateName nvarchar(100)
 );
 go
  create table Product
  (
  ID char(20) PRIMARY key,
  CategoryID char(20),
  ProductName nvarchar(1000),
  ImportPrice int,
  ExportPrice int,
  Unit nvarchar(100),
  Pic nvarchar(3000),
  FOREIGN key (CategoryID) references Category(ID)
  );
  go
create table ProductProperties
 (
 ProductID char(20),
 Size char(10),
 Color nvarchar(100),
 ImportNumber int,
 Remained int,
 ImportDate datetime,
 FOREIGN key (ProductID) references Product(ID)
 );
 go


CREATE TABLE Partners
(
	ID char(20) PRIMARY KEY,
	PnName nvarchar(100),
	PhoneNumber int,
	Adrs nvarchar(100),
	Email char(500) 

)
GO
CREATE TABLE Bills
(
	ID char(20) PRIMARY KEY,
	PartnerID char(20) NOT NULL,
    BillType nvarchar(50),
	EstablishedDate datetime,
	Stt nvarchar(100),
	Amount int,
	Discount float,
	Tax float,
	FOREIGN KEY (PartnerID) references Partners(ID)
)

GO
CREATE TABLE BillDetails
(
	BillID char(20),
	ProductID char(20),
	Size char(10),
    Color nvarchar(100),
	SoLuong int,
	FOREIGN KEY (BillID) references Bills(ID),
	FOREIGN KEY (ProductID) references Product(ID),
	PRIMARY KEY (BillID, ProductID)
)
GO

--==================================== Nhập dữ liệu cho các bảng ============================================
 -- F là chủ, E là đầy tớ
 SET DATEFORMAT dmy;
 insert into Account(ID,AccountName,Pass,FullName,PhoneNumber,Email,Duty,StartingDate, Stt) Values('F001','tnam','0123456789',N'Trần Nguyễn Ánh Minh','0327764821','trannguyenanhminh2003@gamil.com',N'Founder','20/4/2023', 'Active')
 insert into Account(ID,AccountName,Pass,FullName,PhoneNumber,Email,Duty,StartingDate, Stt) Values('E001','dtqn','123123123',N'Đặng Thị Quỳnh Như','0327764821','dangthiquynhnhu@gamil.com',N'Quản lí','13/4/2023', 'Active')
 insert into Account(ID,AccountName,Pass,FullName,PhoneNumber,Email,Duty,StartingDate, Stt) Values('E002','ntn','66666666',N'Nguyễn Thanh Nhã','0327764821','nguyenthanhnha@gamil.com',N'Nhân viên','30/4/2023', 'Active' )


 -- 01 Áo, -02 Quần
 insert into Category(ID,CateName) values('01',N'Áo')
 insert into Category(ID,CateName) values('02',N'Quần')
  

 insert into Product(ID,CategoryID,ProductName,ImportPrice,ExportPrice,Unit,Pic) values('AO001','01',N'Áo Thun Trơn màu Trắng',109000,199000,'VND',N'/image/Áo/AO001')
 insert into Product(ID,CategoryID,ProductName,ImportPrice,ExportPrice,Unit,Pic) values('AO101','01',N'Áo Hello Kitty Siêu Cute',109000,199000,'VND',N'/image/Áo/AO101')
 insert into Product(ID,CategoryID,ProductName,ImportPrice,ExportPrice,Unit,Pic) values('AO201','01',N'Áo in hình Triết lý cuộc sống',109000,199000,'VND',N'/image/Áo/AO201')
 insert into Product(ID,CategoryID,ProductName,ImportPrice,ExportPrice,Unit,Pic) values('QN001','02',N'Quần trơn',109000,199000,'VND',N'/image/Quần/QN001')
 insert into Product(ID,CategoryID,ProductName,ImportPrice,ExportPrice,Unit,Pic) values('QN101','02',N'Quần Hello Kitty Siêu Cute',109000,199000,'VND',N'/image/Quần/QN101')

 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','XL',N'Trắng',40,10,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','M',N'Trắng',40,21,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','L',N'Trắng',40,12,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','S',N'Trắng',40,32,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','XL',N'Đen',40,10,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','M',N'Đen',40,21,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','L',N'Đen',40,0,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('AO001','S',N'Đen',40,35,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('QN001','S',N'Đen',40,34,'27/05/2023')
 insert into ProductProperties(ProductID,Size,Color,ImportNumber,Remained,ImportDate) values ('QN101','S',N'Đen',40,37,'27/05/2023')
 --nếu nó như này thì mỗi cái ProductProperties biểu thị số lượng tồn của 1 size của mỗi màu của item đó


--Nhập bảng Partners
INSERT INTO Partners(ID,  PnName,  PhoneNumber, Adrs, Email) VALUES ('NCC001', N'Nguyễn Huy Hoàng', 0335242576, N'36 Phạm Văn Đồng - Nha Trang', 'hoangnh@gmail.com')
INSERT INTO Partners(ID,  PnName,  PhoneNumber, Adrs, Email) VALUES ('NCC002',N'Lý Ngọc Dũng', 0932656412, N'An Lộc - Tp.Huế', 'dungln@gmail.com')
INSERT INTO Partners(ID,  PnName, PhoneNumber, Adrs, Email) VALUES ('KH001',N'Nguyễn Hoài Nam', 0378654232, N'Thủ Đức - Tp.Hồ Chí Minh', 'namnh@gmail.com')
INSERT INTO Partners(ID, PnName, PhoneNumber, Adrs, Email) VALUES ('KH002',N'Phạm Ngọc Dung', 0235786235, N'Tp.Đà Lạt - Lâm Đồng', 'dungpn@gmail.com')
INSERT INTO Partners(ID,  PnName, PhoneNumber, Adrs, Email) VALUES ('NCC003',N'Trịnh Bá Hổ', 0942968505, N'P2 - Tp.Cà Mau', 'hotb@gmail.com')
--Nhập bảng Bills
 SET DATEFORMAT dmy;
INSERT INTO Bills(ID,PartnerID, BillType,	EstablishedDate, Stt, Amount, Discount,	Tax) VALUES ('X0001','KH001', N'Xuất', '10/03/2022', N'Đã Hoàn Thành', 500000,NULL,NULL)
INSERT INTO Bills(ID,PartnerID, BillType,	EstablishedDate, Stt, Amount, Discount,	Tax) VALUES ('N0001','NCC002', N'Nhập', '21/01/2023', N'Đã Hoàn Thành', 200000,NULL,NULL)
INSERT INTO Bills(ID,PartnerID, BillType,	EstablishedDate, Stt, Amount, Discount,	Tax) VALUES ('X0002','KH002', N'Xuất', '20/08/2020', N'Chưa Hoàn Thành', 300000,NULL,NULL)
INSERT INTO Bills(ID,PartnerID, BillType,	EstablishedDate, Stt, Amount, Discount,	Tax) VALUES ('N0002','NCC002', N'Nhập', '18/04/2023', N'Chưa Hoàn Thành', 500000,NULL,NULL)
INSERT INTO Bills(ID,PartnerID, BillType,	EstablishedDate, Stt, Amount, Discount,	Tax) VALUES ('N0003','NCC001', N'Nhập', '09/12/2021', N'Đã Hoàn Thành', 900000,NULL,NULL)




--Nhập bảng BillDetails
INSERT INTO BillDetails(BillID, ProductID,Size,Color,SoLuong) VALUES ('X0001', 'AO001','XL',N'Trắng',2)
INSERT INTO BillDetails(BillID, ProductID,Size,Color,SoLuong) VALUES ('N0001',  'AO001','M',N'Trắng',1)
INSERT INTO BillDetails(BillID, ProductID,Size,Color,SoLuong) VALUES ('X0002',  'QN001', 'S',N'Đen',1)
INSERT INTO BillDetails(BillID, ProductID,Size,Color,SoLuong) VALUES ('N0002',  'QN101','S',N'Đen',1)
INSERT INTO BillDetails(BillID, ProductID,Size,Color,SoLuong) VALUES ('N0003',  'AO001','L',N'Đen',2)


 select * from Account
 select * from Category
 select * from Product
 select * from ProductProperties

 select * from Bills
 select * from Partners
 select * from BillDetails