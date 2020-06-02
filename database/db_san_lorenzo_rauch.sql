-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2020 a las 01:05:01
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_san_lorenzo_rauch`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_administrador` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_administrador`, `nombre`, `nombre_usuario`, `contraseña`) VALUES
(1, 'Seba Esains', 'admin', '$2y$10$S1Nls0pCAHOl2Brfy.KUouH6LvQDVk4ABqYJ2lmAag8i0jVmiBq9O');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisiones`
--

CREATE TABLE `divisiones` (
  `id_division` int(2) NOT NULL,
  `nombre_div` varchar(15) NOT NULL,
  `edad_limite` int(2) NOT NULL,
  `limite_jugadores_LBF` int(2) NOT NULL,
  `excepciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `divisiones`
--

INSERT INTO `divisiones` (`id_division`, `nombre_div`, `edad_limite`, `limite_jugadores_LBF`, `excepciones`) VALUES
(1, 'PRIMERA', 99, 40, 'En primera división es libre, no hace falta excepciones.'),
(5, 'QUINTA', 20, 40, 'Se pueden incorporar 2 jugadores de 18 años y 2 de 19 años. El arquero es libre.'),
(6, 'SEXTA', 14, 50, 'Se pueden incorporar jugadores de divisiones inferiores siempre y cuando no jueguen en el mismo día en su división.'),
(7, 'SEPTIMA', 14, 60, 'Se pueden incorporar jugadores de divisiones inferiores siempre y cuando no jueguen en el mismo día en su división.'),
(8, 'OCTAVA', 12, 60, 'Se pueden incorporar jugadores de divisiones inferiores siempre y cuando no jueguen en el mismo día en su división.'),
(9, 'NOVENA', 11, 60, 'Se pueden incorporar jugadores de divisiones inferiores siempre y cuando no jueguen en el mismo día en su división.'),
(10, 'DECIMA', 10, 60, 'Se pueden incorporar jugadores de divisiones inferiores siempre y cuando no jueguen en el mismo día en su división.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugador` int(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int(2) NOT NULL,
  `fecha_nac` varchar(12) NOT NULL,
  `carnet` varchar(20) NOT NULL,
  `puesto` varchar(15) NOT NULL,
  `club_origen` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_division` int(2) NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre`, `edad`, `fecha_nac`, `carnet`, `puesto`, `club_origen`, `telefono`, `id_division`, `imagen`) VALUES
(23322505, 'LEONARDO ESAINS', 35, '1973-07-30', 'SL-099', 'ARQUERO', 'AGRARIA', '249 154 559796', 5, 'images/jugadores/45036455.jpg'),
(23698773, 'pipi romagnoli', 38, '1999-11-23', 'SL-088', 'VOLANTE', 'SAN LORENZO', '(249) 154 594923', 1, 'images/jugadores/45036455.jpg'),
(29885727, 'BARRAGÁN PASCUAL', 17, '03/01/2003', 'SL-045', 'ARQUERO', 'SAN LORENZO', '(249) 154 017548', 1, 'images/jugadores/29885727.jpg'),
(32312811, 'FACUNDO LIPPO', 34, '11/04/1986', 'SL-030', 'DEFENSOR', 'SAN LORENZO', '(11) 1526 484453', 1, 'images/jugadores/32312811.jpg'),
(32362317, 'MARCELO OSCAR IBÁÑEZ', 34, '09/07/1986', 'SL-036', 'VOLANTE', 'SAN LORENZO', '(249) 154 338452', 1, 'images/jugadores/32362317.jpg'),
(32815032, 'JÓNATAN ORELLANO', 33, '16/01/1987', 'SL-090', 'DEFENSOR', 'SAN LORENZO', '(249) 154 022005', 1, 'images/jugadores/32815032.jpg'),
(32815188, 'VICTORIANO CANO KELLY', 33, '26/08/1987', 'SL-146', 'DELANTERO', 'SAN LORENZO', '(249) 154 279512', 1, 'images/jugadores/32815188.jpg'),
(33292157, 'LUCIANO DINAMARCA', 33, '10/07/1987', 'SL-031', 'DELANTERO', 'SAN LORENZO', '(221) 154 181054', 1, 'images/jugadores/33292157.jpg'),
(33328427, 'CARLOS SAINZ', 32, '14/02/1988', 'SL-044', 'DELANTERO', 'SAN LORENZO', '(249) 154 561764', 1, 'images/jugadores/33328427.jpg'),
(33917962, 'MARTÍN GABRIEL VELA', 32, '04/11/1988', 'SL-098', 'VOLANTE', 'SAN LORENZO', '(249) 154 279512', 1, 'images/jugadores/33917962.jpg'),
(33917970, 'JUAN OCTAVIO MARTÍNEZ', 31, '15/01/1989', 'SL-028', 'VOLANTE', 'SAN LORENZO', '(249) 154 557145', 1, 'images/jugadores/33917970.jpg'),
(34961205, 'MATÍAS VALDEZ', 31, '21/09/1989', 'SL-040', 'DELANTERO', 'SAN LORENZO', '(249) 154 550406', 1, 'images/jugadores/34961205.jpg'),
(34961390, 'YÓNATHAN BENÍTEZ', 30, '03/07/1990', 'SL-042', 'DELANTERO', 'SAN LORENZO', '(249) 154 550406', 1, 'images/jugadores/34961390.jpg'),
(35334734, 'ARIAS JOSÉ HÉCTOR ', 30, '03/08/1990', 'SL-033', 'VOLANTE', 'AGRARIA', '(249) 154 541147', 1, 'images/jugadores/35334734.jpg'),
(35334774, 'BERNATENE JÓNATHAN', 29, '25/09/1991', 'SL-102', 'VOLANTE', 'SAN LORENZO', '(249) 154 356205', 1, 'images/jugadores/35334774.jpg'),
(35797712, 'RAFAEL CABALLERO', 30, '09/11/1990', 'SL-117', 'DEFENSOR', 'AGRARIA', '(249) 154 539254', 1, 'images/jugadores/35797712.jpg'),
(35797761, 'JOSÉ GARRALDA ', 17, '02/01/2003', 'SL-079', 'DEFENSOR', 'SAN LORENZO', '(249) 154 552318', 1, 'images/jugadores/35797761.jpg'),
(36484415, 'ALEXIS  GUTIÉRREZ', 28, '18/12/1991', 'SL-038', 'DEFENSOR', 'SAN LORENZO', '(249) 154 347755', 1, 'images/jugadores/36484415.jpg'),
(36933055, 'DAMIÁN LOURTAU ', 28, '31/05/1992', 'SL-144', 'DELANTERO', 'SAN LORENZO', '(249) 154 002830', 1, 'images/jugadores/36933055.jpg'),
(36933116, 'MARCELO DANIEL ACUÑA', 28, '02/09/1992', 'SL-149', 'DEFENSOR', 'SAN LORENZO', '(249) 154 279512', 1, 'images/jugadores/36933116.jpg'),
(36933194, 'JOAQUIN ALCIDES ACOSTA', 27, '26/11/1992', 'SL-043', 'VOLANTE', 'SAN LORENZO', '(249) 154 553852', 1, 'images/jugadores/36933194.jpg'),
(37197440, 'RODRIGO CORRAL', 27, '13/05/1993', 'SL-078', 'VOLANTE', 'SAN LORENZO', '(249) 154 598504', 1, 'images/jugadores/37197440.jpg'),
(37380179, 'AGUSTÍN VAQUEIRO', 27, '05/02/1993', 'SL-073', 'VOLANTE', 'SAN LORENZO', '(249) 154 359892', 1, 'images/jugadores/37380179.jpg'),
(37380218, 'MARIANO CIOLFI', 27, '04/05/1993', 'SL-046', 'DEFENSOR', 'SAN LORENZO', '(249) 154 663247', 1, 'images/jugadores/37380218.jpg'),
(37871062, 'FEDERICO ROBLES ', 26, '01/12/1993', 'SL-099', 'VOLANTE', 'SAN LORENZO', '(249) 154 531400', 1, 'images/jugadores/37871062.jpg'),
(37871096, 'MANGO AGUSTÍN', 26, '30/12/1993', 'SL-086', 'DEFENSOR', 'SAN LORENZO', '(249) 154 340895', 1, 'images/jugadores/37871096.jpg'),
(37871185, 'GONZALO ORELLANO', 26, '14/04/1994', 'SL-066', 'DELANTERO', 'SAN LORENZO', '(249) 154 346566', 1, 'images/jugadores/37871185.jpg'),
(37871189, 'BARRAGÁN LUCAS', 26, '06/05/1994', 'SL-135', 'VOLANTE', 'SAN LORENZO', '(249) 154 324788', 1, 'images/jugadores/37871189.jpg'),
(37871205, 'FACUNDO BENAVÍDEZ', 26, '22/05/1994', 'SL-037', 'DELANTERO', 'AGRARIA', '(249) 154 322028', 1, 'images/jugadores/37871205.jpg'),
(40810190, 'IRUNGARAY FEDERICO', 22, '15/04/1998', 'SL-024', 'DEFENSOR', 'SAN LORENZO', '(249) 154 007181', 1, 'images/jugadores/40810190.jpg'),
(41097637, 'GABRIEL ARTIGAS', 22, '08/07/1998', 'SL-091', 'DEFENSOR', 'SAN LORENZO', '(249) 154 062750', 1, 'images/jugadores/41097637.jpg'),
(41969619, 'BRAIAN JAVIER CASAL ', 21, '09/10/1999', 'SL-122', 'DELANTERO', 'SAN LORENZO', '(249) 154 500787', 5, 'images/jugadores/41969619.jpg'),
(41969699, 'BAUTISTA KEEGAN', 20, '01/01/2000', 'SL-062', 'DEFENSOR', 'SAN LORENZO', '(249) 154 279512', 5, 'images/jugadores/41969699.jpg'),
(42428423, 'ERNESTO JOSÉ DE CANDILO', 20, '15/11/1999', 'SL-072', 'DEFENSOR', 'SAN LORENZO', '(249) 154 357929', 5, 'images/jugadores/42428423.jpg'),
(42491632, 'TOMÁS FEDERICO ELUAIZA', 20, '23/03/2000', 'SL-142', 'VOLANTE', 'SAN LORENZO', '(249) 154 022973', 5, 'images/jugadores/42491632.jpg'),
(42491658, 'ÁLEX ATUCHA', 17, '19/04/2003', 'SL-075', 'VOLANTE', 'SAN LORENZO', '(249) 154 062262', 1, 'images/jugadores/42491658.jpg'),
(42839254, 'LEONEL MOYANO ', 20, '14/09/2000', 'SL-054', 'VOLANTE', 'SAN LORENZO', '(249) 154 475368', 5, 'images/jugadores/42839254.jpg'),
(42839281, 'AGUSTÍN CORREA', 20, '23/10/2000', 'SL-010', 'DEFENSOR', 'SAN LORENZO', '(249) 154 593436', 5, 'images/jugadores/42839281.jpg'),
(42839289, 'THIAGO MARINO ', 20, '05/11/2000', 'SL-088', 'VOLANTE', 'SAN LORENZO', '(249) 154 476802', 5, 'images/jugadores/42839289.jpg'),
(42879700, 'FEDERICO JAUREGUIBERRY', 20, '14/08/2000', 'SL-048', 'DELANTERO', 'SAN LORENZO', '(249) 154 569480', 5, 'images/jugadores/42879700.jpg'),
(43197192, 'ÁXEL EMMANUEL FACCIO', 19, '19/04/2001', 'SL-124', 'DEFENSOR', 'SAN LORENZO', '(249) 154 050733', 5, 'images/jugadores/43197192.jpg'),
(43471258, 'MARTÍN ELUAIZA', 19, '15/07/2001', 'SL-041', 'DEFENSOR', 'SAN LORENZO', '(249) 154 327502', 5, 'images/jugadores/43471258.jpg'),
(43471266, 'ORUEZABAL TOMÁS', 19, '10/05/2001', 'SL-138', 'VOLANTE', 'SAN LORENZO', '(249) 154 062100', 5, 'images/jugadores/43471266.jpg'),
(43972615, 'GIULIANO CARRIZO', 17, '14/05/2003', 'SL-026', 'DELANTERO', 'SAN LORENZO', '(249) 154 694413', 5, 'images/jugadores/43972615.jpg'),
(44046838, 'ALFARO MATEO', 17, '12/04/2003', 'SL-022', 'VOLANTE', 'SAN LORENZO', '(249) 154 000272', 5, 'images/jugadores/44046838.jpg'),
(44357004, 'SALVADOR GALVÁN', 18, '04/08/2002', 'SL-039', 'VOLANTE', 'SAN LORENZO', '(249) 154 029447', 5, 'images/jugadores/44357004.jpg'),
(44357044, 'ALCETEGARAY FEDERICO', 17, '23/09/2003', 'SL-007', 'DELANTERO', 'SAN LORENZO', '(249) 154 066399', 5, 'images/jugadores/44357044.jpg'),
(44357080, 'NICOLÁS CERVETTA', 17, '19/11/2002', 'SL-027', 'DEFENSOR', 'SAN LORENZO', '(249) 154 207282', 5, 'images/jugadores/44357080.jpg'),
(44357100, 'ALEJANDRO AREVALO', 17, '01/12/2002', 'SL-032', 'DEFENSOR', 'SAN LORENZO', '(249) 154 028486', 5, 'images/jugadores/44357100.jpg'),
(44649537, 'PABLO GASPAR CARLUCCIO', 17, '14/02/2003', 'SL-004', 'VOLANTE', 'SAN LORENZO', '(249) 154 019819', 5, 'images/jugadores/44649537.jpg'),
(44649542, 'MATEO FACCIO ', 17, '17/02/2003', 'SL-001', 'VOLANTE', 'SAN LORENZO', '(249) 154 213122', 5, 'images/jugadores/44649542.jpg'),
(44649543, 'NICANOR DOMINGUEZ', 17, '28/01/2003', 'SL-114', 'ARQUERO', 'SAN LORENZO', '(249) 154 278626', 1, 'images/jugadores/44649543.jpg'),
(44649545, 'LUCIO COSTANTINO', 17, '23/02/2003', 'SL-145', 'VOLANTE', 'SAN LORENZO', '(249) 154 210500', 5, 'images/jugadores/44649545.jpg'),
(44649556, 'LUCIANO ALFREDO LESCANO', 17, '21/03/2003', 'SL-034', 'VOLANTE', 'SAN LORENZO', '(249) 154 356935', 5, 'images/jugadores/44649556.jpg'),
(44649560, 'ULISES HERRERIA ', 17, '21/03/2003', 'SL-067', 'DEFENSOR', 'SAN LORENZO', '(249) 154 534234', 5, 'images/jugadores/44649560.jpg'),
(45036419, 'VALENTÍN MIÑOLA', 17, '16/04/2003', 'SL-119', 'ARQUERO', 'SAN LORENZO', '(249) 154 694461', 5, 'images/jugadores/45036419.jpg'),
(45036447, 'ALEJANDRO CROCCI', 17, '03/06/2003', 'SL-068', 'ARQUERO', 'SAN LORENZO', '(249) 154 665099', 5, 'images/jugadores/45036447.jpg'),
(45036455, 'TOMÁS ESAINS', 16, '14/06/2003', 'SL-021', 'DEFENSOR', 'SAN LORENZO', '(249) 154 594923', 5, 'images/jugadores/45036455.jpg'),
(45223755, 'TOMAS ALONSO', 17, '18/08/2003', 'SL-065', 'VOLANTE', 'SAN LORENZO', '(249) 154 356350', 1, 'images/jugadores/45223755.jpg'),
(45223769, 'FELIPE BENAVIDEZ', 17, '04/09/2003', 'SL-103', 'DELANTERO', 'SAN LORENZO', '(249) 154 348229', 5, 'images/jugadores/45223769.jpg'),
(45223775, 'IAN DIAZ', 17, '21/08/2003', 'SL-113', 'DELANTERO', 'BOTAFOGO', '(249) 154 325519', 5, 'images/jugadores/45223775.jpg'),
(45460118, 'CRISTIAN MALDONADO ', 16, '18/11/2003', 'SL-020', 'VOLANTE', 'SAN LORENZO', '(249) 154 062153', 5, 'images/jugadores/45460118.jpg'),
(45460127, 'ALFONSO FERNANDEZ ', 16, '12/12/2003', 'SL-057', 'VOLANTE', 'SAN LORENZO', '(249) 154 581672', 5, 'images/jugadores/45460127.jpg'),
(45460166, 'FEDERICO YA?EZ', 16, '28/01/2004', 'SL-155', 'DELANTERO', 'SAN LORENZO', '(249) 154 062372', 6, 'images/jugadores/45460166.jpg'),
(45460169, 'ROCCO TISERA', 17, '23/01/2003', 'SL-002', 'DEFENSOR', 'SAN LORENZO', '(249) 154 312641', 5, 'images/jugadores/45460169.jpg'),
(45460170, 'FAUSTO ALCETEGARAY', 16, '03/02/2004', 'SL-005', 'DELANTERO', 'SAN LORENZO', '(249) 154 013098', 6, 'images/jugadores/45460170.jpg'),
(45621501, 'MARTIN NELLI', 16, '02/03/2004', 'SL-082', 'VOLANTE', 'SAN LORENZO', '(249) 154 315898', 6, 'images/jugadores/45621501.jpg'),
(45621559, 'AGUSTIN ROMAN RIVERA', 16, '07/06/2004', 'SL-141', 'VOLANTE', 'SAN LORENZO', '(249) 154 476506', 6, 'images/jugadores/45621559.jpg'),
(45621561, 'ALEJO EISMENDI', 16, '15/06/2004', 'SL-051', 'DEFENSOR', 'SAN LORENZO', '(249) 154 588409', 6, 'images/jugadores/45621561.jpg'),
(45621573, 'CARLUCCIO, DAVID ', 16, '03/07/2004', 'SL-121', 'DELANTERO', 'SAN LORENZO', '(249) 154 213798', 6, 'images/jugadores/45621573.jpg'),
(45621597, 'BENJAMIN LOUSTAUNAU ', 16, '05/08/2004', 'SL-147', 'DEFENSOR', 'SAN LORENZO', '(249) 154 554544', 6, 'images/jugadores/45621597.jpg'),
(45782960, 'VALENTIN HOURCADE', 16, '15/08/2004', 'SL-016', 'DEFENSOR', 'SAN LORENZO', '(249) 154 213082', 5, 'images/jugadores/45782960.jpg'),
(46185807, 'THIAGO BEL?EN', 16, '05/10/2004', 'SL-156', 'DELANTERO', 'BOTAFOGO', '(249) 154 279512', 6, 'images/jugadores/46185807.jpg'),
(46185868, 'LAUTARO ORUEZABAL', 15, '17/01/2005', 'SL-150', 'DEFENSOR', 'AGRARIA', '(249) 154 477474', 6, 'images/jugadores/46185868.jpg'),
(46185878, 'MARCOS MARTINEZ', 15, '06/02/2005', 'SL-131', 'VOLANTE', 'SAN LORENZO', '(249) 154 052293', 6, 'images/jugadores/46185878.jpg'),
(46185892, 'FELIPE OYHANART ROLDAN', 15, '13/02/2005', 'SL-060', 'DEFENSOR', 'SAN LORENZO', '(249) 154 210556', 6, 'images/jugadores/46185892.jpg'),
(46412504, 'EMILIANO YAIR SUAREZ', 15, '11/05/2005', 'SL-152', 'ARQUERO', 'DEPORTIVO RAUCH', '(249) 154 608702', 6, 'images/jugadores/46412504.jpg'),
(46512626, 'TOBIAS JESUS VAZQUEZ', 14, '09/10/2006', 'SL-052', 'VOLANTE', 'SAN LORENZO', '(249) 154 068631', 7, 'images/jugadores/46512626.jpg'),
(46560225, 'NELSON GAYTE', 15, '18/03/2005', 'SL-083', 'DELANTERO', 'SAN LORENZO', '(249) 154 279512', 6, 'images/jugadores/46560225.jpg'),
(46560256, 'TADEO CALANDRIA ', 15, '31/05/2005', 'SL-058', 'DELANTERO', 'SAN LORENZO', '(249) 154 358027', 6, 'images/jugadores/46560256.jpg'),
(46560285, 'RAMIRO MOYANO', 15, '18/07/2005', 'SL-061', 'DEFENSOR', 'SAN LORENZO', '(249) 154 062220', 6, 'images/jugadores/46560285.jpg'),
(46902115, 'GASPAR CONDE', 15, '13/08/2005', 'SL-050', 'VOLANTE', 'SAN LORENZO', '(249) 154 069723', 6, 'images/jugadores/46902115.jpg'),
(46902121, 'MOREL CUADRA', 15, '13/08/2005', 'SL-148', 'VOLANTE', 'BOTAFOGO', '(249) 154 357863', 6, 'images/jugadores/46902121.jpg'),
(46902130, 'MARCOS IRUSQUIBELAR', 17, '16/08/2003', 'SL-071', 'DELANTERO', 'SAN LORENZO', '(249) 154 589520', 6, 'images/jugadores/46902130.jpg'),
(46902138, 'JUAN LAMARCHE', 15, '22/09/2005', 'SL-070', 'DEFENSOR', 'SAN LORENZO', '(249) 154 322022', 6, 'images/jugadores/46902138.jpg'),
(46902155, 'NICOLAS YA?EZ', 15, '14/10/2005', 'SL-056', 'DEFENSOR', 'SAN LORENZO', '(249) 154 278232', 6, 'images/jugadores/46902155.jpg'),
(46902174, 'ROMAN TISERA', 15, '29/10/2005', 'SL-049', 'VOLANTE', 'SAN LORENZO', '(249) 154 008121', 6, 'images/jugadores/46902174.jpg'),
(46902191, 'GONZALO BENJAMIN VAZQUEZ', -3, '22/12/2022', 'SL-089', 'VOLANTE', 'SAN LORENZO', '(249) 154 664995', 6, 'images/jugadores/46902191.jpg'),
(47159715, 'DUALDE VICENTE', 14, '19/01/2006', 'SL-123', 'VOLANTE', 'SAN LORENZO', '(249) 154 439089', 7, 'images/jugadores/47159715.jpg'),
(47159726, 'FRANCISCO ARIEL LESCANO', 14, '17/02/2006', 'SL-118', 'DEFENSOR', 'SAN LORENZO', '(249) 154 356021', 7, 'images/jugadores/47159726.jpg'),
(47159727, 'VALENTIN ATUCHA', 17, '03/02/2003', 'SL-153', 'DEFENSOR', 'SAN LORENZO', '(249) 154 015624', 7, 'images/jugadores/47159727.jpg'),
(47159732, 'RODRIGO CEJAS', 14, '06/03/2006', 'SL-127', 'DEFENSOR', 'SAN LORENZO', '(249) 154 597578', 7, 'images/jugadores/47159732.jpg'),
(47159749, 'URIEL FASSIO', 17, '05/04/2003', 'SL-104', 'VOLANTE', 'AGRARIA', '(249) 154 061985', 8, 'images/jugadores/47159749.jpg'),
(47159750, 'ARTOLA KEVIN GASTON', 14, '06/04/2006', 'SL-084', 'VOLANTE', 'SAN LORENZO', '(249) 154 000908', 7, 'images/jugadores/47159750.jpg'),
(47159754, 'ROMAN ARTIGAS', 17, '03/03/2003', 'SL-125', 'DEFENSOR', 'BOTAFOGO', '(249) 154 271758', 7, 'images/jugadores/47159754.jpg'),
(47159757, 'AGUSTIN ELIAS MANSILLA POLLIO', 14, '18/04/2006', 'SL-105', 'VOLANTE', 'SAN LORENZO', '(249) 154 661647', 7, 'images/jugadores/47159757.jpg'),
(47159758, 'JUAN MANUEL AMERIO', 14, '21/04/2006', 'SL-076', 'ARQUERO', 'AGRARIA', '(249) 154 324985', 7, 'images/jugadores/47159758.jpg'),
(47159761, 'JOAQUIN RODRIGUEZ HUGO ', 17, '23/04/2003', 'SL-094', 'DEFENSOR', 'SAN LORENZO', '(249) 154 273228', 7, 'images/jugadores/47159761.jpg'),
(47159774, 'BILBAO VALDEZ TOBIAS', 14, '16/05/2006', 'SL-143', 'VOLANTE', 'SAN LORENZO', '(249) 154 000392', 7, 'images/jugadores/47159774.jpg'),
(47222744, 'ALAN CARLUCCIO', 14, '19/08/2006', 'SL-077', 'DELANTERO', 'SAN LORENZO', '(249) 154 364661', 7, 'images/jugadores/47222744.jpg'),
(47416504, 'AGUSTIN ALONSO ', 17, '20/06/2003', 'SL-069', 'VOLANTE', 'SAN LORENZO', '(249) 154 311772', 7, 'images/jugadores/47416504.jpg'),
(47416512, 'NAZARENO AVILA', 14, '30/06/2006', 'SL-092', 'DEFENSOR', 'SAN LORENZO', '(249) 154 279512', 7, 'images/jugadores/47416512.jpg'),
(47416536, 'AQUILES KEEGAN URRUSPIL', 14, '26/07/2006', 'SL-154', 'VOLANTE', 'BOTAFOGO', '(249) 154 271263', 7, 'images/jugadores/47416536.jpg'),
(47416559, 'MURNO BAUTISTA LEONEL', 14, '23/08/2006', 'SL-055', 'VOLANTE', 'SAN LORENZO', '(249) 154 332839', 7, 'images/jugadores/47416559.jpg'),
(47685816, 'BENJAMIN MI?OLA', 13, '24/11/2006', 'SL-132', 'DEFENSOR', 'BOTAFOGO', '(249) 154 330231', 7, 'images/jugadores/47685816.jpg'),
(47685826, 'JULIAN GOMEZ ', 16, '24/11/2003', 'SL-074', 'ARQUERO', 'SAN LORENZO', '(249) 154 051398', 7, 'images/jugadores/47685826.jpg'),
(47685857, 'JUAN MARTIN ZUBILLAGA', 13, '26/01/2007', 'SL-019', 'VOLANTE', 'SAN LORENZO', '(249) 154 309987', 8, 'images/jugadores/47685857.jpg'),
(47685862, 'LAUTARO JOSE MEDINA ', 13, '28/01/2007', 'SL-009', 'VOLANTE', 'SAN LORENZO', '(249) 154 565438', 8, 'images/jugadores/47685862.jpg'),
(47685876, 'MARTINEZ MATIAS DANIEL', 17, '01/02/2003', 'SL-097', 'VOLANTE', 'SAN LORENZO', '(249) 154 563723', 8, 'images/jugadores/47685876.jpg'),
(47885302, 'GABRIEL DEANES', 13, '07/04/2007', 'SL-108', 'ARQUERO', 'SAN LORENZO', '(249) 154 555416', 8, 'images/jugadores/47885302.jpg'),
(47885306, 'SANTIAGO MURNO', 13, '08/03/2007', 'SL-100', 'ARQUERO', 'SAN LORENZO', '(249) 154 345389', 8, 'images/jugadores/47885306.jpg'),
(47885356, 'LEDESMA JUAN BAUTISTA', 13, '28/05/2007', 'SL-126', 'DELANTERO', 'SAN LORENZO', '(249) 154 533735', 8, 'images/jugadores/47885356.jpg'),
(47885388, 'AGUSTIN FRECCERO', 13, '08/08/2007', 'SL-120', 'VOLANTE', 'SAN LORENZO', '(249) 154 479641', 8, 'images/jugadores/47885388.jpg'),
(48309216, 'IVAN TOMAS CORREA', 13, '22/10/2007', 'SL-101', 'VOLANTE', 'SAN LORENZO', '(249) 154 210025', 9, 'images/jugadores/48309216.jpg'),
(48309227, 'THIAGO PARRA', 13, '02/11/2007', 'SL-111', 'DELANTERO', 'SAN LORENZO', '(249) 154 279512', 7, 'images/jugadores/48309227.jpg'),
(48309249, 'SANTIAGO ALVAREZ', 12, '29/12/2007', 'SL-106', 'DEFENSOR', 'SAN LORENZO', '(249) 154 479307', 9, 'images/jugadores/48309249.jpg'),
(48519702, 'FEDERICO MATEO BISCAY', 12, '10/04/2008', 'SL-023', 'ARQUERO', 'SAN LORENZO', '(249) 154 309987', 9, 'images/jugadores/48519702.jpg'),
(48643939, 'THOMAS MONTES', 12, '20/04/2008', 'SL-110', 'VOLANTE', 'SAN LORENZO', '(249) 154 322913', 9, 'images/jugadores/48643939.jpg'),
(48643962, 'BAUTISTA FERN?NDEZ ', 12, '12/04/2008', 'SL-011', 'DEFENSOR', 'SAN LORENZO', '(249) 154 016731', 9, 'images/jugadores/48643962.jpg'),
(48651348, 'DI NAPOLI AVELINO', 12, '29/09/2008', 'SL-107', 'DELANTERO', 'SAN LORENZO', '(249) 154 015086', 9, 'images/jugadores/48651348.jpg'),
(48651349, 'VALENTIN ALCETEGARAY ', 12, '28/09/2008', 'SL-008', 'DELANTERO', 'SAN LORENZO', '(249) 154 270227', 9, 'images/jugadores/48651349.jpg'),
(48651411, 'SAMARTINO EUSEBIO', 11, '05/01/2009', 'SL-129', 'DEFENSOR', 'SAN LORENZO', '(249) 154 279512', 10, 'images/jugadores/48651411.jpg'),
(48651430, 'NICOLAS PONCE', 11, '18/02/2009', 'SL-093', 'DELANTERO', 'SAN LORENZO', '(249) 154 061868', 10, 'images/jugadores/48651430.jpg'),
(48651441, 'SIM0N ASCAZURI ', 11, '09/03/2009', 'SL-053', 'DEFENSOR', 'SAN LORENZO', '(2281) 15 303637', 10, 'images/jugadores/48651441.jpg'),
(48651444, 'THIAGO PEREYRA', 1, '10/03/2019', 'SL-081', 'DELANTERO', 'SAN LORENZO', '(249) 154 019426', 10, 'images/jugadores/48651444.jpg'),
(48651465, 'BAUTISTA JOAQUIN FALABELLA', 11, '25/03/2009', 'SL-059', 'DEFENSOR', 'SAN LORENZO', '(249) 154 215029', 10, 'images/jugadores/48651465.jpg'),
(48651468, 'YAGO POFFER', 11, '19/03/2009', 'SL-095', 'VOLANTE', 'SAN LORENZO', '(249) 154 022219', 10, 'images/jugadores/48651468.jpg'),
(48651493, 'MARTINIANO VALDEZ ', 11, '07/05/2009', 'SL-139', 'VOLANTE', 'SAN LORENZO', '(249) 154 016327', 10, 'images/jugadores/48651493.jpg'),
(48674626, 'FRANCO DUBLAND', 11, '07/07/2009', 'SL-003', 'ARQUERO', 'BOTAFOGO', '(249) 154 034913', 9, 'images/jugadores/48674626.jpg'),
(48886203, 'SELLES CIFARELLI JOAQUIN', 11, '28/11/2008', 'SL-080', 'DELANTERO', 'SAN LORENZO', '(249) 154 638080', 9, 'images/jugadores/48886203.jpg'),
(49603008, 'JUAN CRUZ SALDUBEHERE ', 11, '21/05/2009', 'SL-133', 'DEFENSOR', 'SAN LORENZO', '(249) 154 279512', 10, 'images/jugadores/49603008.jpg'),
(49603024, 'AUGUSTO MINOLI', 11, '20/06/2009', 'SL-130', 'DEFENSOR', 'SAN LORENZO', '(249) 154 349875', 10, 'images/jugadores/49603024.jpg'),
(49603036, 'SANTIAGO ABEL RIVERA', 11, '01/07/2009', 'SL-140', 'VOLANTE', 'SAN LORENZO', '(249) 154 476506', 10, 'images/jugadores/49603036.jpg'),
(49748001, 'FRANCO LEONEL MEDINA ', 11, '30/09/2009', 'SL-029', 'ARQUERO', 'BOTAFOGO', '(249) 154 311712', 10, 'images/jugadores/49748001.jpg'),
(49748028, 'I?AKI CEJAS', 10, '12/11/2009', 'SL-128', 'VOLANTE', 'SAN LORENZO', '(249) 154 273248', 10, 'images/jugadores/49748028.jpg'),
(95314624, 'PEDRO AQUINO', 17, '29/06/2003', 'SL-012', 'VOLANTE', 'SAN LORENZO', '(249) 154 562324', 5, 'images/jugadores/95314624.jpg'),
(1234567866, 'Tomas Esains', 60, '2020-05-07', 'SL-099', 'ARQUERO', 'SAN LORENZO', '249 154 559796', 10, 'images/jugadores/45036455.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Indices de la tabla `divisiones`
--
ALTER TABLE `divisiones`
  ADD PRIMARY KEY (`id_division`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_division` (`id_division`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_administrador` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_division`) REFERENCES `divisiones` (`id_division`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
