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

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

