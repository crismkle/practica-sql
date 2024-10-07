-- Vemos qué privilegios tienen los usuarios
SELECT * FROM mysql.user;

-- Ver los privilegios de un usuaro específico
SHOW GRANTS FOR 'user04'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user04'@'%';