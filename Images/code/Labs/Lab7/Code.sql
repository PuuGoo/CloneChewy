-- Tạo database
create database PS37088__NGODUCPHU__Lab7__QLBH;
use PS37088__NGODUCPHU__Lab7__QLBH;
-- Tạo bảng
create table KhachHang(
 MaKH varchar(10) primary key not null,
 HoVaTenLot varchar(50) ,
 Ten varchar(50) not null,
 DiaChi varchar(255),
 Email varchar(50),
 DienThoai varchar(20) not null
);
create table NhanVien(
 MaNV varchar(10) primary key not null,
 HoVaTenLot varchar(50) ,
 Ten varchar(50) not null,
 DiaChi varchar(255),
 Email varchar(50),
 DienThoai varchar(20) not null
);
create table SanPham(
 MaSP varchar(10) primary key not null,
 TenSP varchar(50) ,
 GiaSP float not null,
 SoLuong int not null,
 MoTa varchar(255) not null
);
create table HoaDon(
 MaHD varchar(10) primary key not null,
 NgayLapHD date not null,
 TongTien float not null,
 TrangThai varchar(20) not null,
 MaNV varchar(10) not null,
 MaKH varchar(10) not null
);
create table HoaDonChiTiet(
 MaHDCT varchar(10) primary key not null,
 MaHD varchar(10) not null,
 MaSP varchar(10) not null,
 SoLuongMua int not null
);
-- Tạo ràng buộc khóa ngoại
alter table HoaDon
add constraint FK_NhanVien__HoaDon foreign key (MaNV) references NhanVien(MaNV),
add constraint FK_KhachHang__HoaDon foreign key (MaKH) references KhachHang(MaKH);

alter table HoaDonChiTiet
add constraint FK_HoaDon__HoaDonChiTiet foreign key (MaHD) references HoaDon(MaHD),
add constraint FK_SanPham__HoaDonChiTiet foreign key (MaSP) references SanPham(MaSP);

insert into KhachHang values
('KH001', 'Trần Trọng', 'Trí', 'Gò Vấp', '', '0983456654'),
('KH002', 'Đàm Vĩnh', 'Hưng', 'Quận 3', '', '0988123567'),
('KH003', 'Châu Đăng', 'Khoa', 'Quận 1', '', '0977874300'),
('KH004', 'Phạm', 'Hương', 'Quận 2', '', '0903090932'),
('KH005', 'Trường', 'Giang', 'Bình Thạnh', '', '0933411154'),
('KH006', 'Hoài', 'Linh', 'Phú Nhuận', '', '0888012381'),
('KH007', 'Mỹ', 'Tâm', 'Quận 1', '', '0977456654'),
('KH008', 'Ưng Hoàng', 'Phúc', 'Quận 5', '', '091950064'),
('KH009', 'Châu Tinh', 'Trì', 'Quận 1', '', '0888456098'),
('KH010', 'Thành', 'Long', 'Quận 2', '', '0903090908'),
('KH011', 'Lý Liên', 'Kiệt', 'Tân Bình', '', '0933410054'),
('KH012', 'Châu Khải', 'Phong', 'Quận 1', '', '0888022411'),
('KH013', 'Vân Quang', 'Long', 'Quận 12', '', '0983456633'),
('KH014', 'Châu Việt', 'Cường', 'Quận 8', '', '0988903664'),
('KH015', 'Ngọc', 'Sơn', 'Quận 10', '', '0977766098'),
('KH016', 'Nguyễn Phi', 'Hùng', 'Quận 12', '', '0903098032'),
('KH017', 'Trịnh Thăng', 'Bình', 'Bình Thạnh', '', '0933477754'),
('KH018', 'Sơn', 'Tùng M-TP', 'Tân Phú', '', '0888029999'),
('KH019', 'Ngô Thanh', 'Vân', 'Tân Bình', '', '0983456890'),
('KH020', 'Trương Quỳnh', 'Anh', 'Quận 3', '', '0888053664'),
('KH021', 'Hoàng Thùy', 'Linh', 'Quận 1', '', '0977000098'),
('KH022', 'Tóc', 'Tiên', 'Quận 2', '', '0903090888'),
('KH023', 'Bích', 'Phương', 'Quận 1', '', '0933411010'),
('KH024', 'Thu', 'Minh', 'Quận 9', '', '0888022223');

insert into NhanVien values
('NV001', 'Võ Đình', 'Hải', 'Gò Vấp', '', '0983769320'),
('NV002', 'Lý Minh', 'Khoa', 'Quận 3', '', '0933999100'),
('NV003', 'Vũ Phạm Minh', 'Châu', 'Quận 1', '', '0977333902'),
('NV004', 'Nguyễn Văn', 'Tuấn', 'Quận 2', '', '0903000021'),
('NV005', 'Lê Hoài', 'Bảo', 'Bình Thạnh', '', '0933488854'),
('NV006', 'Trần Duy Bảo', 'Long', 'Phú Nhuận', '', '0888022422');

insert into SanPham values
('SP001', 'Samsung Galaxy Note 9', 20000000.0, 30, 'Hàng chính hãng'),
('SP002', 'IPHONE XS MAX', 30000000.0, 15, 'Hàng chính hãng'),
('SP003', 'IPHONE X', 20000000.0, 40, 'Hàng xách tay'),
('SP004', 'BPhone 3', 70000000.0, 300, 'Hàng chính hãng'),
('SP005', 'Oppo F9', 7000000.0, 50, 'Hàng chính hãng'),
('SP006', 'Samsung Galaxy S9 Plus', 18000000.0, 30, 'Hàng xách tay');

insert into HoaDon values
('HD001', '2019-01-20', 20000000,'Đã thanh toán', 'NV004', 'KH003'),
('HD002', '2019-02-09', 27000000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD003', '2019-01-22', 50000000,'Thanh toán qua thẻ', 'NV005', 'KH004'),
('HD004', '2019-02-03', 60000000,'Đã thanh toán', 'NV003', 'KH003'),
('HD005', '2019-01-29', 80000000,'Chưa thanh toán', 'NV003', 'KH005'),
('HD006', '2018-01-29', 30000000,'Chưa thanh toán', 'NV003', 'KH007'),
('HD007', '2018-01-29', 80000000,'Đã Thanh Toán', 'NV002', 'KH010'),
('HD008', '2018-01-29', 20000000,'Chưa thanh toán', 'NV003', 'KH001'),
('HD009', '2018-01-29', 10000000,'Đã Thanh Toán', 'NV003', 'KH006'),
('HD010', '2018-01-29', 10000000,'Chưa thanh toán', 'NV001', 'KH008'),
('HD011', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH009'),
('HD012', '2018-01-29', 50000000,'Đã Thanh Toán', 'NV005', 'KH002'),
('HD013', '2018-01-29', 20000000,'Đã thanh toán', 'NV001', 'KH003'),
('HD014', '2018-01-29', 30000000,'Đã thanh toán', 'NV003', 'KH011'),
('HD015', '2018-01-29', 70000000,'Đã thanh toán', 'NV002', 'KH015'),
('HD016', '2018-01-29', 80000000,'Chưa thanh toán', 'NV004', 'KH020'),
('HD017', '2018-01-29', 60000000,'Chưa thanh toán', 'NV004', 'KH021'),
('HD018', '2018-01-29', 90000000,'Chưa thanh toán', 'NV005', 'KH020'),
('HD019', '2018-01-29', 50000000,'Chưa thanh toán', 'NV001', 'KH003'),
('HD020', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH004'),
('HD021', '2018-01-29', 24000000,'Chưa thanh toán', 'NV003', 'KH009'),
('HD022', '2018-01-29', 12000000,'Chưa thanh toán', 'NV002', 'KH008'),
('HD023', '2018-01-29', 21000000,'Chưa thanh toán', 'NV003', 'KH016'),
('HD024', '2018-01-29', 22000000,'Chưa thanh toán', 'NV005', 'KH013'),
('HD025', '2018-01-29', 32000000,'Chưa thanh toán', 'NV004', 'KH011'),
('HD026', '2018-01-29', 19000000,'Chưa thanh toán', 'NV003', 'KH010'),
('HD027', '2018-01-29', 17500000,'Chưa thanh toán', 'NV001', 'KH001'),
('HD028', '2018-01-29', 12550000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD029', '2018-01-29', 7000000,'Chưa thanh toán', 'NV001', 'KH002');

insert into HoaDonChiTiet values
('HDCT001','HD001','SP001',1),
('HDCT002','HD002','SP003',1),
('HDCT003','HD002','SP004',1),
('HDCT004','HD003','SP002',1),
('HDCT005','HD003','SP003',1),
('HDCT006','HD004','SP001',3),
('HDCT007','HD005','SP002',2),
('HDCT008','HD005','SP003',1);

-- Câu 1: Thêm 1 khách hàng mới (thông tin tự cho).
insert into khachhang values
('KH025', 'Ngô Đức', 'Phú', 'Bình Tân', '', '0984004258');
select *
from khachhang;
-- Câu 2: Thêm 3 sản phẩm mới (search tìm thông tin sản phẩm)
insert into sanpham values
('SP007', 'Iphone 14 Pro Max', '25990000', '30', 'Hàng chính hãng'),
('SP008', 'Samsung Galaxy S23 Ultra', '26030000', '40', 'Hàng chính hãng'),
('SP009', 'Xiaomi 13 Pro', '18290000', '50', 'Hàng chính hãng');
select *
from sanpham;
-- Câu 3: Thêm 1 hóa đơn mới cho khách hàng mới thêm
insert into hoadon values
('HD030', '2018-01-29', '10000000', 'Đã thanh toán', 'NV001', 'KH025');
select *
from hoadon;
-- Câu 4: Thêm hóa đơn chi tiết của hóa đơn vừa nhập mua 3 sản phẩm bất kỳ
insert into hoadonchitiet values
('HDCT009', 'HD006', 'SP007', '2'),
('HDCT010', 'HD006', 'SP008', '3'),
('HDCT011', 'HD006', 'SP009', '4');
select *
from hoadonchitiet;
-- Câu 5: Tạo 1 bảng có tên KhachHang_Q1 chứa thông tin tin đầy đủ về các khách hàng ở Quận 1
create table KhachHang_Q1
select * from khachhang
where DiaChi like 'Quận 1';
select *
from KhachHang_Q1;
-- Câu 6: Cập nhật lại thông tin số điện thoại của khách hàng có mã ‘KH002’ có giá trị mới là ‘16267788989’
update khachhang
set DienThoai = '16267788989'
where MaKH = 'KH002';
select *
from KhachHang;
-- Câu 7: Tăng số lượng mặt hàng có mã ‘SP003’ lên thêm ‘200’ đơn vị
update sanpham 
set SoLuong = SoLuong +200
where MaSP = 'SP003';
select *
from sanpham;
-- câu 8: Giảm giá cho tất cả sản phẩm giảm 5%
update sanpham
set GiaSP = GiaSP * 0.95;
select *
from sanpham;
-- câu 9: Tăng số lượng của mặt hàng bán chạy nhất trong tháng 2/2019 lên 100 đơn vị
-- Tìm Sản phẩm có ngày lập hóa đơn 2/2019
select MaSP, sum(SoLuongMua) as TongSoLuongMua
from hoadonchitiet ct join hoadon hd
on hd.MaHD = ct.MaHD
where month( NgayLapHD) = 2 and year(NgayLapHD) = 2019
group by MaSP
order by TongSoLuongMua desc -- Sắp xếp số lượng mua giảm dần
limit 1;
update sanpham SP, (select MaSP, sum(SoLuongMua) as TongSoLuongMua
from hoadonchitiet ct join hoadon hd
on hd.MaHD = ct.MaHD
where month(NgayLapHD) = 2 and year( NgayLapHD) = 2019
group by MaSP
order by TongSoLuongMua desc
limit 1) as b
set SoLuong = SoLuong + 100
where sp.MaSP = b.MaSP;

select *
from sanpham;
-- câu 10: Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2019
select MaSP, sum(SoLuongMua) as TongSoLuongMua
from hoadonchitiet ct join hoadon hd 
on hd.MaHD = ct.MaHD
where month(NgayLapHD) = 2 and year(NgayLapHD) = 2019
group by MaSP
order by tongsoluongmua asc
limit 2;
update sanpham sp, (select MaSP, sum(SoLuongMua) as tongsoluongmua
from hoadonchitiet ct join hoadon hd 
on hd.MaHD = ct.MaHD
where month(NgayLapHD) = 2 and year(NgayLapHD) = 2019
group by MaSP
order by tongsoluongmua asc
limit 2) as b
set GiaSP = GiaSP * 0.9
where sp.MaSP = b.MaSP;
select *
from sanpham;
-- CÂU 11: Cập nhật lại trạng thái “chưa thanh toán” cho hoá đơn có mã ‘HD001’
update hoadon
set TrangThai ='Chưa thanh tóan'
where MaHD = 'HD001';
select *
from hoadon;
-- Câu 12: Xoá mặt hàng có mã sản phẩm là ‘SP001’ ra khỏi hoá đơn ‘HD001’ .
DELETE FROM HoaDonChiTiet
WHERE MaSP = 'SP001';
DELETE FROM hoadon
WHERE MaHD IN (
    SELECT MaHD
    FROM HoaDonChiTiet
    WHERE MaSP = 'SP001'
);
select *
from hoadonchitiet;
--  Câu 13: Xoá khách hàng chưa từng mua hàng kể từ ngày “1-1-2019”
DELETE FROM khachhang
WHERE MaKH NOT IN (
    SELECT MaKH
    FROM hoadon
    WHERE NgayLapHD >= '2018-01-01'
);
select *
from khachhang;

