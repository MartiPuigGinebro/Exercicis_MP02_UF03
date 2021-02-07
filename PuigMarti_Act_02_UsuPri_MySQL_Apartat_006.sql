DELIMITER //
CREATE PROCEDURE sp_treb_fills()
BEGIN
SELECT nom,cognom,nombre_fills
FROM TREBALLADORS
WHERE  nombre_fills > 0;
END //
DELIMITER ;
--Query OK, 0 rows affected (0.00 sec)