use videoclub;
drop procedure if exists act9;
delimiter //
create procedure act9()
begin
    DECLARE edat bigint;
    DECLARE nom varchar(30);
    DECLARE sexe varchar(6);
   declare final int default false;
   
   declare elcursor cursor for
SELECT ACTORS.sexe_actor, ACTORS.anynaix_actor, ACTORS`.`nom_actor
FROM ACTORS;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into sexe, edat, nom;
      
      if final = 1 then
         leave elbucle;
      end if;
      
         set sexe = ACTORS.sexe_actor;
         set edat = ACTORS.anynaix_actor;
         set nom = ACTORS.nom_actor;
      
      select sexe, edat, nom;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

call act9();