CREATE TABLE ferreteria.provedor(
nit_prov varchar(3),
	nom_prov varchar(50),
	num_tel_prov varchar(10),
	
	CONSTRAINT pk_nit_prov PRIMARY KEY(nit_prov),
    CONSTRAINT uc_num_tel_prov UNIQUE (num_tel_prov)
);

INSERT INTO ferreteria.provedor (nit_prov, nom_prov,num_tel_prov)
VALUES ('001','SEBASTIAN FERREIRA','2704427471'),
       ('002','JOSE RAMON CASTELLO','8007135123'),
	   ('003','CAROLINA BLANCO','8987635567'),
	   ('004','VICTOR JOSE IZQUIERDO','6169916194'),
	   ('005','MAITE GARRIDO','9123746145'),
	   ('006','MALIKA LLOREK','3366813540'),
	   ('007','ALEJANDRO GAGO','1962571091'),
	   ('008','LEOPOLDO ALBERT','1506110623'),
	   ('009','ANGELES VALDIVIA','9081435406'),
	   ('010','EMMA MATEO','3617890693'),
	   ('011','ALEXIA MORALES','2024429673'),
	   ('012','FERNANDO ARNAIZ','3398046629'),
	   ('013','MARTA ALAMO','4723782135'),
	   ('014','RAFAELA JARA','6958825208'),
	   ('015','REYES SALMERON','9764336370'),
	   ('016','DUMITRU ADAM','9488691217'),
	   ('017','DESIRE ROBLEDO','6609139098'),
	   ('018','YOEL FLORES','6210957967'),
	   ('019','NIL ROSALES','4514635452'),
	   ('020','NELSON RAMIREZ','1531710314'),
	   ('021','JORGE MAZA','9849927291'),
       ('022','ELADIO PAREJA','5587350080'),
	   ('023','SANTOS DOMECHECK','0083094794'),
	   ('024','IBRAHIM GUERRA','1750772183'),
	   ('025','CAMILA MELGAR','7411091258'),
	   ('026','ROBERTH PONS','3376363344'),
	   ('027','RICHARD NIEVES','2739481111'),
	   ('028','TEO CAMPOS','3557069993'),
	   ('029','ANA SACRISTAN','6238733605'),
	   ('030','CLOTILDE SEBASTIAN','0059240261'),
	   ('031','ICIAR VALLES','9359276612'),
	   ('032','JOAQUIN PLAZA','3415456447'),
	   ('033','LEANDRO BUSTOS','1478502554'),
	   ('034','ANGELA LLORET','9414205717'),
	   ('035','BALBINA CASTELL','7221294518'),
	   ('036','GUILLERMINA PEREA','8054831196'),
	   ('037','HORTENSIA ALCAZAR','8836624834'),
	   ('038','GRACIELA POLO','8445300496'),
	   ('039','DULCE OSORIO','5508961488'),
	   ('040','AXEL GASCON','7004799320'),
	   ('041','LOAN SALES','1169433260'),
	   ('042','PEDRO PABLO RECIO','2731052628'),
	   ('043','PASCUAL MERCHAN','2526942942'),
	   ('044','ANTON SAN JUAN','8603976795'),
	   ('045','LUIS ALFONSO TAMAYO','4613032564'),
	   ('046','ANTON MORO','6776303597'),
	   ('047','ALEXANDRE DOMINGUEZ','9914813101'),
	   ('048','JOSEPH LIYOS','4407094028'),
	   ('049','EZEQUIEL CORDON','9300720841'),
	   ('050','MARINO FRANCISCO','0964992185');
	   

SELECT * FROM ferreteria.provedor;

CREATE TABLE ferreteria.producto(
cod_prod varchar(4),
	prod_precio decimal,
	prod_descripcion varchar(50),
	prod_nom varchar(50),
	nit_prov varchar(3),
	prod_stock varchar(5),
	
	CONSTRAINT pk_cod_prod PRIMARY KEY (cod_prod),
	CONSTRAINT fk_nit_prov FOREIGN KEY (nit_prov)
	REFERENCES ferreteria.provedor (nit_prov)
);

INSERT INTO ferreteria.producto (cod_prod, prod_precio,prod_descripcion,prod_nom,nit_prov,prod_stock) 
VALUES ('0101','10.000','Caja de herramientas','Tuerca tipo C','001','69'), 
    ('0202','15.000','Caja de herramientas','Tuerca tipo G','001','72'), 
    ('0303','30.000','Caja de herramientas','Martillo','001','25'), 
    ('0404','12.000','Caja de herramientas','Destornillador','001','10'), 
    ('0505','25.000','Caja de herramientas','Alicate','001','22'), 
    ('0606','80.000','Caja de herramientas','Serrucho','001','07'), 
    ('0707','24.000','Caja de herramientas','Clavijas','001','50'), 
    ('0807','30.000','Caja de herramientas','Pinzas','001','45'), 
    ('0909','210.000','Instrumentos','Taladro','045','10'), 
    ('1010','400.000','Instrumentos','Cortadora de metal','045','11'), 
    ('1111','270.000','Instrumentos','Lijadora','045','09'), 
    ('1212','320.000','Instrumentos','Soplete','045','09'), 
    ('1313','310.000','Instrumentos','Cortadora de metal','045','11'), 
    ('1414','80.000','Proteccion','Guantes de seguridad','022','32'), 
    ('1515','75.000','Proteccion','Casco','022','50'), 
    ('1616','60.000','Proteccion','Gafas de proteccion','022','45'), 
    ('1717','121.000','Proteccion','Calzado de proteccion','022','42'), 
    ('1818','50.000','Electricos','Cable electrico','015','80'), 
    ('1919','67.000','Electricos','Enchujes rapidos','015','63'), 
    ('2020','110.000','Electricos','Corta cables','015','34');

SELECT * FROM ferreteria.producto;

SELECT prod.cod_prod, prod.prod_precio, prod.prod_descripcion, prod.prod_nom, prov.nom_prov, prod.prod_stock
FROM ferreteria.producto prod 
INNER JOIN ferreteria.provedor prov
ON prod.nit_prov = prov.nit_prov;

CREATE TABLE ferreteria.metodo_pago(
cod_mepa varchar (3),
	mepa_descripcion varchar(100),
	
	CONSTRAINT pk_cod_mepa PRIMARY KEY (cod_mepa)
);



INSERT INTO ferreteria.metodo_pago (cod_mepa, mepa_descripcion)
VALUES ('111','Efectivo'),
       ('112','Transferencia Bancaria'),
	   ('113','Tarjeta de crédito o débito');
	   
SELECT * FROM ferreteria.metodo_pago;

CREATE TABLE ferreteria.factura(
cod_fact varchar(7),
	fact_fecha timestamp,
	fact_total decimal,
	doc_client varchar(10),
	cod_mepa varchar (3),
	cod_vendedor varchar(4),
	
	CONSTRAINT pk_cod_fact PRIMARY KEY (cod_fact),
	CONSTRAINT fk_doc_client FOREIGN KEY (doc_client)
	REFERENCES ferreteria.cliente (doc_client),
	CONSTRAINT fk_cod_mepa FOREIGN KEY (cod_mepa)
	REFERENCES ferreteria.metodo_pago (cod_mepa),
	CONSTRAINT fk_cod_vendedor FOREIGN KEY (cod_vendedor)
	REFERENCES ferreteria.vendedor (cod_vendedor)
);

INSERT INTO ferreteria.factura (cod_fact,fact_fecha,fact_total,doc_client,cod_mepa,cod_vendedor)
VALUES ('0000001','20/01/2022 10:10:50','50.000','668115953','111','1918'),
       ('0000002','09/02/2022 11:30:00','847.000','995315614','112','1927'),
	   ('0000003','10/02/2022 12:55:07','30.000','758498597','113','1927'),
	   ('0000004','07/03/2022 14:30:20','201.000','582612788','111','1927'),
	   ('0000005','11/03/2022 13:50:20','201.000','561376461','112','1918'),
	   ('0000006','09/04/2022 14:40:00','600.000','842469772','113','1923'),
	   ('0000007','09/02/2022 10:30:00','847.000','758498597','113','1919'),
	   ('0000008','09/02/2022 08:40:50','201.000','323687819','111','1923'),
	   ('0000009','09/02/2022 07:30:02','847.000','836378429','113','1921'),
	   ('0000010','09/02/2022 08:30:20','201.000','241796936','112','1923'),
	   ('0000011','09/02/2022 12:50:10','201.000','247639177','111','1919'),
	   ('0000012','09/02/2022 15:30:00','600.000','589452573','112','1927'),
	   ('0000013','09/02/2022 16:20:40','250.000','836378429','113','1928'),
	   ('0000014','09/02/2022 16:30:01','201.000','842469772','112','1921'),
	   ('0000015','09/02/2022 18:30:02','600.000','199452142','113','1928'),
	   ('0000016','09/02/2022 17:20:30','110.000','673146788','112','1927'),
	   ('0000017','09/02/2022 14:10:10','30.000','363416383','111','1928'),
	   ('0000018','09/02/2022 11:50:07','600.000','275283615','113','1921'),
	   ('0000019','09/02/2022 13:40:50','847.000','995315614','112','1919'),
	   ('0000020','09/02/2022 15:15:40','110.000','582612788','112','1921');



SELECT * FROM ferreteria.factura;

SELECT f.cod_fact, to_char(f.fact_fecha, 'DD/MM/YYYY') AS fecha, c.doc_client, c.nom_client, m.mepa_descripcion, f.fact_total, v.nom_vendedor
            FROM ferreteria.factura f INNER JOIN ferreteria.cliente c
            ON f.doc_client = c.doc_client
            INNER JOIN ferreteria.metodo_pago m
            ON f.cod_mepa = m.cod_mepa
            INNER JOIN ferreteria.vendedor v
            ON f.cod_vendedor = v.cod_vendedor;

CREATE TABLE ferreteria.detalle(
det_cant_prod varchar (3),
	det_precio_prod decimal,
	det_subtotal decimal,
	cod_prod varchar(4),
	cod_fact varchar(7),
	
	CONSTRAINT fk_cod_prod FOREIGN KEY (cod_prod)
	REFERENCES  ferreteria.producto(cod_prod),
	CONSTRAINT fk_cod_fact FOREIGN KEY (cod_fact)
	REFERENCES ferreteria.factura(cod_fact),
	CONSTRAINT pk_detalle PRIMARY KEY (cod_prod, cod_fact)
);

INSERT INTO ferreteria.detalle (det_cant_prod,det_precio_prod,det_subtotal,cod_prod,cod_fact) 
VALUES ('05','10.000','50.000','0101','0000001'), 
       ('02','15.000','30.000','0202','0000017'), 
    ('10','60.000','600.000','1616','0000018'), 
    ('07','121.000','847.000','1717','0000002'), 
    ('05','50.000','250.000','1818','0000014'), 
    ('03','67.000','201.000','1919','0000005'), 
    ('01','110.000','110.000','2020','0000016'), 
    ('02','15.000','30.000','0202','0000003'), 
    ('10','60.000','600.000','1616','0000015'), 
    ('07','121.000','847.000','1717','0000009'), 
    ('05','50.000','250.000','1818','0000013'), 
    ('03','67.000','201.000','1919','0000004'), 
    ('03','67.000','201.000','1919','0000011'), 
    ('03','67.000','201.000','1919','0000008'), 
    ('03','67.000','201.000','1919','0000010'), 
    ('10','60.000','600.000','1616','0000006'), 
    ('07','121.000','847.000','1717','0000019'), 
    ('10','60.000','600.000','1616','0000012'), 
    ('07','121.000','847.000','1717','0000007'), 
    ('01','110.000','110.000','2020','0000020');


SELECT * FROM ferreteria.detalle;

CREATE TABLE ferreteria.cliente(
doc_client varchar(10),
	dir_client varchar (50),
	num_tel_client varchar(12),
	nom_client varchar (50),
	cod_ciudad varchar(5),
	cod_dpto varchar(3),
	cod_pais varchar(3),
	
	CONSTRAINT uc_doc_client UNIQUE (doc_client),
	CONSTRAINT pk_doc_client PRIMARY KEY(doc_client),
	CONSTRAINT fk_cod_ciudad_client FOREIGN KEY (cod_ciudad, cod_dpto, cod_pais)
	REFERENCES ferreteria.ciudad (cod_ciudad, cod_dpto, cod_pais)
	
);

INSERT INTO ferreteria.cliente (doc_client,dir_client,num_tel_client,nom_client,cod_ciudad,cod_dpto,cod_pais) 
VALUES ('363416383','Calle 10 No. 9-78','7975494211','ALDEMAR CADAVID','54344','54','170'), 
    ('926768926','Carrera 56A No. 51-81','4732194854','GUSTAVO ALBERTO GÓMEZ','54498','54','170'), 
    ('668115953','Carrera 22 No. 17-31','8835429447','MARIO ALEXANDER PEREZ','54498','54','170'), 
    ('275283615','Carrera 54 No. 68-80','1118167769','CARLOS ALBERTO CASTELLANOS','54498','54','170'), 
    ('199452142','Calle 59 No. 27-35','2856433871','OSVALDO DE JESUS ALTAMAR','54344','54','170'), 
    ('673146788','Carrera 10A No. 20-40','1148871753','MARTHA MARINA SOLANO','54344','54','170'), 
    ('698541333','Carrera 8  No. 20-59','8187322423','LYDA CONSUELO ZUÑIGA','54670','54','170'), 
    ('995315614','Calle 20 No. 22-27','2318435893','FERNANDO EUGENIO OSORIO','54670','54','170'), 
    ('842469772','Carrera 8a No. 7-88','5947189746','JOSE EDGAR CASTELBLANCO','54398','54','170'), 
    ('758498597','Carrera  5 No. 3-74','9867189651','OSCAR HERNANDO TORRES','54344','54','170'), 
    ('753752984','Calle 15 No. 9-56','9983395843','JULIO MIGUEL DE LA HOZ','54498','54','170'), 
    ('582612788','Calle 25 No. 4-38','2526833261','LUZ MARINA AGUALIMPIA','54498','54','170'), 
    ('323687819','Calle 28 No. 8-69','9326537734','VICTOR GONZALEZ','54498','54','170'), 
    ('874217275','Carrera 7A No. 32-63','5129325293','PABLO EDGAR PINTO','54670','54','170'), 
    ('561376461','Calle 7 No. 5-25','6488251553','OSIRIS DENARES DANIES','54398','54','170'), 
    ('836378429','Carrera 9  No. 7-34','8893659363','ALBEY  CALDERON','54398','54','170'), 
    ('721383811','Calle 20 No. 3-22','1537881452','DANCY DE JESUS PALACIO','54670','54','170'), 
    ('241796936','Calle 33B  No. 38-42','3623379271','DALIA MARÍA AVILA','54344','54','170'), 
    ('247639177','Calle 16 No. 23-57','1148787732','LEONARDO FRANCISCO ZARAMA','54344','54','170'), 
    ('589452573','Calle 12 No. 4-19','8841185317','SOLANGE SUESCUN LEAL','54344','54','170');

SELECT * FROM ferreteria.cliente;

SELECT c.doc_client, c.dir_client, c.num_tel_client, c.nom_client, p.nom_pais, d.nom_dpto, ci.nom_ciudad FROM ferreteria.cliente c INNER JOIN ferreteria.pais p
ON c.cod_pais = p.cod_pais
INNER JOIN ferreteria.departamento d
ON c.cod_dpto = d.cod_dpto
INNER JOIN ferreteria.ciudad ci
ON c.cod_ciudad = ci.cod_ciudad;

CREATE TABLE ferreteria.vendedor(
cod_vendedor varchar(4),
	doc_vendedor varchar(10),
	nom_vendedor varchar (50),
	num_tel_vendedor varchar (12),
	cod_ciudad varchar(5),
	cod_dpto varchar(3),
	cod_pais varchar(3),
	
	CONSTRAINT uc_doc_vendedor UNIQUE (doc_vendedor),
	CONSTRAINT pk_cod_vendedor PRIMARY KEY(cod_vendedor),
	CONSTRAINT fk_cod_ciudad FOREIGN KEY (cod_ciudad, cod_dpto, cod_pais)
	REFERENCES ferreteria.ciudad (cod_ciudad, cod_dpto, cod_pais)
);

INSERT INTO ferreteria.vendedor (cod_vendedor, doc_vendedor,nom_vendedor,num_tel_vendedor,cod_ciudad,cod_dpto,cod_pais)
VALUES ('1918','1002632848','Roberta Cepeda Alemany','0075140291','54498','54','170'),
       ('1919','1004798557','Eustaquio Jacobo López Feijoo','5473444840','54498','54','170'),
	   ('1921','1007234015','Consuela Nicolau-Prada','7242122212','54498','54','170'),
	   ('1922','1007234435','Yésica de Lamas','8842972137','54498','54','170'),
	   ('1923','1007737711','Gonzalo Borrell-Company','0004589526','54498','54','170'),
	   ('1924','1028031467','Hortensia Terue','7890121450','54498','54','170'),
	   ('1925','1053775075','Melisa Cabañas Buendía','9236449290','54498','54','170'),
	   ('1926','1053776140','María Ángeles Arana Dalmau','0488431018','54498','54','170'),
	   ('1927','1053819307','Donato Tapia Navarro','1913058188','54498','54','170'),
	   ('1928','1053856307','Jenaro Nico Martin Serra','1495415535','54498','54','170');
       

SELECT * FROM ferreteria.vendedor;

	CREATE TABLE ferreteria.ciudad(
	cod_ciudad varchar(5),
	cod_dpto varchar(3),
	cod_pais varchar(3),
	nom_ciudad varchar (20),
		
	CONSTRAINT fk_cod_dpto FOREIGN KEY (cod_dpto, cod_pais)
	REFERENCES ferreteria.departamento (cod_dpto, cod_pais),
	CONSTRAINT pk_cod_ciudad PRIMARY KEY (cod_ciudad, cod_dpto, cod_pais)
	);
	
	INSERT INTO ferreteria.ciudad (cod_ciudad,cod_dpto,cod_pais,nom_ciudad)
    VALUES ('54001','54','170','CUCUTA'),
	       ('54003','54','170','ABREGO'),
		   ('54051','54','170','ARBOLEDAS'),
		   ('54099','54','170','BOCHALEMA'),
		   ('54109','54','170','BUCARASICA'),
		   ('54125','54','170','CACOTA'),
		   ('54128','54','170','CACHIRA'),
		   ('54172','54','170','CHINACOTA'),
		   ('54174','54','170','CHITAGA'),
		   ('54206','54','170','CONVENCION'),
		   ('54223','54','170','CUCUTILLA'),
		   ('54239','54','170','DURANIA'),
		   ('54245','54','170','EL CARMEN'),
		   ('54250','54','170','EL TARRA'),
		   ('54261','54','170','EL ZULIA'),
		   ('54313','54','170','GRAMALOTE'),
		   ('54344','54','170','HACARI'),
		   ('54347','54','170','HERRAN'),
		   ('54377','54','170','LABATECA'),
		   ('54385','54','170','LA ESPERANZA'),
		   ('54398','54','170','LA PLAYA'),
		   ('54405','54','170','LOS PATIOS'),
		   ('54418','54','170','LOURDES'),
		   ('54480','54','170','MUTISCUA'),
		   ('54498','54','170','OCAÑA'),
		   ('54518','54','170','PAMPLONA'),
		   ('54520','54','170','PAMPLONITA'),
		   ('54553','54','170','PUERTO SANTANDER'),
		   ('54599','54','170','RAGONVALIA'),
		   ('54660','54','170','SALAZAR'),
		   ('54670','54','170','SAN CALIXTO'),
		   ('54673','54','170','SAN CAYETANO'),
		   ('54680','54','170','SANTIAGO'),
		   ('54720','54','170','SARDINATA'),
		   ('54743','54','170','SILOS'),
		   ('54800','54','170','TEORAMA'),
		   ('54810','54','170','TIBU'),
		   ('54820','54','170','TOLEDO'),
		   ('54871','54','170','VILLA CARO'),
		   ('54874','54','170','VILLA DEL ROSARIO');
	       
	SELECT * FROM ferreteria.ciudad
	
	CREATE TABLE ferreteria.departamento(
	cod_dpto varchar(3),
	cod_pais varchar(3),
	nom_dpto varchar (20),
			
	CONSTRAINT fk_cod_pais FOREIGN KEY (cod_pais)
	REFERENCES ferreteria.pais (cod_pais),
	CONSTRAINT pk_cod_dpto PRIMARY KEY (cod_dpto, cod_pais)
	);
	
	INSERT INTO ferreteria.departamento (cod_dpto,cod_pais,nom_dpto)
    VALUES ('54','170','NORTE DE SANTANDER');
	
	SELECT * FROM ferreteria.departamento;
	
	CREATE TABLE ferreteria.pais(
	cod_pais varchar(3),
	nom_pais varchar (20),
		
		CONSTRAINT pk_cod_pais PRIMARY KEY (cod_pais)
	);
	
	INSERT INTO ferreteria.pais (cod_pais,nom_pais)
    VALUES ('170','COLOMBIA');
	
	SELECT * FROM ferreteria.pais;
	
DROP TABLE IF EXISTS ferreteria.login;

CREATE TABLE ferreteria.login (
cod_login SERIAL,
usuario varchar(250),
password varchar(250),
fecha TIMESTAMP,
CONSTRAINT uc_usuario UNIQUE (usuario),
CONSTRAINT nn_password CHECK (password IS NOT NULL),
CONSTRAINT pk_cod_login PRIMARY KEY (cod_login)
);

INSERT INTO ferreteria.login (usuario, password, fecha)
VALUES ('cltorradog@ufpso.edu.co', 'adidas140', now());

SELECT * FROM ferreteria.login;

SELECT cod_login FROM ferreteria.login
	WHERE usuario = 'cltorradog@ufpso.edu.co'
	AND password = 'adidas140';

-- DROP TABLE IF EXISTS ferreteria.rol;

-- CREATE TABLE ferreteria.rol(
-- 	cod_rol	varchar(3),
-- 	rol_descripcion varchar(100),
-- 	cod_vendedor varchar(3),
	
-- 	CONSTRAINT pk_cod_rol PRIMARY KEY (cod_rol),
-- 	CONSTRAINT fk_cod_vendedor FOREIGN KEY (cod_vendedor)
--     REFERENCES ferreteria.vendedor (cod_vendedor)
-- );

-- INSERT INTO ferreteria.rol ()

SELECT * FROM ferreteria.login;

-- TABLA AUDITORIA PARA LA TABLA FACTURA --

CREATE TABLE ferreteria.audi_factura (
	consecutivo serial,
	cod_fact varchar(3),
	fact_fecha timestamp,
	fact_total decimal,
	doc_client varchar(10),
	cod_mepa varchar (3),
	cod_vendedor varchar(3),

	CONSTRAINT fk_doc_client FOREIGN KEY (doc_client)
	REFERENCES ferreteria.cliente,
	CONSTRAINT fk_cod_mepa FOREIGN KEY (cod_mepa)
	REFERENCES ferreteria.metodo_pago,
	CONSTRAINT fk_cod_vendedor FOREIGN KEY (cod_vendedor)
	REFERENCES ferreteria.vendedor,
    CONSTRAINT pk_audi_equipo PRIMARY KEY (consecutivo)
);

CREATE FUNCTION ferreteria.audi_factura_func() RETURNS TRIGGER AS $trg_grabar_audi_factura$
DECLARE
BEGIN 
IF(TG_OP = 'UPDATE') THEN
INSERT INTO ferreteria.audi_factura  (consecutivo, cod_fact, fact_fecha, fact_total, doc_client, cod_mepa, cod_vendedor)
VALUES (DEFAULT,OLD.cod_fact,OLD.doc_client,CURRENT_TIMESTAMP(0),CURRENT_USER,'0');
RETURN NEW;

ELSIF(TG_OP = 'DELETE') THEN
INSERT INTO ferreteria.audi_factura (consecutivo, cod_fact, fact_fecha, fact_total, doc_client, cod_mepa, cod_vendedor)
VALUES (DEFAULT,OLD.cod_fact,OLD.doc_client,CURRENT_TIMESTAMP(0),CURRENT_USER,'0');
RETURN OLD;

END IF;

END;
$trg_grabar_audi_factura$ LANGUAGE plpgsql;

CREATE TRIGGER trg_grabar_audi_factura BEFORE UPDATE OR DELETE ON ferreteria.factura
FOR EACH ROW EXECUTE PROCEDURE ferreteria.audi_factura_func();