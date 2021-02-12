USE VIDEOCLUB;
DELIMITER / / DROP PROCEDURE IF EXISTS sp_08_llistaActorsSexe / / CREATE PROCEDURE sp_08_llistaActorsSexe (IN pi_sexeActor varchar(6)) BEGIN
SELECT nom_actor
FROM ACTORS
WHERE sexe_actor = pi_sexeActor;
END / / DELIMITER;
/* mysql> call sp_08_llistaActorsSexe("home")
 -> ;
 --------------
 call sp_08_llistaActorsSexe("home")
 --------------
 
 +-------------------+
 | nom_actor         |
 +-------------------+
 | Nicolas Cage      |
 | Tom Hanks         |
 | Javier Bardem     |
 | Tom Cruise        |
 | Jamie Foxx        |
 | Ioan Gruffudd     |
 | Robert Downey Jr. |
 | Chris Hemsworth   |
 | Mark Ruffalo      |
 | Chris Evans       |
 | Jeremy Renner     |
 | James Spader      |
 | Michael Chiklis   |
 | Sebastian Stan    |
 +-------------------+
 14 rows in set (0.00 sec)
 
 Query OK, 0 rows affected (0.00 sec) */