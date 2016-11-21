USE test;

DECLARE @id INT
SET @id = 0
WHILE (@id < 100000000)
BEGIN
SELECT @id = @id + 1
INSERT INTO ROWS(id) VALUES(@id)
END
GO