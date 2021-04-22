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

SELECT
  PELLICULES.id_peli,
  ACTORS_PELLICULES.principal,
  ACTORS.nom_actor,
  act13() "Recaudació"
FROM
  PELLICULES
LEFT JOIN
  ACTORS_PELLICULES ON PELLICULES.id_peli = ACTORS_PELLICULES.id_peli
LEFT JOIN
  ACTORS ON ACTORS_PELLICULES.id_actor = ACTORS.id_actor
WHERE
  recaudacio_peli = act13() AND ACTORS_PELLICULES.principal = 1;