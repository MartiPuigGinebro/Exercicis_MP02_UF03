CREATE PROCEDURE 02_exercici_llistaActors () BEGIN
SELECT (nom_actor, anynaix_actor)
FROM ACTORS
WHERE (sexe_actor = "home")
END