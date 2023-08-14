create database PS37088__NGODUCPHU__ASM__QLXK;
use PS37088__NGODUCPHU__ASM__QLXK;
--
create table CuaHang(
	MaCH char(4) primary key,
    TenCH varchar(120),
    DiaChi varchar(50),
    SoDT varchar(15),
    Email varchar(20),
    NguoiDD varchar(30)
);
create table HangHoa(
	MaHH char(4) primary key,
    TenHH varchar(30),
    DonVT varchar(15),
    DonGia double,
    MaLH char(4) references LoaiHangHoa(MaLH)
);
create table LoaiHang(
	MaLH char(4) primary key,
    TenLH varchar(100)
);
create table PhieuXuat(
	SoPhieu varchar(5) primary key,
    NgayLap date,
    NgayXuat date,
    MaCH char(4) references CuaHang(MaCH)
);
create table CTPhieuXuat(
	MaCTPX char(4) primary key,
    SoLuong int,
    GhiChu varchar(50),
    SoPhieu varchar(5) references PhieuXuat(SoPhieu),
    MaHH char(4) references HangHoa(MaHH)
);
alter table HangHoa 
add constraint FK__LoaiHang__HangHoa foreign key (MaLH) references LoaiHang(MaLH);

alter table PhieuXuat
add constraint FK__CuaHang__PhieuXuat foreign key (MaCH) references CuaHang(MaCH);

alter table CTPhieuXuat
add constraint FK__PhieuXuat__CTPhieuXuat foreign key (SoPhieu) references PhieuXuat(SoPhieu),
add constraint FK__HangHoa__CTPhieuXuat foreign key (MaHH) references HangHoa(MaHH);

insert into cuahang values 
('CH01', 'BHX',  'Gò Vấp','0983769320', 'tuan@gmail.com', 'Tuấn'),
('CH02', 'TGDD', 'Quận 3','0933999100',  'tai@gmail.com', 'Tài'),
('CH03', 'PV',  'Quận 1', '0977333902','teo@gmail.com', 'Tèo'),
('CH04', 'CP', 'Quận 5','0903000021',  'quang@gmail.com', 'Quang'),
('CH05', 'GVN', 'Bình Thạnh', '0933488854', 'long@gmail.com', 'Long'),
('CH06', 'DMX', 'Phú Nhuận', '0888022422', 'kiet@gmail.com', 'Kiệt');

insert into loaihang values 
('TTNA', 'Thời trang nam công sở'),
('TTNU', 'Thời trang nữ công sở'),
('DPHS', 'Đồng phục học sinh'),
('TTTE', 'Thời trang trẻ em'),
('TTTN', 'Thời trang trung niên'),
('PKTT', 'Phụ kiện thời trang'); 

insert into hanghoa values 
('AK01', 'áo',  'cái','280000', 'TTNA'),
('AK02', 'quần', 'cái','300000','TTNU'),
('SM01', 'găng tay', 'cái', '180000','PKTT'),
('SM02', 'kiếm', 'cái','250000', 'PKTT'),
('DA01', 'áo choàng', 'cái', '300000','TTNA'),
('DP01', 'súng ngắn', 'bộ', '200000','TTTN'),
('DP02', 'bình sữa', 'bộ', '200000','TTTE'),
('BO01', 'dây nịt', 'cái', '200000','DPHS'),
('AO01', 'cọng xích', 'cái', '200000','TTNA'),
('AO02', 'quần đùi', 'cái', '200000','TTNU');

insert into phieuxuat values 
('PX01', '2021-03-01','2021-03-12', 'CH01'),
('PX02', '2019-04-21','2019-04-30','CH02'),
('PX03', '2020-01-01','2020-01-23', 'CH03'),
('PX04', '2019-05-18','2019-05-19', 'CH04'),
('PX05', '2020-06-21','2020-06-23','CH05'),
('PX06', '2019-09-1','2019-09-12','CH06');

insert into chitietphieuxuat values 
('PX01','AK01', '30', 'ĐỦ size'),
('PX02','SM02', '20', 'Sắp hết hàng'),
('PX03','DA01', '10', 'Nhiều màu'),
('PX04','BO01', '10', 'váy + áo'),
('PX05','AO01', '30', 'size nhỏ'),
('PX06','AO02', '50', 'màu đen');

-- 1 Hiển thị tất cả mặt hàng. Danh sách sắp xếp theo đơn giá tăng dần.
SELECT * 
FROM hanghoa
ORDER BY DonGia ASC;

-- 2 Hiển thị tất cả các mặt hàng thuộc loại hàng “Thời trang”. Thông tin gồm: mã mặt hàng, tên mặt hàng, đơn vị tính, đơn giá, tên loại hàng.
select hanghoa.MaHH, hanghoa.TenHH, hanghoa.DonGia, loaihang.TenLH as 'Loại hàng thời trang'
from hanghoa inner join loaihang on hanghoa.MaLH = loaihang.MaLH 
where loaihang.TenLH = 'Thời trang nam công sở' ;

-- 3 Thống kê số mặt hàng theo loại hàng, thông tin gồm: mã loại hàng, tên loại hàng, tổng số mặt hàng. Danh sách sắp xếp theo tổng số mặt hàng giảm dần.
SELECT loaihang.MaLH, loaihang.TenLH, COUNT(hanghoa.MaHH) AS TongSoMatHang
FROM loaihang
LEFT JOIN hanghoa ON loaihang.MaLH = hanghoa.MaLH
GROUP BY loaihang.MaLH, loaihang.TenLH
ORDER BY TongSoMatHang DESC;

-- 4 Liệt kê số phiếu xuất, ngày xuất hàng, mã cửa hàng, tên mặt hàng, số lượng, đơn giá, thành tiền.
SELECT px.SoPhieu AS 'Số phiếu xuất',
       px.NgayXuat AS 'Ngày xuất hàng',
       ch.MaCH AS 'Mã cửa hàng',
       hh.TenHH AS 'Tên mặt hàng',
       ctx.SoLuong AS 'Số lượng',
       hh.DonGia AS 'Đơn giá',
       ctx.SoLuong * hh.DonGia AS 'Thành tiền'
FROM phieuxuat px
JOIN ctphieuxuat ctx ON px.SoPhieu = ctx.SoPhieu
JOIN cuahang ch ON px.MaCH = ch.MaCH
JOIN hanghoa hh ON ctx.MaHH = hh.MaHH;
 
-- 5 Thống kế tổng số lần xuất hàng theo từng tháng trong năm 2021, thông tin gồm: tháng/năm, số lần xuất hàng.
select concat(month(phieuxuat.NgayXuat),'/', year(phieuxuat.NgayXuat)) as 'Tháng năm', count(phieuxuat.SoPhieu) as 'Số lần xuất'
from phieuxuat
where year(NgayXuat) = 2021
group by ngayxuat;

-- 6 Liệt kê 5 mặt hàng có số lượng xuất kho nhiều nhất.
SELECT hanghoa.MaHH, SUM(ctphieuxuat.SoLuong) AS TongSoLuong
FROM ctphieuxuat
INNER JOIN hanghoa ON ctphieuxuat.MaHH = hanghoa.MaHH
INNER JOIN phieuxuat ON ctphieuxuat.SoPhieu = phieuxuat.SoPhieu
GROUP BY hanghoa.MaHH
ORDER BY TongSoLuong DESC
LIMIT 5;

-- 7 Thống kê số hàng nhập về cửa hàng “Chi nhánh quận 5”, thông tin hiển thị: Tên cửa hàng, số lần nhập hàng.
select count(SoPhieu) as 'Số lần nhập hàng', cuahang.TenCH as 'Tên cửa hàng'
 from phieuxuat
inner join cuahang on phieuxuat.MaCH = cuahang.MaCH
where DiaChi = 'Quận 5' 
group by phieuxuat.MaCH;

 --  8 Thống kê tổng tiền hàng xuất kho theo ngày, thông tin hiển thị: Ngày xuất hàng, tổng thành tiền.
 SELECT phieuxuat.NgayXuat as 'Ngày xuất hàng', SUM(ctphieuxuat.SoLuong * hanghoa.DonGia) as 'Tổng thành tiền'
FROM ctphieuxuat
INNER JOIN phieuxuat ON ctphieuxuat.SoPhieu = phieuxuat.SoPhieu
INNER JOIN hanghoa ON ctphieuxuat.MaHH = hanghoa.MaHH
GROUP BY phieuxuat.NgayXuat;

 -- 9 Cập nhật ngày xuất hàng là ngày hiện hành cho các phiếu xuất chưa có ngày xuất
       update phieuxuat
       set ngayxuat = now() 
       where ngayxuat is null; 
 
 -- 10 Cập nhật đơn giá của “Đồng phục học sinh” giảm 10% trên đơn giá hiện tại.
 update hanghoa
 set DonGia = DonGia * 0.9
 where MaLH = 'DPHS';
 
 -- 11 Thực hiện xóa các cửa hàng chưa có thông tin xuất hàng.
DELETE FROM cuahang
WHERE MaCH NOT IN (
    SELECT MaCH
    FROM PhieuXuat
);


-- 12 Liệt kê danh sách các mặt hàng có số lượng xuất hàng thấp nhất: Mã hàng, tên hàng, tổng số lượng xuất.
SELECT ctphieuxuat.MaHH as 'Mã mặt hàng', hanghoa.TenHH as 'Tên hàng hóa', COUNT(ctphieuxuat.SoPhieu) as 'Lượng xuất hàng'
FROM ctphieuxuat
INNER JOIN hanghoa ON ctphieuxuat.MaHH = hanghoa.MaHH
GROUP BY ctphieuxuat.MaHH
ORDER BY COUNT(ctphieuxuat.SoPhieu) ASC;


-- 13 Liệt kê những mặt hàng chưa từng xuất cho các cửa hàng, thông tin gồm: Mã mặt hàng, tên mặt hàng, tên loại hàng.
SELECT hanghoa.MaHH AS 'Mã mặt hàng', TenHH AS 'Tên hàng hóa', loaihang.TenLH AS 'Tên loại hàng'
FROM hanghoa
INNER JOIN loaihang ON hanghoa.MaLH = loaihang.MaLH
WHERE hanghoa.MaHH NOT IN (
    SELECT MaHH
    FROM ctphieuxuat
);