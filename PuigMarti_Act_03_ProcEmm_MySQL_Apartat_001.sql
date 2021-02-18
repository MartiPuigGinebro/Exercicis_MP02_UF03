DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS mostrarNomActorIPaper //
CREATE PROCEDURE mostrarNomActorIPaper(
IN pe_codi smallint
) BEGIN
SELECT PELIS.titol_peli,
ACT_PELI.papel,
ACT.nom_actor
FROM PELLICULES PELIS
INNER JOIN ACTORS_PELLICULES ACT_PELI
INNER JOIN ACTORS ACT
ON  PELIS.id_peli=ACT_PELI.id_peli 
AND  ACT_PELI.id_actor=ACT.id_actor
WHERE PELIS.id_peli=pe_codi;
END //
DELIMITER ;
CALL mostrarNomActorIPaper(1);