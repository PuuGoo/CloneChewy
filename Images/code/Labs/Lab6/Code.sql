-- Tạo database
create database PS37088__NGODUCPHU__Lab6__QLBH;
use PS37088__NGODUCPHU__Lab6__QLBH;
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

-- Câu 1: Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách hàng)
select MaHD, NgayLapHD, TongTien, Ten as 'Tên khách hàng'
from HoaDon inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH;

-- Câu 2: Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên nhân viên)
select MaHD, NgayLapHD, TongTien, Ten as 'Tên nhân viên'
from HoaDon inner join NhanVien on HoaDon.MaNV = NhanVien.MaNV;
-- Câu 3: Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên nhân viên, tên khách hàng)
/* Cách 1 */
select MaHD, NgayLapHD, TongTien, nhanvien.Ten as 'Tên nhân viên', khachhang.Ten as 'Tên khách hàng'
from HoaDon, NhanVien, KhachHang
where NhanVien.MaNV = HoaDon.MaNV and KhachHang.MaKH = HoaDon.MaKH;
/* Cách 2 */
select MaHD, NgayLapHD, TongTien, nhanvien.Ten as 'Tên nhân viên', khachhang.Ten as 'Tên khách hàng'
from ((HoaDon inner join KhachHang on KhachHang.MaKH = HoaDon.MaKH) inner join NhanVien on NhanVien.MaNV = HoaDon.MaNV);
-- Câu 4: Đếm tổng số khách hàng theo quận
select count(MaKH) as 'Số lượng khách hàng từng quận', DiaChi
from KhachHang
group by DiaChi;
-- Câu 5: Hiển thị tất cả thông tin trong bảng khách hàng, mã hóa đơn, ngày lập, lưu ý: Lấy tất cả khách hàng (có hóa đơn và không có hóa đơn).
select KhachHang.MaKH, concat(HoVaTenLot, ' ', Ten) as 'Họ và tên', DiaChi, Email, DienThoai, HoaDon.MaHD, NgayLapHD
from HoaDon inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH;
-- Câu 6: Hiển thị các thông tin (mã hóa đơn, ngày lập, tên khách hàng, số điện thoại), chỉ hiển thị các thông tin mà trạng thái là “chưa thanh toán” 
select HoaDon.MaHD, NgayLapHD, KhachHang.Ten as 'Tên khách hàng', DienThoai, TrangThai
from HoaDon inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH
where HoaDon.TrangThai like 'Chưa thanh toán';
-- Câu 7: Hiển thị các thông tin (Mã hóa đơn, ngày lập, số lượng mua, tổng tiền, tên sản phẩm) của các hóa đơn trong tháng 7
select HoaDon.MaHD, NgayLapHD, HoaDonChiTiet.SoLuongMua as 'Số lượng mua', TongTien, TenSP
from ((HoaDon inner join HoaDonChiTiet on HoaDon.MaHD = HoaDonChiTiet.MaHD) inner join SanPham on SanPham.MaSP = HoaDonChiTiet.MaSP)
where month(HoaDon.NgayLapHD) like 2;
-- câu 8: Hiển thị các thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách hàng), điều kiện là chỉ hiển thị thông tin của khách hàng ở quận 1
select HoaDon.MaHD, HoaDon.NgayLapHD, HoaDon.TongTien, KhachHang.Ten, DiaChi
from (HoaDon inner join KhachHang on KhachHang.MaKH = HoaDon.MaKH)
where DiaChi= 'Quận 1';
-- câu 9: Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua, mã sản phẩm, tên sản phẩm) với điều kiện chỉ hiển thị các sản phẩm có giá >10 triệu
-- Cách 1 
select A.MaHD, NgayLapHD, TongTien, SoLuongMua, C.MaSP as 'Mã sản phẩm', TenSP, GiaSP
from ((HoaDon A inner join HoaDonChiTiet B on A.MaHD = B.MaHD) inner join SanPham C on C.MaSP = B.MaSP)
where C.GiaSP > '10000000';
-- Cách 2
select HoaDon.MaHD, NgayLapHD, TongTien, SoLuongMua, SanPham.MaSP as 'Mã sản phẩm', TenSP, GiaSP
from ((HoaDon  inner join HoaDonChiTiet  on HoaDon.MaHD = HoaDonChiTiet.MaHD) inner join SanPham  on SanPham.MaSP = HoaDonChiTiet.MaSP)
where SanPham.GiaSP > '10000000';
-- câu 10: Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua, mã sản phẩm, tên sản phẩm, giá sản phẩm, tên khách hàng), điều kiện khách hàng tên Khoa
select A.MaHD, A.NgayLapHD, A.TongTien, B.SoLuongMua, C.MaSP, C.TenSP, C.GiaSP, D.Ten as'Tên khách hàng'
from (( hoadon A inner join hoadonchitiet B on A.MaHD = B.MaHD)
inner join sanpham C on B.MaSP = C.MaSP)
inner join khachhang D on A.MaKH = D.MaKH
where D.Ten = 'Khoa';
-- CÂU 11: Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.
SELECT A.MaHD, A.NgayLapHD as 'Ngày mua hàng', A.TongTien as 'Tổng tiền mua'
FROM HOADON A inner join hoadonchitiet B on A.MaHD = B.MaHD
group by A.MaHD
having sum(TongTien) >=500000  /* HAVING như một điều kiện tìm kiếm */ 
ORDER BY TongTien DESC;
-- Câu 12: Hiển thị danh sách các khách hàng chưa mua hàng lần nào 
SELECT MaKH, concat(HoVaTenLot, ' ', Ten) as 'Họ và tên'
FROM khachhang
where MaKH not in (select distinct MaKH from hoadon) /* distinct: trả về các bản ghi không trùng lặp nhau */
order by MaKH;

--  câu 13: Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
/*SELECT *
FROM khachhang
WHERE MaKH NOT IN (
    SELECT DISTINCT MaKH
    FROM hoadon
    WHERE NgayLapHD >= '2016-01-01'
); */
select K.MaKH,concat(HoVaTenLot,'',Ten)'Họ và tên'
from khachhang K, hoadon H
where K.MaKH= H.MaKH and
K.MaKH not in (select distinct MaKH from hoadon H where NgayLapHD >='2019-1-1')
order by K.MaKH;

-- câu 14: Hiển thị mã sản phẩm, tên sản phẩm bán chạy nhất
/* select sanpham.MaSP  as 'Mã sản phẩm', sanpham.TenSP as 'Tên SP', hoadonchitiet.SoLuongMua as 'Số Lượng Mua'
from sanpham inner join hoadonchitiet on sanpham.MaSP = hoadonchitiet.MaSP 
order by hoadonchitiet.SoLuongMua desc;*/
select sanpham.MaSP, sanpham.TenSP
from sanpham
inner join hoadonchitiet
on sanpham.MaSP = hoadonchitiet.MaSP
group by sanpham.MaSP, sanpham.TenSP
order by sum(hoadonchitiet.SoLuongMua) desc
limit 1;
-- câu 15: Hiển thị 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
SELECT khachhang.Ten as 'Tên khách hàng', SUM(hoadon.TongTien) as 'Tổng tiền mua'
FROM hoadon 
INNER JOIN khachhang  ON hoadon.MaKH = khachhang.MaKH
WHERE hoadon.NgayLapHD >= '2018-01-01' AND hoadon.NgayLapHD < '2019-01-01'
GROUP BY khachhang.Ten
ORDER BY SUM(hoadon.TongTien) DESC
LIMIT 5;
-- câu 16: Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm
SELECT sanpham.TenSP 'Tên SP', hoadonchitiet.SoLuongMua 'Số Lượng Mua'
FROM sanpham inner join hoadonchitiet on sanpham.MaSP = hoadonchitiet.MaSP
WHERE SoLuongMua < (
  SELECT AVG(hoadonchitiet.SoLuongMua)
  FROM hoadonchitiet
);