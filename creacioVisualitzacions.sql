USE videoclub;
DROP TABLE IF EXISTS VISUALITZACIONS;
CREATE TABLE VISUALITZACIONS (
    id_peli smallint(5) unsigned NOT NULL,
    id_soci varchar(10) NOT NULL,
    temps time,
    PRIMARY KEY (id_peli, id_soci),
    FOREIGN KEY (id_peli) REFERENCES PELLICULES (id_peli),
    FOREIGN KEY (id_soci) REFERENCES SOCIS (id_soci)
);

INSERT INTO VISUALITZACIONS (id_peli,id_soci,temps) VALUES
(1,5555,'01:23:00'),
(2,4444,'01:25:20'),
(3,3333,'02:21:24'),
(4,2222,'01:25:20'),
(5,1111,'02:30:20'),
(6,2222,'01:10:21'),
(7,3333,'01:22:55'),
(8,2222,'02:45:59'),
(9,5555,'01:33:23'),
(10,2222,'02:10:22'),
(11,3333,'01:44:22'),
(12,5555,'03:01:11'),
(13,4444,'03:02:20'),
(14,2222,'01:11:09'),
(15,2222,'00:59:00');