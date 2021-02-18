DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS rendibilitatPelicula //
CREATE PROCEDURE rendibilitatPelicula(
    IN pe_codi smallint unsigned
)
BEGIN
    DECLARE recaudacio bigint unsigned;
    DECLARE pressupost bigint unsigned;
    DECLARE nivellRecaudacio varchar(9);

    SELECT recaudacio_peli
        INTO recaudacio
    FROM PELLICULES
    WHERE PELLICULES.id_peli=pe_codi;

    SELECT pressupost_peli
        INTO pressupost
    FROM PELLICULES
    WHERE PELLICULES.id_peli=pe_codi;

    SELECT titol_peli
    FROM PELLICULES
    WHERE PELLICULES.id_peli=pe_codi;

    IF recaudacio < pressupost THEN 
        SET @nivellRecaudacio = "Deficient";
        ELSEIF recaudacio*2 < pressupost THEN
        SET @nivellRecaudacio = "Suficient";
            ELSE 
            SET @nivellRecaudacio = "Bona";
            END IF;
END //
DELIMITER ;
CALL rendibilitatPelicula(1);
SELECT @nivellRecaudacio;