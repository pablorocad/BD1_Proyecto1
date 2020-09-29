OPTIONS (SKIP=1)
load data infile 'DataCenterData.csv' into table temp_informacion
fields terminated by ";" optionally enclosed by '"'(

nombre_compania,
contacto_compania,
correo_compania,
telefono_compania,
tipo,
nombre,
correo,
telefono,
fecha_registro,
direccion,
ciudad,
codigo_postal,
region,
producto,
categoria_producto,
cantidad,
precio_unitario

)
