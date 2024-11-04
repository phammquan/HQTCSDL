

USE QUAN_LY_DIEM_SINH_VIEN;
GO



-- Trigger để tăng SoLuongSinhVien sau khi thêm SinhVien
CREATE TRIGGER trg_AfterInsert_SinhVien
ON SinhVien
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE Lop
    SET SoLuongSinhVien = SoLuongSinhVien + (
        SELECT COUNT(*)
  FROM inserted
  WHERE inserted.MaLop = Lop.MaLop
    )
    WHERE MaLop IN (
        SELECT DISTINCT MaLop
  FROM inserted
    );
END
GO

-- Trigger để giảm SoLuongSinhVien sau khi xóa SinhVien
CREATE TRIGGER trg_AfterDelete_SinhVien
ON SinhVien
AFTER DELETE
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE Lop
    SET SoLuongSinhVien = SoLuongSinhVien - (
        SELECT COUNT(*)
  FROM deleted
  WHERE deleted.MaLop = Lop.MaLop
    )
    WHERE MaLop IN (
        SELECT DISTINCT MaLop
  FROM deleted
    );
END
GO

-- Trigger để cập nhật SoLuongSinhVien sau khi cập nhật SinhVien
CREATE TRIGGER trg_AfterUpdate_SinhVien
ON SinhVien
AFTER UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  IF UPDATE(MaLop)
    BEGIN
    -- Giảm SoLuongSinhVien cho MaLop cũ
    UPDATE Lop
        SET SoLuongSinhVien = SoLuongSinhVien - (
            SELECT COUNT(*)
    FROM deleted
    WHERE deleted.MaLop = Lop.MaLop
        )
        WHERE MaLop IN (
            SELECT DISTINCT MaLop
    FROM deleted
    WHERE MaLop <> (SELECT MaLop
    FROM inserted
    WHERE inserted.MaSV = deleted.MaSV)
        );

    -- Tăng SoLuongSinhVien cho MaLop mới
    UPDATE Lop
        SET SoLuongSinhVien = SoLuongSinhVien + (
            SELECT COUNT(*)
    FROM inserted
    WHERE inserted.MaLop = Lop.MaLop
        )
        WHERE MaLop IN (
            SELECT DISTINCT MaLop
    FROM inserted
    WHERE MaLop <> (SELECT MaLop
    FROM deleted
    WHERE deleted.MaSV = inserted.MaSV)
        );
  END
END
GO