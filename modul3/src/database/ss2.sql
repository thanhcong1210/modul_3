create database ss2_quan_ly_don_dat_hang;
create table phieu_xuat(
so_sp int primary key,
ngay_xuat datetime
);

create table vat_tu(
ma_VTU int primary key,
ten_VTU varchar(40)
);

create table chi_tiet_phieu_xuat (
so_sp int,
ma_VTU int,
DG_xuat int,
SL_xuat int,
primary key (so_sp, ma_VTU),
foreign key (so_sp) references phieu_xuat(so_sp),
foreign key (ma_VTU) references vat_tu(ma_VTU)
);

create table phieu_nhap(
so_PN int primary key,
ngay_nhap datetime
);

create table chi_tiet_phieu_nhap(
so_PN int,
ma_VTU int,
DG_nhap int,
SL_nhap int,
primary key (so_PN, ma_VTU),
foreign key (so_PN) references phieu_nhap(so_PN),
foreign key (ma_VTU) references vat_tu(ma_VTU)
);

create table don_DH(
so_DH int primary key,
ngay_DH datetime
);

create table chi_tiet_don_dat_hang(
so_DH int,
ma_VTU int,
ma_NCC int,
primary key (so_DH, ma_VTU),
foreign key (so_DH) references don_DH(so_DH),
foreign key (ma_VTU) references vat_tu(ma_VTU),
foreign key (ma_NCC) references nhacc(ma_NCC)
);

create table nhacc(
ma_NCC int primary key,
ten_NCC varchar(50),
dia_chi varchar(50),
sdt varchar(30)
);




