USE videoclub;
DROP FUNCTION IF EXISTS act11;

DELIMITER //
CREATE FUNCTION act11(peCodiPeli SMALLINT UNSIGNED) 
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE QtatExemplars SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO QtatExemplars
   FROM     EXEMPLARS
   WHERE    id_peli = peCodiPeli;

   RETURN QtatExemplars;
END//
DELIMITER ;
SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
FROM    PELLICULES
 WHERE   id_peli = 1;