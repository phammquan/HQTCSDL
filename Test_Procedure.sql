USE QUAN_LY_DIEM_SINH_VIEN;

-- Bắt đầu Transaction để dễ dàng rollback nếu cần
BEGIN TRANSACTION;

-- 1. Thêm SinhVien
EXEC AddSinhVien 
    @MaSV = 6,
    @TenSV = N'Nguyễn Văn Quang',
    @NgaySinh = '2001-12-05',
    @GioiTinh = N'Nam',
    @MaLop = 2;


-- 2. Sửa SinhVien
EXEC UpdateSinhVien 
    @MaSV = 6,
    @TenSV = N'Nguyễn Văn Quang Updated',
    @NgaySinh = '2001-12-05',
    @GioiTinh = N'Nam',
    @MaLop = 3;



-- 3. Xóa SinhVien
EXEC DeleteSinhVien @MaSV = 6;



-- 4. Thêm Môn Học
EXEC AddMonHoc 
    @MaMon = 5,
    @TenMon = N'An Toàn Thông Tin',
    @SoTinChi = 3,
    @MaKhoa = 1;



-- 5. Sửa Môn Học
EXEC UpdateMonHoc 
    @MaMon = 5,
    @TenMon = N'An Toàn Thông Tin Updated',
    @SoTinChi = 4,
    @MaKhoa = 1;


-- 6. Xóa Môn Học
EXEC DeleteMonHoc @MaMon = 5;


EXEC AddDiem 
    @MaSV = 2, 
    @MaMon = 2, 
    @DiemSo = 9;

EXEC UpdateDiem 
    @MaSV = 1, 
    @MaMon = 102, 
    @DiemSo = 8.0;

EXEC DeleteDiem 
    @MaSV = 3, 
    @MaMon = 3;
