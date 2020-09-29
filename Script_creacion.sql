CREATE TABLE categoria (
    cod_categoria  INTEGER NOT NULL,
    nombre         VARCHAR2(100) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( cod_categoria );

CREATE TABLE ciudad (
    cod_ciudad         INTEGER NOT NULL,
    nombre             VARCHAR2(100) NOT NULL,
    region_cod_region  INTEGER NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( cod_ciudad );

CREATE TABLE compania (
    cod_compania       INTEGER NOT NULL,
    nombre_compania    VARCHAR2(100) NOT NULL,
    contacto_compania  VARCHAR2(100) NOT NULL,
    correo_compania    VARCHAR2(100) NOT NULL,
    telefono_compania  VARCHAR2(20) NOT NULL
);

ALTER TABLE compania ADD CONSTRAINT compania_pk PRIMARY KEY ( cod_compania );

CREATE TABLE detalle_orden (
    cod_detalle            INTEGER NOT NULL,
    cantidad               INTEGER NOT NULL,
    orden_cod_orden        INTEGER NOT NULL,
    producto_cod_producto  INTEGER NOT NULL
);

ALTER TABLE detalle_orden ADD CONSTRAINT detalle_orden_pk PRIMARY KEY ( cod_detalle );

CREATE TABLE orden (
    cod_orden              INTEGER NOT NULL,
    compania_cod_compania  INTEGER NOT NULL,
    persona_cod_persona    INTEGER NOT NULL
);

ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( cod_orden );

CREATE TABLE persona (
    cod_persona            INTEGER NOT NULL,
    nombre                 VARCHAR2(100) NOT NULL,
    correo                 VARCHAR2(100) NOT NULL,
    telefono               VARCHAR2(20) NOT NULL,
    fecha_registro         DATE NOT NULL,
    direccion              VARCHAR2(250) NOT NULL,
    tipo_persona_cod_tipo  INTEGER NOT NULL,
    ciudad_cod_ciudad      INTEGER NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( cod_persona );

CREATE TABLE producto (
    cod_producto             INTEGER NOT NULL,
    nombre                   VARCHAR2(100) NOT NULL,
    precio_unitario          NUMBER(8, 2) NOT NULL,
    categoria_cod_categoria  INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( cod_producto );

CREATE TABLE region (
    cod_region  INTEGER NOT NULL,
    nombre      VARCHAR2(100) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( cod_region );

CREATE TABLE temp_informacion (
    nombre_compania     VARCHAR2(100),
    contacto_compania   VARCHAR2(100),
    correo_compania     VARCHAR2(100),
    telefono            VARCHAR2(20),
    tipo                VARCHAR2(1),
    nombre_persona      VARCHAR2(100),
    correo_persona      VARCHAR2(100),
    telefono_persona    VARCHAR2(20),
    fecha_registro      VARCHAR2(100),
    direccion           VARCHAR2(250),
    ciudad              VARCHAR2(100),
    codigo_postal       VARCHAR2(100),
    region              VARCHAR2(100),
    producto            VARCHAR2(100),
    categoria_producto  VARCHAR2(100),
    cantidad            VARCHAR2(100),
    precio_unitario     VARCHAR2(100)
);

CREATE TABLE tipo_persona (
    cod_tipo  INTEGER NOT NULL,
    tipo      VARCHAR2(10) NOT NULL
);

ALTER TABLE tipo_persona ADD CONSTRAINT tipo_persona_pk PRIMARY KEY ( cod_tipo );

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_region_fk FOREIGN KEY ( region_cod_region )
        REFERENCES region ( cod_region );

ALTER TABLE detalle_orden
    ADD CONSTRAINT detalle_orden_orden_fk FOREIGN KEY ( orden_cod_orden )
        REFERENCES orden ( cod_orden );

ALTER TABLE detalle_orden
    ADD CONSTRAINT detalle_orden_producto_fk FOREIGN KEY ( producto_cod_producto )
        REFERENCES producto ( cod_producto );

ALTER TABLE orden
    ADD CONSTRAINT orden_compania_fk FOREIGN KEY ( compania_cod_compania )
        REFERENCES compania ( cod_compania );

ALTER TABLE orden
    ADD CONSTRAINT orden_persona_fk FOREIGN KEY ( persona_cod_persona )
        REFERENCES persona ( cod_persona );

ALTER TABLE persona
    ADD CONSTRAINT persona_ciudad_fk FOREIGN KEY ( ciudad_cod_ciudad )
        REFERENCES ciudad ( cod_ciudad );

ALTER TABLE persona
    ADD CONSTRAINT persona_tipo_persona_fk FOREIGN KEY ( tipo_persona_cod_tipo )
        REFERENCES tipo_persona ( cod_tipo );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_cod_categoria )
        REFERENCES categoria ( cod_categoria );
