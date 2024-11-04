USE QUAN_LY_DIEM_SINH_VIEN;


-- Insert into Khoa
INSERT INTO Khoa
  (MaKhoa, TenKhoa)
VALUES
  (1, 'Công Nghệ Thông Tin'),
  (2, 'Kỹ Thuật Điện'),
  (3, 'Quản Trị Kinh Doanh');

-- Insert into HeDaoTao
INSERT INTO HeDaoTao
  (MaHe, TenHe)
VALUES
  (1, 'Đại Học'),
  (2, 'Cao Đẳng');

-- Insert into Lop
INSERT INTO Lop
  (MaLop, TenLop, MaKhoa, MaHe)
VALUES
  (1, 'CNTT1', 1, 1),
  (2, 'KTED1', 2, 1),
  (3, 'QTKD1', 3, 1);

UPDATE Lop
SET SoLuongSinhVien = 0
WHERE SoLuongSinhVien IS NULL;

-- Insert into GiangVien
INSERT INTO GiangVien
  (MaGV, TenGV, ChucVu, MaKhoa)
VALUES
  (1, 'Nguyễn Văn Tú', 'Giảng Viên', 1),
  (2, 'Trần Thị Bình', 'Giảng viên trợ giảng', 2),
  (3, 'Lê Văn Công', 'Phó giáo sư', 3);

-- Insert into MonHoc
INSERT INTO MonHoc
  (MaMon, TenMon, SoTinChi, MaKhoa)
VALUES
  (1, 'Lập Trình Cơ Sở', 3, 1),
  (2, 'Điện Học', 4, 2),
  (3, 'Quản Trị Kinh Doanh', 3, 3);

-- Insert into SinhVien
INSERT INTO SinhVien
  (MaSV, TenSV, NgaySinh, GioiTinh, MaLop)
VALUES
  (1, 'Nguyễn Văn Duy', '2004-01-15', 'Nam', 1),
  (2, 'Trần Thu Đào', '2004-05-20', 'Nữ', 2),
  (3, 'Lê Ngọc Phú', '2003-08-30', 'Nam', 3);

-- Insert into Diem
INSERT INTO Diem
  (MaSV, MaMon, DiemSo)
VALUES
  (1, 1, 8.5),
  (2, 2, 7.0),
  (3, 3, 9.0);