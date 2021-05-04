# Exercicis_MP02_UF03
# POO
| Exercici        | Estat           | Nota  | 
| ------------- |:-------------:| -----:|
| [Exercici 8](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_008.sql) | Acabat |  |
| [Exercici 9](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_009.sql) | Acabat |  |
| [Exercici 11](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_011.sql) | Acabat |  |
| [Exercici 12](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_012.sql) | Acabat |  |
| [Exercici 13](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_013.sql) | Acabat |  |

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_008.sql)

**2. Contingut del fitxer**

```sql
use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

call act8();
```

**3. Sortida de la creació del procediment**
```sql
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;

   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;

      if final = 1 then
         leave elbucle;
      end if;

      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;

      select titol, rendibilitat;

   end loop elbucle;
   close elcursor;
end
--------------

Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> delimiter ;
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
--------------
call act8()
--------------

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| La busqueda | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| La terminal | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Iron Man | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.00 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql>
```
---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**

[Act09.sql](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_009.sql)

**2. Contingut del fitxer**
```sql
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
```

**3. Sortida de la creació del procediment**
```sql
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
end
--------------

Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> delimiter ;
```

**4. Sortida de l'execució del procediment**
```sql
   mysql> call act9();
--------------
call act9()
--------------

+--------------+------+------+-----------------+
| nom          | sexe | edat | po_tipusDePaper |
+--------------+------+------+-----------------+
| Nicolas Cage | home |   57 | madur           |
+--------------+------+------+-----------------+
1 row in set (0.00 sec)

+--------------+------+------+-----------------+
| nom          | sexe | edat | po_tipusDePaper |
+--------------+------+------+-----------------+
| Diane Kruger | dona |   45 | madur           |
+--------------+------+------+-----------------+
1 row in set (0.00 sec)

+-----------+------+------+-----------------+
| nom       | sexe | edat | po_tipusDePaper |
+-----------+------+------+-----------------+
| Tom Hanks | home |   65 | gran            |
+-----------+------+------+-----------------+
1 row in set (0.00 sec)

+----------------------+------+------+-----------------+
| nom                  | sexe | edat | po_tipusDePaper |
+----------------------+------+------+-----------------+
| Catherine Zeta-Jones | dona |   52 | madur           |
+----------------------+------+------+-----------------+
1 row in set (0.00 sec)

+---------------+------+------+-----------------+
| nom           | sexe | edat | po_tipusDePaper |
+---------------+------+------+-----------------+
| Javier Bardem | home |   52 | madur           |
+---------------+------+------+-----------------+
1 row in set (0.00 sec)

+------------+------+------+-----------------+
| nom        | sexe | edat | po_tipusDePaper |
+------------+------+------+-----------------+
| Tom Cruise | home |   59 | madur           |
+------------+------+------+-----------------+
1 row in set (0.00 sec)

+------------+------+------+-----------------+
| nom        | sexe | edat | po_tipusDePaper |
+------------+------+------+-----------------+
| Jamie Foxx | home |   54 | madur           |
+------------+------+------+-----------------+
1 row in set (0.00 sec)

+--------------+------+------+-----------------+
| nom          | sexe | edat | po_tipusDePaper |
+--------------+------+------+-----------------+
| Jessica Alba | dona |   40 | madur           |
+--------------+------+------+-----------------+
1 row in set (0.00 sec)

+---------------+------+------+-----------------+
| nom           | sexe | edat | po_tipusDePaper |
+---------------+------+------+-----------------+
| Ioan Gruffudd | home |   48 | madur           |
+---------------+------+------+-----------------+
1 row in set (0.01 sec)

+-------------------+------+------+-----------------+
| nom               | sexe | edat | po_tipusDePaper |
+-------------------+------+------+-----------------+
| Robert Downey Jr. | home |   56 | madur           |
+-------------------+------+------+-----------------+
1 row in set (0.01 sec)

+-----------------+------+------+-----------------+
| nom             | sexe | edat | po_tipusDePaper |
+-----------------+------+------+-----------------+
| Gwyneth Paltrow | dona |   49 | madur           |
+-----------------+------+------+-----------------+
1 row in set (0.01 sec)

+-----------------+------+------+-----------------+
| nom             | sexe | edat | po_tipusDePaper |
+-----------------+------+------+-----------------+
| Chris Hemsworth | home |   38 | adult           |
+-----------------+------+------+-----------------+
1 row in set (0.01 sec)

+--------------+------+------+-----------------+
| nom          | sexe | edat | po_tipusDePaper |
+--------------+------+------+-----------------+
| Mark Ruffalo | home |   54 | madur           |
+--------------+------+------+-----------------+
1 row in set (0.01 sec)

+-------------+------+------+-----------------+
| nom         | sexe | edat | po_tipusDePaper |
+-------------+------+------+-----------------+
| Chris Evans | home |   40 | madur           |
+-------------+------+------+-----------------+
1 row in set (0.01 sec)

+--------------------+------+------+-----------------+
| nom                | sexe | edat | po_tipusDePaper |
+--------------------+------+------+-----------------+
| Scarlett Johansson | dona |   37 | adult           |
+--------------------+------+------+-----------------+
1 row in set (0.01 sec)

+---------------+------+------+-----------------+
| nom           | sexe | edat | po_tipusDePaper |
+---------------+------+------+-----------------+
| Jeremy Renner | home |   40 | adult           |
+---------------+------+------+-----------------+
1 row in set (0.01 sec)

+--------------+------+------+-----------------+
| nom          | sexe | edat | po_tipusDePaper |
+--------------+------+------+-----------------+
| James Spader | home |   61 | adult           |
+--------------+------+------+-----------------+
1 row in set (0.01 sec)

+-----------------+------+------+-----------------+
| nom             | sexe | edat | po_tipusDePaper |
+-----------------+------+------+-----------------+
| Michael Chiklis | home |   52 | madur           |
+-----------------+------+------+-----------------+
1 row in set (0.01 sec)

+---------------+------+------+-----------------+
| nom           | sexe | edat | po_tipusDePaper |
+---------------+------+------+-----------------+
| Hayley Atwell | dona |   39 | adult           |
+---------------+------+------+-----------------+
1 row in set (0.01 sec)

+----------------+------+------+-----------------+
| nom            | sexe | edat | po_tipusDePaper |
+----------------+------+------+-----------------+
| Sebastian Stan | home |   39 | adult           |
+----------------+------+------+-----------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**

[Act11.sql](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_011.sql)

**2. Contingut del fitxer**
```sql
   USE videoclub;
DROP FUNCTION IF EXISTS act11;

DELIMITER //
CREATE FUNCTION act11(peCodiPeli SMALLINT UNSIGNED) 
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE quantitatPrestecs SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO quantitatPrestecs
   FROM     PRESTECS
   WHERE    id_peli = peCodiPeli;

   RETURN quantitatPrestecs;
END//
DELIMITER ;
  SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
   FROM    PELLICULES
   WHERE   id_peli = 1;
```

**3. Sortida de la creació del procediment**
```sql
   CREATE FUNCTION act11(peCodiPeli SMALLINT UNSIGNED)
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE quantitatPrestecs SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO quantitatPrestecs
   FROM     PRESTECS
   WHERE    id_peli = peCodiPeli;

   RETURN quantitatPrestecs;
END
--------------

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
```

**4. Sortida de l'execució del procediment**
```sql
   mysql>   SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
    ->    FROM    PELLICULES
    ->    WHERE   id_peli = 1;
--------------
SELECT  titol_peli Titol, act11(1) "Quantitat exemplars"
   FROM    PELLICULES
   WHERE   id_peli = 1
--------------

+-------------+---------------------+
| Titol       | Quantitat exemplars |
+-------------+---------------------+
| La busqueda |                   3 |
+-------------+---------------------+
1 row in set (0.00 sec)
```
---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**

[Act12.sql](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_012.sql)

**2. Contingut del fitxer**
```sql
   USE videoclub;
DROP FUNCTION IF EXISTS act12;
DELIMITER //
CREATE FUNCTION act12(CodiPeli SMALLINT UNSIGNED) 
       RETURNS Smallint
       DETERMINISTIC
BEGIN
   DECLARE idActor Smallint UNSIGNED;
DECLARE final int default false;
 
DECLARE elcursor cursor for
       SELECT   id_actor
   FROM     ACTORS_PELLICULES
   WHERE    id_peli = CodiPeli
   AND principal = 1;
   
 DECLARE continue handler for not found SET final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into idActor;

      if final = 1 then
         leave elbucle;
      end if;
	
	RETURN idActor;
   END loop elbucle;
   close elcursor;
   
END//
DELIMITER ;

SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = act12(2) AND id_peli = 2;
```

**3. Sortida de la creació del procediment**
```sql
   
CREATE FUNCTION act12(CodiPeli SMALLINT UNSIGNED)
       RETURNS Smallint
       DETERMINISTIC
BEGIN
   DECLARE idActor Smallint UNSIGNED;
DECLARE final int default false;

DECLARE elcursor cursor for
       SELECT   id_actor
   FROM     ACTORS_PELLICULES
   WHERE    id_peli = CodiPeli
   AND principal = 1;

 DECLARE continue handler for not found SET final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into idActor;

      if final = 1 then
         leave elbucle;
      end if;

RETURN idActor;
   END loop elbucle;
   close elcursor;

END
--------------

Query OK, 0 rows affected (0.00 sec)
```

**4. Sortida de l'execució del procediment**
```sql
   mysql> SELECT ACTORS.nom_actor, PELLICULES.titol_peli
    -> FROM ACTORS , PELLICULES
    -> WHERE id_actor = act12(2) AND id_peli = 2;
--------------
SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = act12(2) AND id_peli = 2
--------------

+-----------+-------------+
| nom_actor | titol_peli  |
+-----------+-------------+
| Tom Hanks | La terminal |
+-----------+-------------+
1 row in set (0.00 sec)
```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**

[Act13.sql](https://github.com/MartiPuigGinebro/Exercicis_MP02_UF03/blob/master/PuigMarti_Act_03_ProcEmm_MySQL_Apartat_013.sql)

**2. Contingut del fitxer**
```sql
   USE videoclub;
DROP FUNCTION IF EXISTS act13;

DELIMITER //
CREATE FUNCTION act13() 
       RETURNS bigint UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE quantitatPrestecs bigint UNSIGNED;

   SELECT   MAX(PELLICULES.recaudacio_peli)
        INTO quantitatPrestecs
   FROM     PELLICULES;

   RETURN quantitatPrestecs;
END//
DELIMITER ;

SELECT
  PELLICULES.id_peli,
  ACTORS_PELLICULES.principal,
  ACTORS.nom_actor,
  act13() "Recaudació"
FROM
  PELLICULES
LEFT JOIN
  ACTORS_PELLICULES ON PELLICULES.id_peli = ACTORS_PELLICULES.id_peli
LEFT JOIN
  ACTORS ON ACTORS_PELLICULES.id_actor = ACTORS.id_actor
WHERE
  recaudacio_peli = act13() AND ACTORS_PELLICULES.principal = 1;
```

**3. Sortida de la creació del procediment**
```sql
   
CREATE FUNCTION act13()
       RETURNS bigint UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE quantitatPrestecs bigint UNSIGNED;

   SELECT   MAX(PELLICULES.recaudacio_peli)
        INTO quantitatPrestecs
   FROM     PELLICULES;

   RETURN quantitatPrestecs;
END
--------------

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
```

**4. Sortida de l'execució del procediment**
```sql
   mysql> SELECT
    ->   PELLICULES.id_peli,
    ->   ACTORS_PELLICULES.principal,
    ->   ACTORS.nom_actor,
    ->   act13() "Recaudació"
    -> FROM
    ->   PELLICULES
    -> LEFT JOIN
    ->   ACTORS_PELLICULES ON PELLICULES.id_peli = ACTORS_PELLICULES.id_peli
    -> LEFT JOIN
    ->   ACTORS ON ACTORS_PELLICULES.id_actor = ACTORS.id_actor
    -> WHERE
    ->   recaudacio_peli = act13() AND ACTORS_PELLICULES.principal = 1;
--------------
SELECT
  PELLICULES.id_peli,
  ACTORS_PELLICULES.principal,
  ACTORS.nom_actor,
  act13() "Recaudació"
FROM
  PELLICULES
LEFT JOIN
  ACTORS_PELLICULES ON PELLICULES.id_peli = ACTORS_PELLICULES.id_peli
LEFT JOIN
  ACTORS ON ACTORS_PELLICULES.id_actor = ACTORS.id_actor
WHERE
  recaudacio_peli = act13() AND ACTORS_PELLICULES.principal = 1
--------------

+---------+-----------+--------------------+-------------+
| id_peli | principal | nom_actor          | Recaudació  |
+---------+-----------+--------------------+-------------+
|       8 |         1 | Robert Downey Jr.  |  1519557910 |
|       8 |         1 | Chris Hemsworth    |  1519557910 |
|       8 |         1 | Mark Ruffalo       |  1519557910 |
|       8 |         1 | Chris Evans        |  1519557910 |
|       8 |         1 | Scarlett Johansson |  1519557910 |
|       8 |         1 | Jeremy Renner      |  1519557910 |
+---------+-----------+--------------------+-------------+
6 rows in set (0.01 sec)
```

---

