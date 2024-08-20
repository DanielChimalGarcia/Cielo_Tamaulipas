/*
Navicat MySQL Data Transfer

Source Server         : BD
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : el_cielo

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2024-01-18 14:24:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cabaña
-- ----------------------------
DROP TABLE IF EXISTS `cabaña`;
CREATE TABLE `cabaña` (
  `Clave_Cabaña` int NOT NULL AUTO_INCREMENT,
  `Numero_Socio` int NOT NULL,
  `Nombre_Cabaña` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Descripcion_Cabaña` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Precio_Cabaña` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Capacidad` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Ubicacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Maps` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  PRIMARY KEY (`Clave_Cabaña`) USING BTREE,
  KEY `Numero_Socio` (`Numero_Socio`) USING BTREE,
  CONSTRAINT `Numero_Socio` FOREIGN KEY (`Numero_Socio`) REFERENCES `dueños` (`Numero_Socio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cabaña
-- ----------------------------

-- ----------------------------
-- Table structure for caracteristicas
-- ----------------------------
DROP TABLE IF EXISTS `caracteristicas`;
CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL,
  `Descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of caracteristicas
-- ----------------------------

-- ----------------------------
-- Table structure for caracteristica_cabana
-- ----------------------------
DROP TABLE IF EXISTS `caracteristica_cabana`;
CREATE TABLE `caracteristica_cabana` (
  `clave_caracteristica_cabana` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Clave_Cabaña` int DEFAULT NULL,
  `id_caracteristica` int DEFAULT NULL,
  PRIMARY KEY (`clave_caracteristica_cabana`) USING BTREE,
  KEY `Clave_Cabaña` (`Clave_Cabaña`) USING BTREE,
  KEY `id_caracteristica` (`id_caracteristica`) USING BTREE,
  CONSTRAINT `caracteristica_cabana_ibfk_1` FOREIGN KEY (`Clave_Cabaña`) REFERENCES `cabaña` (`Clave_Cabaña`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `caracteristica_cabana_ibfk_2` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id_caracteristica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of caracteristica_cabana
-- ----------------------------

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `Folio_Cliente` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Apellido_1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Apellido_2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Telefono` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CURP` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `RFC` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Folio_Cliente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cliente
-- ----------------------------

-- ----------------------------
-- Table structure for concepto
-- ----------------------------
DROP TABLE IF EXISTS `concepto`;
CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL,
  `Descripcion_Concepto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_concepto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of concepto
-- ----------------------------

-- ----------------------------
-- Table structure for dueños
-- ----------------------------
DROP TABLE IF EXISTS `dueños`;
CREATE TABLE `dueños` (
  `Numero_Socio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Apellido1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Apellido2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pasword_dueno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Numero_Socio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dueños
-- ----------------------------

-- ----------------------------
-- Table structure for fotos
-- ----------------------------
DROP TABLE IF EXISTS `fotos`;
CREATE TABLE `fotos` (
  `Numero_Foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Clave_Cabaña` int DEFAULT NULL,
  `url_foto` longblob,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Numero_Foto`) USING BTREE,
  KEY `Clave_Cabaña3` (`Clave_Cabaña`) USING BTREE,
  CONSTRAINT `Clave_Cabaña3` FOREIGN KEY (`Clave_Cabaña`) REFERENCES `cabaña` (`Clave_Cabaña`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fotos
-- ----------------------------

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `Folio_Pago` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Folio_Reservacion` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_caracteristica` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `Monto` float(255,0) DEFAULT NULL,
  `Feacha_Monto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Evidencia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Folio_Pago`) USING BTREE,
  KEY `Folio_Reservacion2` (`Folio_Reservacion`) USING BTREE,
  KEY `id_concepto1` (`id_concepto`) USING BTREE,
  KEY `id_caracteristica1` (`id_caracteristica`) USING BTREE,
  CONSTRAINT `id_caracteristica1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id_caracteristica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_concepto1` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`Folio_Reservacion`) REFERENCES `reservacion` (`Folio_Reservacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pagos
-- ----------------------------

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Ape1` varchar(255) DEFAULT NULL,
  `Ape2` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `CURP` varchar(255) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `USUARIO_PERSONA` (`id_usuario`),
  CONSTRAINT `USUARIO_PERSONA` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1', 'ISMAEL', 'ALCANTARA', 'BUENO', '5578394028', 'CURP', '5');
INSERT INTO `persona` VALUES ('4', 'Mariana', 'Marcelino', 'Bautista', '5539492048', 'CUPRMARY', '8');
INSERT INTO `persona` VALUES ('8', 'Isabel', 'Bautista', 'Cruz', '3456789876', 'MABR010404MMCRTSA6', '12');

-- ----------------------------
-- Table structure for reservacion
-- ----------------------------
DROP TABLE IF EXISTS `reservacion`;
CREATE TABLE `reservacion` (
  `Folio_Reservacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Folio_Cliente` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Clave_Cabaña` int DEFAULT NULL,
  `Fecha_Entrada` datetime DEFAULT NULL,
  `Fecha_Salida` datetime DEFAULT NULL,
  `Precio_Reservacion` float(255,0) DEFAULT NULL,
  `Status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`Folio_Reservacion`) USING BTREE,
  KEY `Clave_Cabaña1` (`Clave_Cabaña`) USING BTREE,
  KEY `Folio_Cliente` (`Folio_Cliente`) USING BTREE,
  CONSTRAINT `Clave_Cabaña1` FOREIGN KEY (`Clave_Cabaña`) REFERENCES `cabaña` (`Clave_Cabaña`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`Folio_Cliente`) REFERENCES `cliente` (`Folio_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reservacion
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Dueño', '1');
INSERT INTO `rol` VALUES ('2', 'Cliente', '1');

-- ----------------------------
-- Table structure for servicios
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id_servicios` int NOT NULL AUTO_INCREMENT,
  `Clave_Cabaña` int DEFAULT NULL,
  `id_caracteristica` int DEFAULT NULL,
  `Valor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_servicios`) USING BTREE,
  KEY `Clave_Cabaña` (`Clave_Cabaña`) USING BTREE,
  KEY `id_caracteristica` (`id_caracteristica`) USING BTREE,
  CONSTRAINT `Clave_Cabaña` FOREIGN KEY (`Clave_Cabaña`) REFERENCES `cabaña` (`Clave_Cabaña`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_caracteristica` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id_caracteristica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of servicios
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) DEFAULT NULL,
  `contrasenia` varchar(255) DEFAULT NULL,
  `token` varchar(16) DEFAULT NULL,
  `vigencia` datetime DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `ROL_USUARIO` (`id_rol`),
  CONSTRAINT `ROL_USUARIO` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'roselin@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', null, null, '1', '');
INSERT INTO `usuario` VALUES ('5', 'ismael@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', null, null, '2', '');
INSERT INTO `usuario` VALUES ('8', 'mari@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', null, null, '2', '');
INSERT INTO `usuario` VALUES ('12', 'isa@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', null, null, '1', '');

-- ----------------------------
-- Procedure structure for actualizar_cabana
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_cabana`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cabana`(IN P_Clave_Cabaña int (50),
IN P_Numero_Socio INT(15),
IN P_Nombre_Cabaña VARCHAR(255),
IN P_Descripcion_Cabaña LONGTEXT,
IN P_Precio_Cabaña VARCHAR(100),
IN P_Capacidad VARCHAR(50),
IN P_Ubicacion VARCHAR(255),
IN P_Maps VARCHAR(255))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT * FROM cabaña WHERE Clave_Cabaña = P_Clave_Cabaña) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE cabaña
        SET
            Numero_Socio = P_Numero_Socio,
						Nombre_Cabaña = P_Nombre_Cabaña,
						Descripcion_Cabaña = P_Descripcion_Cabaña,
						Precio_Cabaña = P_Precio_Cabaña,
						Capacidad = P_Capacidad,
						Ubicacion = P_Ubicacion,
						Maps = P_Maps
        WHERE Clave_Cabaña = P_Clave_Cabaña;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'La cabaña' + CAST(P_Nombre_Cabaña AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_caracteristica
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_caracteristica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_caracteristica`(IN P_id_caracteristica INT(15),
IN P_Descripcion VARCHAR(255))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT * FROM caracteristica WHERE id_caracteristica = P_id_caracteristica) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE caracteristica
        SET
            id_caracteristica = P_id_caracteristica,
					  Descripcion = P_Descripcion
        WHERE id_caracteristica = P_id_caracteristica;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'La caracteristica' + CAST(P_caracteristica AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_caracteristicas
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_caracteristicas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_caracteristicas`(IN P_id_caracteristica INT(15),
IN P_Descripcion VARCHAR(255))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT * FROM caracteristicas WHERE id_caracteristica = P_id_caracteristica) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE caracteristicas
        SET
            id_caracteristica = P_id_caracteristica,
					  Descripcion = P_Descripcion
        WHERE id_caracteristica = P_id_caracteristica;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'La caracteristica' + CAST(P_id_caracteristica AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_cliente
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_cliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cliente`(IN P_Folio_Cliente INT (50),
IN P_Nombre VARCHAR(255),
IN P_Apellido_1 VARCHAR(50),
IN P_Apellido_2 VARCHAR(50),
IN P_Telefono CHAR (20),
IN P_Direccion VARCHAR(255),
IN P_CURP VARCHAR(255),
IN P_RFC VARCHAR(255),
IN P_Email VARCHAR(50))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT * FROM cliente WHERE Folio_Cliente = P_Folio_Cliente) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE cliente
        SET
            Nombre = P_Nombre,
					  Apellido_1 = P_Apellido_1,
						Apellido_2 = P_Apellido_2,
						Telefono = P_Telefono,
						Direccion = P_Direccion,
						CURP = P_CURP,
						RFC = P_RFC,
						Email = P_Email
        WHERE CURP = P_CURP;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'El cliente' + CAST(P_Nombre AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_concepto
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_concepto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_concepto`(IN P_id_concepto INT(15),
IN P_Descripcion_Concepto VARCHAR(255))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT * FROM concepto WHERE id_concepto = P_id_concepto) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE concepto
        SET
            id_concepto = P_id_concepto,
					  Descripcion_Concepto = P_Descripcion_Concepto
        WHERE id_concepto = P_id_concepto;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'El concepto' + CAST(P_id_concepto AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_dueños
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_dueños`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_dueños`(IN P_Numero_Socio INT(50),
IN P_Nombre VARCHAR(255),
IN P_Apellido1 VARCHAR(50),
IN P_Apellido2 VARCHAR(50))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT Numero_Socio FROM dueños WHERE Numero_Socio = P_Numero_Socio) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE dueños
        SET
            Nombre = P_Nombre,
					  Apellido1 = P_Apellido1,
						Apellido2 = P_Apellido2
        WHERE Numero_Socio = P_Numero_Socio;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'El Dueño' + CAST(P_Nombre AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_fotos
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_fotos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_fotos`(IN P_Numero_Foto INT(11),
IN P_Clave_Cabaña VARCHAR(15))
BEGIN
    -- Verifica si la cabaña con el ID proporcionado existe
    IF EXISTS (SELECT Numero_Foto FROM fotos WHERE Numero_Foto = P_Numero_Foto) THEN
        -- Realiza la actualización de la información de la cabaña
        UPDATE fotos
        SET
            Numero_Foto = P_Numero_Foto,
					  Clave_Cabaña = P_Clave_Cabaña
        WHERE Numero_Foto = P_Numero_Foto;
        SELECT 'Actualización exitosa' AS mensaje;
    ELSE
        SELECT 'La foto' + CAST(P_Numero_Foto AS CHAR) + ' no existe.' AS mensaje;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for actualizar_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `actualizar_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_servicio`(p_idserv INT,
p_valor VARCHAR (255),
p_obvs VARCHAR (255))
BEGIN
IF EXISTS (SELECT id_servicios FROM servicios WHERE id_servicios = p_idserv) THEN
UPDATE servicios SET
Valor = p_valor,
Observaciones = p_obvs
WHERE id_servicios = p_idserv;

SELECT '250' AS result;
ELSE
SELECT '404' AS result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for act_reservacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `act_reservacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `act_reservacion`(p_folR VARCHAR (15),
p_status CHAR(1))
BEGIN
IF EXISTS (SELECT Folio_Reservacion FROM reservacion WHERE Folio_Reservacion = p_folR) THEN
UPDATE reservacion SET
`Status` = p_status
WHERE Folio_Reservacion = p_folR;

SELECT '250' AS result;
ELSE
SELECT '404' AS result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addcaracteristica
-- ----------------------------
DROP PROCEDURE IF EXISTS `addcaracteristica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addcaracteristica`(folio VARCHAR (255),
clve_caban INT,
id_crt INT)
BEGIN
IF EXISTS (SELECT * FROM caracteristica_cabana WHERE `Clave_Cabaña` = clve_caban AND id_caracteristica = id_crt) THEN
SELECT '409' as result;
ELSE

	INSERT INTO caracteristica_cabana (clave_caracteristica_cabana, `Clave_Cabaña`, id_caracteristica) VALUES (folio, clve_caban, id_crt);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for AuthDueno
-- ----------------------------
DROP PROCEDURE IF EXISTS `AuthDueno`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AuthDueno`(p_email VARCHAR (255))
BEGIN
IF EXISTS (SELECT Numero_Socio FROM `dueños` WHERE email = p_email) THEN
	SELECT Numero_Socio, pasword_dueno FROM `dueños`  WHERE email = p_email;
ELSE
	SELECT '0' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for buscar
-- ----------------------------
DROP PROCEDURE IF EXISTS `buscar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar`(IN palabra_clave VARCHAR(255))
BEGIN
SELECT * FROM cabaña WHERE Nombre_Cabaña LIKE CONCAT('%', palabra_clave, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for cabanaPreveiw
-- ----------------------------
DROP PROCEDURE IF EXISTS `cabanaPreveiw`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cabanaPreveiw`(p_clavecabana INT)
BEGIN
SELECT
	`cabaña`.`Nombre_Cabaña`, 
	`cabaña`.`Descripcion_Cabaña`, 
	`cabaña`.`Precio_Cabaña`, 
	`cabaña`.Capacidad, 
	`cabaña`.Ubicacion,	
	`cabaña`.`Status`, 
	`dueños`.Nombre, 
	`dueños`.Apellido1, 
	`dueños`.Apellido2, 
	`dueños`.email
FROM
	`cabaña`
	INNER JOIN
	`dueños`
	ON 
		`cabaña`.Numero_Socio = `dueños`.Numero_Socio
WHERE
	`cabaña`.`Clave_Cabaña` = p_clavecabana;
	
	SELECT Fecha_Entrada, Fecha_Salida FROM reservacion WHERE Clave_Cabaña = p_clavecabana AND `Status` = 'A';
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for cancelar_reservacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `cancelar_reservacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelar_reservacion`(f_reserv VARCHAR (100))
BEGIN
UPDATE reservacion SET `Status`= 'C' WHERE Folio_Reservacion = f_reserv;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for compCurp
-- ----------------------------
DROP PROCEDURE IF EXISTS `compCurp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compCurp`(p_curp VARCHAR (255))
BEGIN
IF EXISTS (SELECT CURP FROM cliente WHERE CURP = UPPER(p_curp))THEN
	SELECT '409' as result;

ELSE
	SELECT '404' as result;

END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for dataUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `dataUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dataUser`(p_numSocio VARCHAR (255))
BEGIN
IF EXISTS (SELECT Numero_Socio FROM `dueños` WHERE Numero_Socio = p_numSocio )THEN
	SELECT Nombre, Apellido1, Apellido2, email FROM `dueños` WHERE Numero_Socio = p_numSocio;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for delete_caract
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_caract`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_caract`(folio VARCHAR (255))
BEGIN
DELETE FROM caracteristica_cabana WHERE clave_caracteristica_cabana = folio;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_cabaña
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_cabaña`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cabaña`(IN P_Nombre_Cabaña VARCHAR(255))
BEGIN
IF EXISTS (SELECT Nombre_Cabaña FROM `cabaña` WHERE Nombre_Cabaña = P_Nombre_Cabaña) THEN
DELETE FROM `cabaña` WHERE Nombre_Cabaña = P_Nombre_Cabaña;
SELECT '201' as result;
ELSE
SELECT '409' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_caracteristicas
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_caracteristicas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_caracteristicas`(IN P_id_caracteristica INT(15))
BEGIN
IF EXISTS (SELECT id_caracteristica FROM caracteristicas WHERE id_caracteristica = P_id_caracteristica) THEN
DELETE FROM caracteristicas WHERE id_caracteristica = P_id_caracteristica;
SELECT '201', 'Operacion Exitosa' as result;
ELSE
SELECT '409', 'Fallo al eliminar' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_cliente
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_cliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cliente`(IN P_Folio_Cliente INT(50))
BEGIN
IF EXISTS (SELECT Folio_Cliente FROM cliente WHERE Folio_Cliente = P_Folio_Cliente) THEN
DELETE FROM cliente WHERE Folio_Cliente = P_Folio_Cliente;
SELECT '201', 'Operacion Exitosa' as result;
ELSE
SELECT '409', 'Fallo al eliminar' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_concepto
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_concepto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_concepto`(IN P_id_concepto INT(15))
BEGIN
IF EXISTS (SELECT id_concepto FROM concepto WHERE id_concepto = P_id_concepto) THEN
DELETE FROM concepto WHERE id_concepto = P_id_concepto;
SELECT '201', 'Operacion Exitosa' as result;
ELSE
SELECT '409', 'Fallo al eliminar' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_dueños
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_dueños`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_dueños`(IN P_Numero_Socio INT(50))
BEGIN
IF EXISTS (SELECT Numero_Socio FROM dueños WHERE Numero_Socio = P_Numero_Socio) THEN
DELETE FROM dueños WHERE Numero_Socio = P_Numero_Socio;
SELECT '201', 'Operacion Exitosa' as result;
ELSE
SELECT '409', 'Fallo al eliminar' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for eliminar_foto
-- ----------------------------
DROP PROCEDURE IF EXISTS `eliminar_foto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_foto`(IN P_Numero_Foto INT(11))
BEGIN
IF EXISTS (SELECT Numero_Foto FROM fotos WHERE Numero_Foto = P_Numero_Foto) THEN
DELETE FROM fotos WHERE Numero_Foto = P_Numero_Foto;
SELECT '201', 'Operacion Exitosa' as result;
ELSE
SELECT '409', 'Fallo al eliminar' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for getImages
-- ----------------------------
DROP PROCEDURE IF EXISTS `getImages`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getImages`(p_claveCabana INT)
BEGIN
SELECT * FROM fotos WHERE `Clave_Cabaña` = p_claveCabana;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for getMiCabana
-- ----------------------------
DROP PROCEDURE IF EXISTS `getMiCabana`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMiCabana`(clavecab INT)
BEGIN
SELECT * FROM `cabaña` WHERE `Clave_Cabaña` =  clavecab;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for getMisCabanas
-- ----------------------------
DROP PROCEDURE IF EXISTS `getMisCabanas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMisCabanas`(iduser INT)
BEGIN
SELECT * FROM `cabaña` WHERE Numero_Socio =  iduser;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for hacer_pago
-- ----------------------------
DROP PROCEDURE IF EXISTS `hacer_pago`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hacer_pago`(p_folioP VARCHAR (15),
p_FolioR VARCHAR (15),
p_idCaract int,
p_id_concepto int,
p_motno FLOAT,
p_fechamonto VARCHAR (255),
p_urlEv VARCHAR (255))
BEGIN
IF EXISTS (SELECT Folio_Pago FROM pagos WHERE Folio_Pago = p_folioP) THEN
SELECT '409' as result;
ELSE
	INSERT INTO pagos VALUEs (
	p_folioP,
	p_FolioR,
	p_idCaract,
	p_id_concepto,
	p_motno,
	p_fechamonto,
	p_urlEv
	);
	SELECT '201' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for hacer_reservacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `hacer_reservacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hacer_reservacion`(p_folR VARCHAR (15),
p_folC VARCHAR (20),
p_clCab INT,
p_dateInt datetime,
p_dateExt datetime,
p_preR FLOAT)
BEGIN

DECLARE v_folc VARCHAR (255);

SELECT Folio_Cliente INTO v_folc FROM cliente WHERE CURP = p_folC;

IF EXISTS (SELECT Folio_Reservacion FROM reservacion WHERE Folio_Reservacion = p_folR) THEN
SELECT '409' AS result;
ELSE
	INSERT INTO reservacion VALUES (
	p_folR,
	v_folc,
	p_clCab,
	p_dateInt,
	p_dateExt,
	p_preR,
	'A'
	);
	SELECT '201' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_cabaña
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_cabaña`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cabaña`(IN P_Numero_Socio INT(15),
IN P_Nombre_Cabaña VARCHAR(255),
IN P_Descripcion_Cabaña LONGTEXT,
IN P_Precio_Cabaña VARCHAR(100),
IN P_Capacidad VARCHAR(50),
IN P_Ubicacion VARCHAR(255),
IN P_Maps VARCHAR(255))
BEGIN
IF EXISTS (SELECT `Nombre_Cabaña` FROM `cabaña` WHERE `Nombre_Cabaña` = P_Nombre_Cabaña) THEN
SELECT '409' as result;
ELSE
     INSERT INTO cabaña 
		(Numero_Socio, Nombre_Cabaña, Descripcion_Cabaña, Precio_Cabaña, Capacidad, Ubicacion, Maps, status)
		VALUES 
		(P_Numero_Socio, P_Nombre_Cabaña, P_Descripcion_Cabaña, P_Precio_Cabaña, P_Capacidad,     P_Ubicacion, P_Maps, 1);
SELECT '201' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_caracteristica
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_caracteristica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_caracteristica`(IN P_id_caracteristica INT(15),
IN P_Descripcion VARCHAR(255))
BEGIN
IF EXISTS (SELECT id_caracteristica FROM caracteristicas WHERE id_caracteristica = P_id_caracteristica) THEN
SELECT '409' as result;
ELSE
     INSERT INTO caracteristicas
    (id_caracteristica, Descripcion)
    VALUES 
    (P_id_caracteristica, P_Descripcion);
SELECT '201' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_cliente
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_cliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente`(IN p_folio varchar (100),
IN P_Nombre VARCHAR(255),
IN P_Apellido_1 VARCHAR(50),
IN P_Apellido_2 VARCHAR(50),
IN P_Telefono CHAR (20),
IN P_Direccion VARCHAR(255),
IN P_CURP VARCHAR(255),
IN P_RFC VARCHAR(255),
IN P_Email VARCHAR(50))
BEGIN
IF EXISTS (SELECT CURP FROM cliente WHERE CURP = UPPER(P_CURP)) THEN
SELECT '409' as result;
ELSE
     INSERT INTO cliente
    (Folio_Cliente, Nombre, Apellido_1, Apellido_2, Telefono, Direccion, CURP, RFC, Email)
    VALUES 
    (p_folio, UPPER(P_Nombre), UPPER(P_Apellido_1), UPPER(P_Apellido_2), UPPER(P_Telefono), UPPER(P_Direccion), UPPER(P_CURP), UPPER(P_RFC), P_Email);
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_concepto
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_concepto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_concepto`(IN P_id_concepto INT(15),
IN P_Descripcion_Concepto VARCHAR(255))
BEGIN
IF EXISTS (SELECT id_concepto FROM concepto WHERE id_concepto = P_id_concepto) THEN
SELECT '409', 'Ya existe' as result;
ELSE
     INSERT INTO concepto
    (id_concepto, Descripcion_Concepto)
    VALUES 
    (P_id_concepto, P_Descripcion_Concepto);
SELECT '201', 'Exito' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_dueños
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_dueños`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_dueños`(IN P_Nombre VARCHAR(255),
    IN P_Apellido1 VARCHAR(255),
    IN P_Apellido2 VARCHAR(255),
    IN p_Email VARCHAR(255),
    IN p_contrasenia VARCHAR(255))
BEGIN
    DECLARE uppercaseNombre VARCHAR(255);
    DECLARE uppercaseApellido1 VARCHAR(255);
    DECLARE uppercaseApellido2 VARCHAR(255);

    SET uppercaseNombre = UPPER(P_Nombre);
    SET uppercaseApellido1 = UPPER(P_Apellido1);
    SET uppercaseApellido2 = UPPER(P_Apellido2);

    IF EXISTS (SELECT Nombre, Apellido1, Apellido2, email FROM dueños WHERE  Nombre = uppercaseNombre AND Apellido1 = uppercaseApellido1 AND Apellido2 = uppercaseApellido2 AND email = p_Email)
    THEN
        SELECT '409' as result;
    ELSE
        INSERT INTO dueños
        (Nombre, Apellido1, Apellido2, email, pasword_dueno)
        VALUES 
        (uppercaseNombre, uppercaseApellido1, uppercaseApellido2, p_Email, p_contrasenia);
        SELECT '201' as result;
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_foto
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_foto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_foto`(IN P_Numero_Foto VARCHAR(255),
IN P_Clave_Cabaña INT,
IN P_URL_FOTO LONGBLOB)
BEGIN
IF EXISTS (SELECT Numero_Foto FROM fotos WHERE Numero_Foto = P_Numero_Foto) THEN
SELECT '409' as results;
ELSE
	IF EXISTS (SELECT `status` from fotos WHERE `status` = '1' AND Clave_Cabaña = P_Clave_Cabaña)THEN
     INSERT INTO fotos
    (Numero_Foto, Clave_Cabaña, url_foto, `status`)
    VALUES 
    (P_Numero_Foto, P_Clave_Cabaña, P_URL_FOTO, '2');
	ELSE
		INSERT INTO fotos
    (Numero_Foto, Clave_Cabaña, url_foto, `status`)
    VALUES 
    (P_Numero_Foto, P_Clave_Cabaña, P_URL_FOTO, '1');
	END IF;
	SELECT '200' as results;

END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for INSERTAR_PERSONA
-- ----------------------------
DROP PROCEDURE IF EXISTS `INSERTAR_PERSONA`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTAR_PERSONA`(
P_correo VARCHAR(255),
P_contrasenia VARCHAR(255),
P_rol VARCHAR(255),
P_Nombre VARCHAR(255),
P_Ape1 VARCHAR(255),
P_Ape2 VARCHAR(255),
P_Telefono VARCHAR(255),
P_CURP VARCHAR(255) )
BEGIN

	DECLARE hashed_password VARCHAR(64);

  SET hashed_password = SHA2(P_contrasenia, 256);

	SET @ROL := (SELECT rol.id_rol FROM rol WHERE rol.rol = P_rol LIMIT 1 );

	INSERT INTO usuario
	VALUES
	(DEFAULT,
	P_correo,
	hashed_password,
	NULL,
	NULL,
	@ROL,
	1);
	
	SET @ID := (SELECT MAX(usuario.id_usuario) FROM usuario);
	

	INSERT INTO persona
	VALUES
	(DEFAULT,
	P_Nombre,
	P_Ape1,
	P_Ape2,
	P_Telefono,
	P_CURP,
	@ID);

	ROLLBACK;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertar_servicio
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertar_servicio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_servicio`(p_clvCabana INT,
p_idCarc INT,
p_valor VARCHAR (255),
p_obvs VARCHAR (255))
BEGIN
INSERT INTO servicios VALUES (
DEFAULT,
p_clvCabana,
p_idCarc,
p_valor,
p_obvs
);
SELECT '201' AS result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for OBTENER_ROL
-- ----------------------------
DROP PROCEDURE IF EXISTS `OBTENER_ROL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OBTENER_ROL`()
BEGIN

	SELECT 
	id_rol, 
	rol
	FROM rol
	WHERE rol.status = 1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for VALIDAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `VALIDAR_USUARIO`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDAR_USUARIO`(
P_correo VARCHAR(255),
P_contrasenia VARCHAR(255)
)
BEGIN
DECLARE hashed_password VARCHAR(64);

  -- Obtener el hash de la contraseña proporcionada
  SET hashed_password = SHA2(P_contrasenia, 256);


		 SET @USUARIO := (SELECT usuario.correo FROM usuario WHERE usuario.correo = P_correo);
		 SET @ID := (SELECT usuario.id_usuario FROM usuario WHERE usuario.correo = P_correo);
		 SET @ROL := (SELECT usuario.id_rol FROM usuario WHERE usuario.correo = P_correo);

		 IF @USUARIO = P_correo THEN
						 SET @stored_password := (SELECT `contrasenia` FROM usuario WHERE id_usuario = @ID);

			 IF hashed_password = @stored_password THEN
				 SELECT @ID  AS id_usuario, @ROL  AS id_rol;
			 ELSE
				 SELECT 'CONTRASENIA' AS RR;
			 END IF;
		 ELSE
			 SELECT 'USUARIO' AS RR;
		 END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for verCaracteristicas
-- ----------------------------
DROP PROCEDURE IF EXISTS `verCaracteristicas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verCaracteristicas`(clv_cab INT)
BEGIN
SELECT caracteristicas.id_caracteristica, caracteristicas.Descripcion, caracteristica_cabana.clave_caracteristica_cabana
FROM caracteristicas
JOIN caracteristica_cabana ON caracteristicas.id_caracteristica = caracteristica_cabana.id_caracteristica
JOIN `cabaña` ON caracteristica_cabana.`Clave_Cabaña` = `cabaña`.`Clave_Cabaña`
WHERE caracteristica_cabana.`Clave_Cabaña` = clv_cab;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for verificcliente
-- ----------------------------
DROP PROCEDURE IF EXISTS `verificcliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificcliente`(op_nec VARCHAR (255),
op_pasw VARCHAR (255))
BEGIN
IF EXISTS (SELECT * FROM cliente WHERE Email = UPPER(op_nec) and contrasenia = op_pasw) THEN
SELECT * FROM cliente WHERE Email = UPPER(op_nec) and contrasenia = op_pasw;
ELSE
SELECT '404' as result;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for verPartealta
-- ----------------------------
DROP PROCEDURE IF EXISTS `verPartealta`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verPartealta`()
BEGIN
SELECT
	`cabaña`.`Clave_Cabaña`, 
	`cabaña`.`Nombre_Cabaña`, 
	`cabaña`.`Descripcion_Cabaña`, 
	`cabaña`.`Precio_Cabaña`, 
	`cabaña`.Capacidad, 
	`dueños`.Nombre, 
	`dueños`.Apellido1, 
	`dueños`.Apellido2, 
	`dueños`.email
FROM
	`cabaña`
	INNER JOIN
	`dueños`
	ON 
		`cabaña`.Numero_Socio = `dueños`.Numero_Socio
WHERE
	`cabaña`.Ubicacion = 'Parte Alta'
ORDER BY
	`cabaña`.`Precio_Cabaña` ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for verPartebaja
-- ----------------------------
DROP PROCEDURE IF EXISTS `verPartebaja`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verPartebaja`()
BEGIN
SELECT
	`cabaña`.`Clave_Cabaña`, 
	`cabaña`.`Nombre_Cabaña`, 
	`cabaña`.`Descripcion_Cabaña`, 
	`cabaña`.`Precio_Cabaña`,
	`cabaña`.Latitude, 
	`cabaña`.Longitude,	
	`cabaña`.Capacidad, 
	`dueños`.Nombre, 
	`dueños`.Apellido1, 
	`dueños`.Apellido2, 
	`dueños`.email
FROM
	`cabaña`
	INNER JOIN
	`dueños`
	ON 
		`cabaña`.Numero_Socio = `dueños`.Numero_Socio
WHERE
	`cabaña`.Ubicacion = 'Parte Baja'
ORDER BY
	`cabaña`.`Precio_Cabaña` ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for ver_reservacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `ver_reservacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ver_reservacion`(p_curp VARCHAR (100))
BEGIN

DECLARE v_folc VARCHAR (255);

SELECT Folio_Cliente INTO v_folc FROM cliente WHERE CURP = UPPER(p_curp);

SELECT
	reservacion.Folio_Reservacion, 
	reservacion.Fecha_Entrada, 
	reservacion.Fecha_Salida, 
	reservacion.Precio_Reservacion, 
	reservacion.`Status`, 
	`cabaña`.`Nombre_Cabaña`
FROM
	reservacion
	INNER JOIN
	`cabaña`
	ON 
		reservacion.`Clave_Cabaña` = `cabaña`.`Clave_Cabaña`
WHERE
	reservacion.Folio_Cliente = v_folc
	order BY reservacion.`Status`;
END
;;
DELIMITER ;
