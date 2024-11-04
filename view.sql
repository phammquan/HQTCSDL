USE QUAN_LY_DIEM_SINH_VIEN;
GO

-- Tạo hoặc sửa đổi View để hiển thị điểm các môn học của từng sinh viên mà không sử dụng JOIN
CREATE OR ALTER VIEW View_DiemSinhVien
AS
  SELECT
    Diem.MaSV,
    (SELECT TenSV
    FROM SinhVien
    WHERE SinhVien.MaSV = Diem.MaSV) AS TenSV,
    Diem.MaMon,
    (SELECT TenMon
    FROM MonHoc
    WHERE MonHoc.MaMon = Diem.MaMon) AS TenMon,
    Diem.DiemSo
  FROM
    Diem;
GO

SELECT *
FROM View_DiemSinhVien
ORDER BY MaSV, MaMon;
GO



CREATE VIEW View_DiemTrungBinh_SinhVien
AS
  SELECT
    Diem.MaSV,
    (SELECT TenSV
    FROM SinhVien
    WHERE SinhVien.MaSV = Diem.MaSV) AS TenSV,
    AVG(Diem.DiemSo) AS DiemTrungBinh
  FROM
    Diem
  GROUP BY
  Diem.MaSV;
GO

SELECT *
FROM View_DiemTrungBinh_SinhVien;