-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-08-2021 a las 14:42:25
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myidea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guardar_idea`
--

DROP TABLE IF EXISTS `guardar_idea`;
CREATE TABLE IF NOT EXISTS `guardar_idea` (
  `id_usuario` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `guardar_idea`
--

INSERT INTO `guardar_idea` (`id_usuario`, `id`, `titulo`, `descripcion`) VALUES
(1, 1, 'aaaa', 'aaaaa'),
(9, 1, 'Editor de texto', 'Crear un editor de texto en js para tener un mejor control de lo que escribimos'),
(9, 2, 'aaaa', 'aaaaaaa'),
(9, 3, 'aaaa', 'aaaaa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('AoRhrw3tGJN6vI6JdDQMR545NhzDblAw', 1622842126, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"usuario\":\"Juan Perez\",\"rel\":\"admin\",\"visitas\":16}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(45) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario_nombre`, `contrasena`, `email`) VALUES
(1, 'eze', '$2a$08$JrGCYHtXCMl8MCd00C4RQOvX8fJYsPzLNc2LqTF0JsbVznqv1.LSC', 'ezequieldbo22@hotmail.com'),
(2, 'eze', '$2a$08$xHq2lqPpVJr5QUjqEuA/i.9b5RjVgOD.Hqg6UvEAVT4I2d0ZrY1Rm', 'ezequieldbo22@hotmail.com'),
(3, 'eze', '$2a$08$401/AuxdZfVlyyi6UN4Lo.3OdQYSBv3hQLEz9hsozH7Ar8qMUd1Ce', 'ezequieldbo22@hotmail.com'),
(4, 'eze', '$2a$08$eZUKOcOuB/9.aiYJBBLSlO/.VHlFETKMHcyjxFlL74CHykncGSstm', 'ezequieldbo22@hotmail.com'),
(5, 'marta', '$2a$08$UQxFhLRwejaEKn4BcO51g.9lZ0gADnh62Wl5YRh4tivLYGSECuRNG', 'ezequieldbo22@hotmail.com'),
(6, 'ezequiel', '$2a$08$OX98nZPK0QHtksQuGQylBex4wEle9BqQnUYKEZsDiEk7fVbuO.aH.', 'ezequieldbo22@hotmail.com'),
(7, 'julio', '$2a$08$XtjkVyEA99FcvU/Xue2rCe0aeAnwGOOP25C1oLBpVl0ZxjmgfwvWW', 'ezequieldbo22@hotmail.com'),
(8, 'papo', '$2a$08$d9sWKGAniG1yT8Tta7rnnungAIv0UIBZ7AbdX9Is8NZkcFbIwwtLy', 'ezequieldbo22@hotmail.com'),
(9, 'Bonich', '$2a$08$1zwqbnJx06Pq2p9DoXUV4Oaf.bdkuVgVMUpkY5NZpiGARLA6MVk.u', 'ezequieldbo22@hotmail.com'),
(10, 'ezequiel', '$2a$08$cbgJDDMvQJi77nSRki6Dd.j2vSQctMJW3sGTffr/g2DANch23nCZK', 'ezequieldbo22@hotmail.com'),
(11, 'HolaMundo', '$2a$08$UXg/h0oTSE1HjeuSZ2zPXOdMfDk3rui7AUp/riQjm1mSw8inM.4hS', 'ezequieldbo22@hotmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
