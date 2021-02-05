USE empresa;
DELIMITER / / DROP PROCEDURE IF EXISTS sp05_SumaSous / / CREATE PROCEDURE sp05_SumaSous () BEGIN
DECLARE suma float;
DECLARE sumafutura float DEFAULT 0;
SET suma = 0;
SELECT SUM (SOU_TREB) INTO suma
FROM TREBALLADORS;
SELECT CONCAT (" Suma de sous actuals: ", suma) AS Actual;
SET @sumafutura = suma * 1.03;
SELECT CONCAT (" Suma de sous amb l'augment: ", @sumafutura) AS Futur;
END / / DELIMITER;