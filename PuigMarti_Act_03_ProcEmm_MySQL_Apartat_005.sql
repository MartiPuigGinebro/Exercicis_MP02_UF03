DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS mostrarNomEdatActorPrincipal //
CREATE PROCEDURE mostrarNomEdatActorPrincipal(
IN pe_codi smallint
) BEGIN
DECLARE nombre_actor varchar(30);
DECLARE edat_actor smallint(5) unsigned;
SELECT nom_actor, YEAR(CURDATE())-anynaix_actor
INTO @nombre_actor, @edat_actor
FROM ACTORS
INNER JOIN ACTORS_PELLICULES
ON ACTORS.id_actor=ACTORS_PELLICULES.id_actor
WHERE ACTORS_PELLICULES.id_peli=pe_codi AND ACTORS_PELLICULES.principal=1;
END //
DELIMITER ;
CALL mostrarNomEdatActorPrincipal(1);
SELECT @nombre_actor, @edat_actor;