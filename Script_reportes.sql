SELECT * FROM region;
SELECT * FROM categoria;
SELECT * FROM persona;
SELECT * FROM compania;
SELECT * FROM producto;
SELECT * FROM tipo_persona;
SELECT * FROM ciudad;
SELECT * FROM codigo_postal;
SELECT * FROM orden;

--1
SELECT p.nombre
FROM orden o
INNER JOIN persona p
ON o.persona_cod_persona = p.cod_persona