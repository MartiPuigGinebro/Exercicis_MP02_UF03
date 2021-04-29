
ALTER TABLE PELLICULES
   ADD qtatVisualComp int unsigned,
    ADD qtatVisualParc int unsigned;
use videoclub;
delimiter //
drop trigger if exists act_17;

create trigger act_17
      after insert on VISUALITZACIONS
      for each row
         begin
           declare pa_qtat_visualitzacionsComp smallint unsigned;
        declare pa_qtat_visualitzacionsParc smallint unsigned;

           SELECT count(*)
             INTO pa_qtat_visualitzacionsComp
          FROM VISUALITZACIONS
              WHERE id_peli = new.id_peli AND temps IS NULL;

            UPDATE PELLICULES
             SET   qtatVisualComp = pa_qtat_visualitzacionsComp
             WHERE id_peli = new.id_peli;

            SELECT count(*)
             INTO pa_qtat_visualitzacionsParc
          FROM VISUALITZACIONS
              WHERE id_peli = new.id_peli AND temps IS NOT NULL;

           UPDATE PELLICULES
             SET   qtatVisualComp = pa_qtat_visualitzacionsParc
             WHERE id_peli = new.id_peli;
 end//
 
delimiter ;