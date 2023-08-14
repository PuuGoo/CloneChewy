create database PS37088__NGODUCPHU__LAB4; -- Tạo bảng 
use PS37088__NGODUCPHU__LAB4; -- Mặc định database

-- Tạo bảng
create table VanPhong (
	MaVP int primary key,
    DiaDiem varchar(255)
);

create table NhanVien (
	MaNV int primary key,
    TenNV varchar(50),
    MaVP int references VanPhong(MaVP) -- Khai báo khóa ngoại 
);

create table ThanNhan (
	MaTN int primary key,
    TenThanNhan varchar(50),
    MoiQuanHe varchar(50),
    MaNV int references NhanVien(MaNV)
);

create table CSH (
	MaChuSoHuu int primary key,
    TenChuSoHuu varchar(50),
    SoDienTHoai varchar(50)
);

create table BDS (
	MaBDS int primary key,
    DiaChi varchar(255),
    MaVP int references VanPhong(MaVP),
    MaChuSoHuu int references CSH(MaChuSoHuu)
);

-- Tạo mối quan hệ giữa các bảng
alter table nhanvien
add constraint FK__NhanVien__VanPhong foreign key (MaVP) references VanPhong(MaVP); 

alter table thannhan
add constraint FK__ThanNhan__NhanVien foreign key (MaNV) references NhanVien(MaNV);

alter table BDS
add constraint FK__BDS__CSH foreign key (MaChuSoHuu) references csh(MaChuSoHuu),
add constraint FK__BDS__VanPhong foreign key (MaVP) references VanPhong(MaVP);

-- Thêm cột
alter table NhanVien
add column CMND int unique; 

alter table NhanVien
add column GioiTinh varchar(10); 

-- Đổi kiểu dữ liệu
alter table nhanvien
modify column MaNV varchar(7);

alter table thannhan
modify column MaNV varchar(7);

-- Xóa ràng buộc khóa ngoại
alter table thannhan
drop foreign key FK__ThanNhan__NhanVien; 

-- Xóa table Thân Nhân
drop table thannhan;


 

