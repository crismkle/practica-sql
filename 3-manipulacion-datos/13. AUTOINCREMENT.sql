CREATE TABLE tb_identificacion(
ID INT AUTO_INCREMENT NOT NULL,
DESCRIPCION VARCHAR(50) NULL,
PRIMARY KEY(ID)
);

SELECT * FROM tb_identificacion;

INSERT INTO tb_identificacion(descripcion)
VALUES('Cliente A');

INSERT INTO tb_identificacion(descripcion)
VALUES('Cliente B'),
('Cliente C'),
('Cliente D'),
('Cliente E');

DELETE FROM tb_identificacion WHERE ID=6;

INSERT INTO tb_identificacion(descripcion)
VALUES('Cliente G');

INSERT INTO tb_identificacion(id, descripcion)
VALUES(100, 'Cliente G');

INSERT INTO tb_identificacion(descripcion)
VALUES('Cliente H');
