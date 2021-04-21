use videoclub;
drop procedure if exists act9;
delimiter //
create procedure act9()
begin
   declare edat bigint;
   declare nom varchar(30);
   declare sexe varchar(6);
   declare final int default false;
   declare po_tipusDePaper varchar(6);
   declare elcursor cursor for
      SELECT ACTORS.sexe_actor, YEAR(CURDATE())-ACTORS.anynaix_actor, ACTORS.nom_actor
   FROM ACTORS;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into sexe, edat, nom;
      
      if final = 1 then
         leave elbucle;
      end if;
      
         IF edat < 15 THEN
    SET po_tipusDePaper ="nen";
    ELSEIF edat > 15 AND edat < 25 THEN
    SET po_tipusDePaper ="jove";
    ELSEIF edat > 26 AND edat < 40 THEN
    SET po_tipusDePaper ="adult";
    ELSEIF edat > 41 AND edat < 60 THEN
    SET po_tipusDePaper ="madur";
    ELSEIF edat > 61 THEN
    SET po_tipusDePaper ="gran";
    END IF;

    SELECT nom, sexe, edat, po_tipusDePaper;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

call act9();