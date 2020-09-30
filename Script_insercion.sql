--Insertamos las regiones
INSERT INTO region(nombre)
SELECT DISTINCT region FROM temp_informacion;

--Insertamos las companias
INSERT INTO compania(nombre_compania, contacto_compania, correo_compania, telefono_compania)
SELECT DISTINCT nombre_compania, contacto_compania, correo_compania, telefono_compania 
FROM temp_informacion;

--Insertamos las categorias de producto
INSERT INTO categoria(nombre)
SELECT DISTINCT categoria_producto FROM temp_informacion;

--Insertamos tipo persona
INSERT INTO tipo_persona(tipo)
SELECT DISTINCT tipo FROM temp_informacion;

--Insertamos ciudades
INSERT INTO ciudad(nombre,region_cod_region)
SELECT DISTINCT t.ciudad, r.cod_region
FROM region r
INNER JOIN temp_informacion t
ON r.nombre = t.region;

--Insertamos codigo_postal
INSERT INTO codigo_postal(codigo,ciudad_cod_ciudad)
SELECT DISTINCT t.codigo_postal, c.cod_ciudad
FROM ciudad c
INNER JOIN temp_informacion t
ON c.nombre = t.ciudad;

--Insertamos producto
INSERT INTO producto(nombre,precio_unitario,categoria_cod_categoria)
SELECT DISTINCT t.producto,CAST(t.precio_unitario AS NUMBER(8,2)),c.cod_categoria
FROM categoria c
INNER JOIN temp_informacion t
ON c.nombre = t.categoria_producto;

--Insertamos persona
INSERT INTO persona(nombre,correo,telefono,fecha_registro,direccion,tipo_persona_cod_tipo,codigo_postal_cod_codigo)
SELECT DISTINCT t.nombre,t.correo,t.telefono,t.fecha_registro,t.direccion,tp.cod_tipo,cp.cod_codigo
FROM temp_informacion t
INNER JOIN tipo_persona tp
ON t.tipo = tp.tipo
INNER JOIN codigo_postal cp
ON t.codigo_postal = cp.codigo;

--Insertamos ORDEN
INSERT INTO orden(cantidad,compania_cod_compania,persona_cod_persona,producto_cod_producto)
SELECT t.cantidad,co.cod_compania,p.cod_persona,pr.cod_producto
FROM temp_informacion t
INNER JOIN compania co
ON t.nombre_compania = co.nombre_compania
INNER JOIN persona p
ON t.nombre = p.nombre
INNER JOIN producto pr
ON t.producto = pr.nombre;

TRUNCATE TABLE orden


SELECT * FROM region;
SELECT * FROM ciudad;
SELECT * FROM categoria;
SELECT * FROM temp_informacion;
SELECT * FROM codigo_postal;

SELECT COUNT(*) FROM region;
SELECT COUNT(*) FROM categoria;
SELECT COUNT(*) FROM persona;
SELECT COUNT(*) FROM compania;
SELECT COUNT(*) FROM producto;
SELECT COUNT(*) FROM tipo_persona;
SELECT COUNT(*) FROM ciudad;
SELECT COUNT(*) FROM codigo_postal;
SELECT COUNT(*) FROM orden;

DROP TABLE CATEGORIA;
DROP TABLE CIUDAD;
DROP TABLE COMPANIA;
DROP TABLE DETALLE_ORDEN;
DROP TABLE ORDEN;
DROP TABLE PERSONA;
DROP TABLE PRODUCTO;
DROP TABLE REGION;
DROP TABLE TIPO_PERSONA;
DROP TABLE CODIGO_POSTAL;
DROP TABLE TEMP_INFORMACION;



