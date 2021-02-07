DELIMITER //
CREATE PROCEDURE sp_treb_sous()
BEGIN
SELECT nom,cognom,sou
FROM TREBALLADORS;
END //
DELIMITER ;
--Query OK, 0 rows affected (0.00 sec)