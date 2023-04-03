-- Bài tập 2.2 
-- Dựa vạo lượt đồ ERD hình bên dưới hãy thiết kế cơ sở dữ liệu tương ứng đặt tên db_QLBanSach
create database if not exists db_QLBanSach; --
create table if not exists db_QLBanSach.nhaxuatban ( --
	mansx bigint auto_increment,
    tennsb nvarchar(100),
    dienthoai varchar(24),
    diachi nvarchar(255),
    primary key(mansx)
    
);
create table if not exists db_QLBanSach.tacgia(--
	matacgia bigint auto_increment,
    tentacgia nvarchar(100),
    diachi nvarchar(255),
    tieusu nvarchar(255),
    dienthoai varchar(24),
    primary key (matacgia)
);
create table if not exists db_QLBanSach.khachhang(--
	makhachhang bigint auto_increment,
    hoten nvarchar(50),
    taikhoan varchar(255),
    matkhau varchar(255),
    email varchar(255),
    diachi text,
    dienthoai varchar(24),
    gioitinh varchar(10),
    ngaysinh timestamp,
    primary key (makhachhang)
    
);
create table if not exists db_QLBanSach.chude (--
	machude bigint auto_increment,
    tenchude nvarchar(100),
    primary key (machude)
);
create table if not exists db_QLBanSach.sach( --
	masach bigint auto_increment,
    tensach varchar(255),
    giaban double,
    mota text,
    anhbia blob,
    ngaycapnhat timestamp,
    soluongton int,
    machude bigint not null,
    matacgia bigint not null,
    mansx bigint not null,
    primary key (masach)
    
); 

create table if not exists db_QLBanSach.DonHang(--
	madonhang bigint auto_increment,
    dathanhtoan nvarchar(50),
    ngaygiao timestamp,
    ngaydat timestamp default current_timestamp,
    tinhtranggiaohang nvarchar(255),
    makhachhang bigint not null,
    primary key (madonhang)
    
);

-- thực thể trung gian
create table if not exists db_QLBanSach.sach_tacgia (--
	masach_tacgia bigint auto_increment,
	matacgia bigint not null,
    masach bigint not null,
    VaiTro nvarchar(100),
    ViTri nvarchar(100),
    primary key (masach_tacgia)
   

);
create table if not exists db_QLBanSach.sach_donhang(-- 
	masach_donhang bigint auto_increment,
	madonhang bigint not null ,
    masach bigint not null,
	soluong int,
    dongia double,
    primary key (masach_donhang)
);
-- add constraint foreign key
use db_QLBanSach;
alter table sach
add constraint FK_sach_machude 
    foreign key (machude)
    references chude(machude)
    on update cascade
    on delete cascade;
alter table sach
add constraint FK_sach_mansx
    foreign key (mansx)
    references nhaxuatban(mansx)
    on update cascade
    on delete cascade;
alter table donhang
add constraint FK_donhang_makhachhang 
    foreign key (makhachhang)
    references khachhang(makhachhang) 
    on update cascade
    on delete cascade;
alter table sach_tacgia
add  constraint FK_sach_tacgia foreign key (masach) 
    references sach(masach) 
    on update cascade on delete cascade;
alter table sach_tacgia
add constraint FK_sach_tacgia_matacgia foreign key (matacgia) 
    references tacgia(matacgia)
    on update cascade
    on delete cascade;
alter table sach_donhang
add constraint FK_sach_donhang_madonhang 
    foreign key (madonhang)
    references donhang(madonhang)
    on update cascade
    on delete cascade;
alter table sach_donhang
add constraint FK_sach_donhang_masach
    foreign key (masach) 
    references sach(masach)
    on update cascade
    on delete cascade
;