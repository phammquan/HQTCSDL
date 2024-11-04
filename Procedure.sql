USE QUAN_LY_DIEM_SINH_VIEN;

--Thêm sửa xóa SinhVien
CREATE PROCEDURE AddSinhVien
  @MaSV INT,
  @TenSV NVARCHAR(100),
  @NgaySinh DATE,
  @GioiTinh NVARCHAR(10),
  @MaLop INT
AS
BEGIN
  INSERT INTO SinhVien
    (MaSV, TenSV, NgaySinh, GioiTinh, MaLop)
  VALUES
    (@MaSV, @TenSV, @NgaySinh, @GioiTinh, @MaLop);
END

CREATE PROCEDURE UpdateSinhVien
  @MaSV INT,
  @TenSV NVARCHAR(100),
  @NgaySinh DATE,
  @GioiTinh NVARCHAR(10),
  @MaLop INT
AS
BEGIN
  UPDATE SinhVien
  SET TenSV = @TenSV,
      NgaySinh = @NgaySinh,
      GioiTinh = @GioiTinh,
      MaLop = @MaLop
  WHERE MaSV = @MaSV;
END

CREATE PROCEDURE DeleteSinhVien
  @MaSV INT
AS
BEGIN
  DELETE FROM SinhVien
  WHERE MaSV = @MaSV;
END


-- thêm sửa xóa môn học
CREATE PROCEDURE AddMonHoc
  @MaMon INT,
  @TenMon NVARCHAR(100),
  @SoTinChi INT,
  @MaKhoa INT
AS
BEGIN
  INSERT INTO MonHoc
    (MaMon, TenMon, SoTinChi, MaKhoa)
  VALUES
    (@MaMon, @TenMon, @SoTinChi, @MaKhoa);
END
GO

CREATE PROCEDURE UpdateMonHoc
  @MaMon INT,
  @TenMon NVARCHAR(100),
  @SoTinChi INT,
  @MaKhoa INT
AS
BEGIN
  UPDATE MonHoc
    SET TenMon = @TenMon,
        SoTinChi = @SoTinChi,
        MaKhoa = @MaKhoa
    WHERE MaMon = @MaMon;
END
GO

CREATE PROCEDURE DeleteMonHoc
  @MaMon INT
AS
BEGIN
  DELETE FROM MonHoc
    WHERE MaMon = @MaMon;
END
GO

--Thêm sửa xóa điểm
CREATE PROCEDURE AddDiem
  @MaSV INT,
  @MaMon INT,
  @DiemSo FLOAT
AS
BEGIN
  INSERT INTO Diem
    (MaSV, MaMon, DiemSo)
  VALUES
    (@MaSV, @MaMon, @DiemSo);
END
GO

CREATE PROCEDURE UpdateDiem
  @MaSV INT,
  @MaMon INT,
  @DiemSo FLOAT
AS
BEGIN
  UPDATE Diem
  SET DiemSo = @DiemSo
  WHERE MaSV = @MaSV AND MaMon = @MaMon;
END
GO

CREATE PROCEDURE DeleteDiem
  @MaSV INT,
  @MaMon INT
AS
BEGIN
  DELETE FROM Diem
  WHERE MaSV = @MaSV AND MaMon = @MaMon;
END
GO