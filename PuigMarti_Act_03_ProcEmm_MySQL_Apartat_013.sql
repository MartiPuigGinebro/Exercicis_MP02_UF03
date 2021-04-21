USE videoclub;
DROP FUNCTION IF EXISTS act13;

DELIMITER //
CREATE FUNCTION act13() 
       RETURNS bigint UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE quantitatPrestecs bigint UNSIGNED;

   SELECT   MAX(PELLICULES.recaudacio_peli)
        INTO quantitatPrestecs
   FROM     PELLICULES;

   RETURN quantitatPrestecs;
END//
DELIMITER ;
  SELECT  titol_peli Titol, act13() "Quantitat exemplars"
   FROM    PELLICULES;
