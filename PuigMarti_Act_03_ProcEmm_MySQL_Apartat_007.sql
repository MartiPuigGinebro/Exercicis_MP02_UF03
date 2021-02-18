DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS tipusDeActor //
CREATE PROCEDURE tipusDeActor(
    IN pe_codi smallint unsigned,
    OUT po_tipusDePaper varchar(6)
) 
BEGIN
    DECLARE edat bigint;
    DECLARE nom varchar(30);
    DECLARE sexe varchar(6);

    SELECT nom_actor, sexe_actor, YEAR(CURDATE())-anynaix_actor
      INTO @nom, @sexe, @edat
    FROM ACTORS 
    WHERE id_actor=pe_codi;

    IF @edat < 15 THEN
    SET po_tipusDePaper ="nen";
    ELSEIF @edat > 15 AND @edat < 25 THEN
    SET po_tipusDePaper ="jove";
    ELSEIF @edat > 26 AND @edat < 40 THEN
    SET po_tipusDePaper ="adult";
    ELSEIF @edat > 41 AND @edat < 60 THEN
    SET po_tipusDePaper ="madur";
    ELSEIF @edat > 61 THEN
    SET po_tipusDePaper ="gran";
    END IF;

    SELECT @nom, @sexe, @edat, @po_tipusDePaper;

END //
DELIMITER ;
CALL tipusDeActor(1,@estat);