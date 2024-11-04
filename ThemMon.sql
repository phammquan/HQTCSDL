-- Thêm sinh viên mới
EXEC AddSinhVien 
    @MaSV = 7,
    @TenSV = N'Nguyễn Văn A',
    @NgaySinh = '2002-03-10',
    @GioiTinh = N'Nam',
    @MaLop = 1;

-- Thêm điểm cho nhiều môn học
EXEC AddDiem 
    @MaDiem = 7,
    @MaSV = 4,
    @MaMon = 1,
    @DiemSo = 8.5;

EXEC AddDiem 
    @MaDiem = 8,
    @MaSV = 4,
    @MaMon = 2,
    @DiemSo = 7.5;

SELECT *
FROM View_DiemSinhVien;