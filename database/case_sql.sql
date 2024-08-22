create database quan_ly_ban_giay;
use quan_ly_ban_giay;

create table loai_hang(
ma_loai_hang varchar(10) primary key,
ten_loai_hang varchar(50),
ghi_chu_lien_hang varchar(100)
);

create table hang_san_xuat(
ma_hang_san_xuat varchar(10) primary key,
ten_hang_san_xuat varchar(30),
ghi_chu_hang_san_xuat varchar(50)
);

create table kho(
ma_kho varchar(10) primary key,
ten_khach varchar(30),
dia_chi_khach varchar(100),
so_dien_thoai_khach varchar(10)
);

create table hang(
ma_hang varchar(15) primary key,
ten_hang varchar(30),
mau_sac varchar(10),
size varchar(10),
link_anh varchar(100),
nam_san_xuat int,
ghi_chu varchar(50),
ma_hang_san_xuat varchar(10),
ma_loai_hang varchar(10),
ma_kho varchar(10),
foreign key (ma_hang_san_xuat) REFERENCES hang_san_xuat(ma_hang_san_xuat),
foreign key (ma_loai_hang) REFERENCES loai_hang(ma_loai_hang),
foreign key (ma_kho) REFERENCES kho(ma_kho)
);

create table chuc_vu(
ma_chuc_vu varchar(10) primary key,
ten_chuc_vu varchar(30),
nhiem_vu varchar(50)
);

create table nhan_vien(
ma_nhan_vien varchar(10) primary key,
ten_nhan_vien varchar(30),
ngay_sinh date,
dia_chi_nhan_vien varchar(100),
so_dien_thoai_nhan_vien varchar(10),
ma_chuc_vu varchar(10),
foreign key(ma_chuc_vu) references chuc_vu(ma_chuc_vu)
);

create table nha_cung_cap(
ma_nha_cung_cap varchar(10) primary key,
ten_nha_cung_cap varchar(30),
dia_chi_nha_cung_cap varchar(50),
so_dien_thoai_nha_cung_cap varchar(10),
ghi_chu_nha_cung_cap varchar(100)
);

create table khach_hang(
ma_khach_hang varchar(10) primary key,
ten_khach_hang varchar(30),
dia_chi_khach_hang varchar(50),
so_dien_thoai_khach_hang varchar(30),
gioi_tinh varchar(10),
size int,
ghi_chu varchar(100)
);

create table phieu_nhap(
so_phieu_nhap varchar(10) primary key,
ngay_nhap date,
hinh_thuc_thanh_toan varchar(50),
ma_nhan_vien varchar(10),
ma_nha_cung_cap varchar(10),
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table dong_phieu_nhap(
so_luong_nhap int,
gia_nhap int,
gia_ban_DK int,
so_phieu_nhap varchar(10),
ma_hang varchar(15), 
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key(ma_hang) references hang(ma_hang)
);

create table phieu_nhap_lai(
so_phieu_nhap_lai varchar(10) primary key,
ngay_nhap_lai date,
ma_khach_hang varchar(10),
ma_nhan_vien varchar(10),
foreign key(ma_khach_hang) references khach_hang (ma_khach_hang),
foreign key(ma_nhan_vien) references nhan_vien (ma_nhan_vien)
);

create table dong_phieu_nhap_lai(
so_luong_nhap_lai int,
gia_nhap_lai int,
so_phieu_nhap_lai varchar(10),
ma_hang varchar(15),
foreign key(so_phieu_nhap_lai) references phieu_nhap_lai (so_phieu_nhap_lai),
foreign key(ma_hang) references hang (ma_hang)
);

create table khach_dat_hang(
so_PD varchar(10) primary key,
ngay_nhan date,
ma_khach_hang varchar(10),
ma_nhan_vien varchar(10),
foreign key(ma_khach_hang) references khach_hang (ma_khach_hang),
foreign key(ma_nhan_vien) references nhan_vien (ma_nhan_vien)
);

create table dong_khach_dat_hang(
so_luong_dat_hang int,
ma_hang varchar(15),
so_PD varchar(10),
foreign key(ma_hang) references hang (ma_hang),
foreign key(so_PD) references khach_dat_hang (so_PD)
);

create table phieu_thu_tien(
so_id varchar(10) primary key,
ngay_thu_tien date,
so_tien int,
hinh_thuc_thu_tien varchar(20),
ma_nhan_vien varchar(10),
ma_khach_hang varchar(10),
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang)
);