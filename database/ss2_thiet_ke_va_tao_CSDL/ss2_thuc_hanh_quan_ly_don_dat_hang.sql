create database ss2_thuc_hanh_quan_ly_don_dat_hang;

CREATE TABLE don_vi_khach (
    maDV INT PRIMARY KEY,
    tenDV VARCHAR(30),
    diaChi VARCHAR(30),
    dienThoai VARCHAR(30)
);

CREATE TABLE nguoi_dat (
    maSoND INT PRIMARY KEY,
    hoTenND VARCHAR(50)
);

CREATE TABLE hang (
    maHang INT PRIMARY KEY,
    tenHang VARCHAR(50),
    donViTinh INT,
    moTaHang VARCHAR(50)
);

CREATE TABLE nguoi_giao (
    maSoNguoiGiao INT PRIMARY KEY,
    hoTenNguoiGiao VARCHAR(50)
);

CREATE TABLE noi_giao (
    maSoDonDangGiao INT PRIMARY KEY,
    tenNoiGiao VARCHAR(50)
);

CREATE TABLE nguoi_nhan (
    hoTenNguoiNhan VARCHAR(50),
    maSoNguoiNhan INT PRIMARY KEY
);

CREATE TABLE thuoc_1 (
    maDV INT,
    maSoND INT,
    PRIMARY KEY (maSoND , maDV),
    FOREIGN KEY (maDV)
        REFERENCES don_vi_khach (maDV),
    FOREIGN KEY (maSoND)
        REFERENCES nguoi_dat (maSoND)
);

CREATE TABLE thuoc_2 (
    maDV INT,
    maSoNguoiNhan INT,
    PRIMARY KEY (maDV , maSoNguoiNhan),
    FOREIGN KEY (maDV)
        REFERENCES don_vi_khach (maDV),
    FOREIGN KEY (maSoNguoiNhan)
        REFERENCES nguoi_nhan (maSoNguoiNhan)
);

CREATE TABLE dat (
    soDatHang VARCHAR(50) PRIMARY KEY,
    ngayDat DATETIME,
    soLuong INT,
    maSoND INT,
    maHang INT,
    FOREIGN KEY (maSoND)
        REFERENCES nguoi_dat (maSoND),
    FOREIGN KEY (maHang)
        REFERENCES hang (maHang)
);

CREATE TABLE giao (
    ngayGiao DATETIME,
    dongia VARCHAR(30),
    soLuong INT,
    soPhieuGiaoHang INT PRIMARY KEY,
    maSoNguoiNhan INT,
    maSoDonDangGiao INT,
    maSoNguoiGiao INT,
    maHang INT,
    FOREIGN KEY (maSoNguoiNhan)
        REFERENCES nguoi_nhan (maSoNguoiNhan),
    FOREIGN KEY (maSoDonDangGiao)
        REFERENCES noi_giao (maSoDonDangGiao),
    FOREIGN KEY (maSoNguoiGiao)
        REFERENCES nguoi_giao (maSoNguoiGiao),
    FOREIGN KEY (maHang)
        REFERENCES hang (maHang)
);