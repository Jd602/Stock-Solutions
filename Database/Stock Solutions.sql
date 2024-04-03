-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-03-31 23:01:23 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE in_productos ( 
--  IDENTIFICADOR PRIMARIO
    prodid     INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA SI_SEDES
    prodsede   INTEGER NOT NULL, 
--  NOMBRE DEL PRODUCTO
    prodnomb   VARCHAR2(100 CHAR) NOT NULL, 
--  RELACIÓN CON LA TABLA TIPOPRODUCTO
    prodtipo   INTEGER NOT NULL, 
--  CANTIDAD DE PRODUCTOS EXISTENTES
    prodcant   INTEGER NOT NULL, 
--  COLOR DEL PRODUCTO, SI APLICA
    prodcolor  VARCHAR2(30 CHAR), 
--  PRECIO DE COMPRA DEL PRODUCTO
    prodprecom INTEGER NOT NULL, 
--  PRECIO DE VENTA DEL PRODUCTO
    prodpreven INTEGER NOT NULL, 
--  PROVEEDOR DEL PRODUCTO
    prodprovee VARCHAR2(50 CHAR) NOT NULL, 
--  USUARIO DE CREACIÓN DEL PRODUCTO, RELACIÓN CON LA TABLA SI_USUARIOS
    produscr   VARCHAR2(50 CHAR) NOT NULL, 
--  FECHA DE CREACIÓN DEL PRODUCTO
    prodfecr   DATE NOT NULL, 
--  USUARIO DE ACTUALIZACIÓN DEL PRODUCTO, RELACIÓN CON LA TABLA SI_USUARIOS
    produsact  VARCHAR2(50 CHAR) NOT NULL, 
--  FECHA DE ACTUALIZACIÓN DEL PRODUCTO
    prodfeact  DATE, 
--  IMAGEN DEL PRODUCTO
    prodimg    BLOB, 
--  ESTADO DEL PRODUCTO, A=ACTIVO, I=INACTIVO
    prodestado CHAR(1 CHAR) NOT NULL
);

ALTER TABLE in_productos ADD CONSTRAINT producto_pk PRIMARY KEY ( prodid );

CREATE TABLE si_ciudades ( 
--  IDENTIFICADOR PRINCIPAL DE LA CIUDAD
    ciudid   INTEGER NOT NULL, 
--  NOMBRE DE LA CIUDAD
    ciudnomb VARCHAR2(50 CHAR) NOT NULL, 
--  CÓDIGO POSTAL DE LA CIUDAD
    ciudcodi VARCHAR2(10 CHAR), 
--  OBSERVACIONES DE LA CIUDAD
    ciudobse VARCHAR2(255 CHAR)
);

ALTER TABLE si_ciudades ADD CONSTRAINT si_ciudades_pk PRIMARY KEY ( ciudid );

CREATE TABLE si_clieempr ( 
--  IDENTIFICADOR PRINCIPAL DE LA TABLA
    clemid    INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA
    clemclien VARCHAR2(50 CHAR) NOT NULL, 
--  RELACIÓN CON LA TABLA SI_EMPRESAS
    clemempr  INTEGER NOT NULL, 
--  OBSERVACIONES
    clemobse  VARCHAR2(255 CHAR)
);

ALTER TABLE si_clieempr ADD CONSTRAINT si_clem_pk PRIMARY KEY ( clemid );

CREATE TABLE si_clientes ( 
--  IDENTIFICADOR DEL CLIENTE
    clienteid      VARCHAR2(50 CHAR) NOT NULL, 
--  TIPO DE DOCUMENTO DEL CLIENTE, RELACIÓN CON LA TABLA SI_TIPODOCU
    clientetipodoc INTEGER NOT NULL, 
--  PRIMER NOMBRE DEL CLIENTE
    clientenomb1   VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO NOMBRE DEL CLIENTE, SI APLICA
    clientenomb2   VARCHAR2(50 CHAR), 
--  PRIMER APELLIDO DEL CLIENTE
    clienteapell1  VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO APELLIDO DEL CLIENTE, SI APLICA
    clienteapell2  VARCHAR2(50 CHAR), 
--  ESTADO DEL CLIENTE, 'A'=ACTIVO, 'I'=INACTIVO
    clienteestado  CHAR(1 CHAR) NOT NULL, 
--  CORREO DEL CLIENTE
    clientecorreo  VARCHAR2(100 CHAR), 
--  OBSERVACIONES DEL CLIENTE, SI APLICA
    clienteobse    VARCHAR2(255 CHAR), 
--  DIRECCIÓN DEL CLIENTE
    clientedir     VARCHAR2(255 CHAR), 
--  TELÉFONO DEL CLIENTE
    clientetelf    VARCHAR2(50 CHAR)
);

ALTER TABLE si_clientes ADD CONSTRAINT si_usuariosv1_pk PRIMARY KEY ( clienteid );

CREATE TABLE si_empresas ( 
--  IDENTIFICADOR PRINCIPAL DE LA EMPRESA
    emprid     INTEGER NOT NULL, 
--  NOMBRE DE LA EMPRESA
    emprnomb   VARCHAR2(100 CHAR) NOT NULL, 
--  CATEGORÍA O SECTOR EN QUE SE DESEMPEÑA LA EMPRESA
    emprcatg   VARCHAR2(50 CHAR) NOT NULL,
    emprmail   VARCHAR2(100 CHAR) NOT NULL, 
--  TELEFONOS DE LA EMPRESA, SE SEPARA POR COMAS 
    emprtelf   VARCHAR2(255 CHAR), 
--  ESTADO DE LA EMPRESA, 'A'= ACTIVO, 'I'=INACTIVO
    emprestado CHAR(1 CHAR) NOT NULL, 
--  OBSERVACIONES DE LA EMPRESA
    emprobser  VARCHAR2(255 CHAR)
);

ALTER TABLE si_empresas ADD CONSTRAINT si_empresas_pk PRIMARY KEY ( emprid );

CREATE TABLE si_proveedores ( 
--  IDENTIFICADOR DEL CLIENTE
    provid      VARCHAR2(50 CHAR) NOT NULL, 
--  TIPO DE DOCUMENTO DEL CLIENTE, RELACIÓN CON LA TABLA SI_TIPODOCU
    provtipodoc INTEGER NOT NULL, 
--  PRIMER NOMBRE DEL CLIENTE
    provnomb1   VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO NOMBRE DEL CLIENTE, SI APLICA
    provnomb2   VARCHAR2(50 CHAR), 
--  PRIMER APELLIDO DEL CLIENTE
    provapell1  VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO APELLIDO DEL CLIENTE, SI APLICA
    provapell2  VARCHAR2(50 CHAR), 
--  ESTADO DEL CLIENTE, 'A'=ACTIVO, 'I'=INACTIVO
    provestado  CHAR(1 CHAR) NOT NULL, 
--  CORREO DEL CLIENTE
    provcorreo  VARCHAR2(100 CHAR), 
--  OBSERVACIONES DEL CLIENTE, SI APLICA
    provobse    VARCHAR2(255 CHAR), 
--  TELEFONOS DEL CLIENTE, CADA NÚMERO SE SEPARA CON COMAS (,)
    provtelf    VARCHAR2(255 CHAR)
);

ALTER TABLE si_proveedores ADD CONSTRAINT si_clientesv1_pk PRIMARY KEY ( provid );

CREATE TABLE si_proveempresa ( 
--  IDENTIFICADOR PRINCIPAL DE LA TABLA
    premid      INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA SI_EMPRESAS
    premempresa INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA SI_EMPRESAS
    premprovee  VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE si_proveempresa ADD CONSTRAINT si_proveempresa_pk PRIMARY KEY ( premid );

CREATE TABLE si_sedes ( 
--  IDENTIFICADOR PRINCIPAL DE LA SEDE
    sedeid      INTEGER NOT NULL, 
--  NOMBRE DE LA SEDE
    sedenomb    VARCHAR2(100 CHAR) NOT NULL, 
--  EMPRESA A LA CUAL PERTENECE LA SEDE, RELACIÓN CON LA TABLA SI_EMPRESAS
    sedeempresa INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA SI_CIUDADES
    sedeciudad  INTEGER NOT NULL, 
--  DIRECCIÓN DE LA SEDE
    sededir     VARCHAR2(255 CHAR) NOT NULL, 
--  ESTADO DE LA SEDE
    sedeestado  VARCHAR2(1 CHAR) NOT NULL, 
--  TELÉFONO DE LA SEDE
    sedetelf    VARCHAR2(50 CHAR) NOT NULL, 
--  OBSERVACIONES DE LA SEDE
    sedeobserv  VARCHAR2(255 CHAR)
);

ALTER TABLE si_sedes ADD CONSTRAINT si_sedes_pk PRIMARY KEY ( sedeid );

CREATE TABLE si_usuarios ( 
--  IDENTIFICADOR DEL USUARIO, 
    usuaid       VARCHAR2(50 CHAR) NOT NULL, 
--  TIPO DE DOCUMENTO DEL USUARIO, RELACIÓN CON LA TABLA SI_TIPODOCU
    usuatipodocu INTEGER NOT NULL, 
--  PRIMER NOMBRE DEL USUARIO
    usuanomb1    VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO NOMBRE DEL USUARIO, SI APLICA
    usuanomb2    VARCHAR2(50 CHAR), 
--  PRIMER APELLIDO DEL USUARIO
    usuaapell1   VARCHAR2(50 CHAR) NOT NULL, 
--  SEGUNDO APELLIDO DEL USUARIO, SI APLICA
    usuaapell2   VARCHAR2(50 CHAR), 
--  RELACIÓN CON LA TABLA SI_SEDES
    usuasede     INTEGER NOT NULL, 
--  ESTADO DEL USUARIO, 'A'=ACTIVO, 'I'=INACTIVO
    usuaestado   CHAR(1 CHAR) NOT NULL, 
--  CARGO O ROL DEL USUARIO
    usuacargo    VARCHAR2(50 CHAR) NOT NULL, 
--  CORREO DEL USUARIO
    usuacorreo   VARCHAR2(100 CHAR) NOT NULL, 
--  PASSWORD DEL USUARIO, SE DEBE OFUSCAR
    usuapass     VARCHAR2(50 CHAR) NOT NULL, 
--  OBSERVACIONES DEL USUARIO, SI APLICA
    usuaobse     VARCHAR2(255 CHAR)
);

ALTER TABLE si_usuarios ADD CONSTRAINT si_usuarios_pk PRIMARY KEY ( usuaid );

CREATE TABLE ve_detaventa ( 
--  IDENTIFICADOR PRINCIPAL
    deveid       INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA IN_PRODUCTOS
    deveproducto INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA VE_VENTAS
    deveventas   INTEGER NOT NULL, 
--  CONSECUTIVO DEL DETALLE
    deveconse    INTEGER NOT NULL, 
--  ESTADO EL DETALLE DE LA VENTA, 'A'=ACTIVO, 'N'=ANULADO, 'I'=INACTIVO
    deveestado   VARCHAR2(1 CHAR) NOT NULL, 
--  VALOR UNITARIO DEL DETALLE VENTA
    devevalunit  INTEGER NOT NULL, 
--  CANTIDAD DE PRODUCTOS DEL DETALLE VENTA
    devecant     INTEGER NOT NULL, 
--  VALOR TOTAL DEL DETALLE VENTA
    devevaltotal INTEGER NOT NULL, 
--  OBSERVACIONES DEL DETALLE
    deveobser    VARCHAR2(255 CHAR)
);

ALTER TABLE ve_detaventa ADD CONSTRAINT ve_detaventa_pk PRIMARY KEY ( deveid );

CREATE TABLE ve_ventas ( 
--  IDENTIFICADOR DE LA VENTA
    ventid     INTEGER NOT NULL, 
--  RELACIÓN CON LA TABLA SI_SEDES
    ventsede   INTEGER NOT NULL, 
--  FECHA DE CREACIÓN DE LA VENTA
    ventfecr   DATE NOT NULL, 
--  USUARIO DE CREACIÓN DE LA VENTA, RELACIÓN CON LA TABLA SI_USUARIOS
    ventuscr1  VARCHAR2(50 CHAR) NOT NULL, 
--  ESTADO DE LA VENTA, 'A'=ACTIVO, 'N'=ANULADO, 'I'=INACTIVO
    ventestado CHAR(1 CHAR) NOT NULL, 
--  OBSERVACIONES DE LA VENTA
    ventobse   VARCHAR2(255 CHAR), 
--  VALOR TOTAL DE LA VENTA
    venttotal  INTEGER NOT NULL, 
--  CLIENTE DE LA VENTA, RELACIÓN CON LA TABLA SI_CLIENTES
    ventclient VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE ve_ventas ADD CONSTRAINT ve_ventas_pk PRIMARY KEY ( ventid );

ALTER TABLE in_productos
    ADD CONSTRAINT in_productos_si_proveedores_fk FOREIGN KEY ( prodprovee )
        REFERENCES si_proveedores ( provid );

ALTER TABLE in_productos
    ADD CONSTRAINT in_productos_si_sedes_fk FOREIGN KEY ( prodsede )
        REFERENCES si_sedes ( sedeid );

ALTER TABLE in_productos
    ADD CONSTRAINT in_productos_si_usuarios_fk FOREIGN KEY ( produscr )
        REFERENCES si_usuarios ( usuaid );

ALTER TABLE si_clieempr
    ADD CONSTRAINT si_clieempr_si_clientes_fk FOREIGN KEY ( clemclien )
        REFERENCES si_clientes ( clienteid );

ALTER TABLE si_clieempr
    ADD CONSTRAINT si_clieempr_si_empresas_fk FOREIGN KEY ( clemempr )
        REFERENCES si_empresas ( emprid );

ALTER TABLE si_proveempresa
    ADD CONSTRAINT si_proempresa_si_proveedor_fk FOREIGN KEY ( premprovee )
        REFERENCES si_proveedores ( provid );

ALTER TABLE si_proveempresa
    ADD CONSTRAINT si_proveempresa_si_empresas_fk FOREIGN KEY ( premempresa )
        REFERENCES si_empresas ( emprid );

ALTER TABLE si_sedes
    ADD CONSTRAINT si_sedes_si_ciudades_fk FOREIGN KEY ( sedeciudad )
        REFERENCES si_ciudades ( ciudid );

ALTER TABLE si_sedes
    ADD CONSTRAINT si_sedes_si_empresas_fk FOREIGN KEY ( sedeempresa )
        REFERENCES si_empresas ( emprid );

ALTER TABLE si_usuarios
    ADD CONSTRAINT si_usuarios_si_sedes_fk FOREIGN KEY ( usuasede )
        REFERENCES si_sedes ( sedeid );

ALTER TABLE ve_detaventa
    ADD CONSTRAINT ve_detaventa_in_productos_fk FOREIGN KEY ( deveproducto )
        REFERENCES in_productos ( prodid );

ALTER TABLE ve_detaventa
    ADD CONSTRAINT ve_detaventa_ve_ventas_fk FOREIGN KEY ( deveventas )
        REFERENCES ve_ventas ( ventid );

ALTER TABLE ve_ventas
    ADD CONSTRAINT ve_ventas_si_clientes_fk FOREIGN KEY ( ventclient )
        REFERENCES si_clientes ( clienteid );

ALTER TABLE ve_ventas
    ADD CONSTRAINT ve_ventas_si_sedes_fk FOREIGN KEY ( ventsede )
        REFERENCES si_sedes ( sedeid );

ALTER TABLE ve_ventas
    ADD CONSTRAINT ve_ventas_si_usuarios_fk FOREIGN KEY ( ventuscr1 )
        REFERENCES si_usuarios ( usuaid );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
