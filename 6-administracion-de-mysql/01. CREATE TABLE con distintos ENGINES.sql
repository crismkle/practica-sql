CREATE TABLE df_table(ID INT, NOMBRE VARCHAR(100));

ALTER TABLE df_table ENGINE MyISAM;

CREATE TABLE df_table1 (D INT, NOMBRE VARCHAR(100)) ENGINE = MEMORY;

SHOW ENGINES;