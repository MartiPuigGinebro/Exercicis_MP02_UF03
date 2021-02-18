DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS peliculasMesRecaptacioAmbTitol //
CREATE PROCEDURE peliculasMesRecaptacioAmbTitol()
BEGIN
DECLARE titol varchar(40);
DECLARE recaudacio_pelicula bigint(20) unsigned;
SELECT titol_peli, recaudacio_peli
INTO @titol_pelicula, @recaudacio_pelicula
FROM   PELLICULES
WHERE  recaudacio_peli = ( SELECT max(recaudacio_peli)
FROM   PELLICULES );
END // 
DELIMITER ;
CALL peliculasMesRecaptacioAmbTitol();
SELECT @titol_pelicula, @recaudacio_pelicula;