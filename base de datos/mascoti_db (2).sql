-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2025 a las 13:02:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mascoti_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_paseadores`
--

CREATE TABLE `asignaciones_paseadores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `paseador_id` bigint(20) UNSIGNED NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignaciones_paseadores`
--

INSERT INTO `asignaciones_paseadores` (`id`, `mascota_id`, `paseador_id`, `desde`, `hasta`, `created_at`, `updated_at`) VALUES
(6, 46, 3, '2025-06-09', '2025-06-30', '2025-06-12 19:41:05', '2025-06-12 19:41:05'),
(7, 41, 3, '2025-06-12', '2025-06-30', '2025-06-12 22:56:13', '2025-06-12 22:56:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `dueno_id` bigint(20) UNSIGNED NOT NULL,
  `veterinario_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `motivo` text DEFAULT NULL,
  `estado` enum('pendiente','aceptada','modificada','rechazada') NOT NULL DEFAULT 'pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `mascota_id`, `dueno_id`, `veterinario_id`, `fecha_hora`, `motivo`, `estado`, `created_at`, `updated_at`) VALUES
(5, 48, 2, 1, '2025-06-22 12:30:00', 'Herida en la pata', 'aceptada', '2025-06-11 20:49:34', '2025-06-11 20:49:34'),
(6, 41, 2, 1, '2025-06-16 18:01:00', 'Revision anual', 'aceptada', '2025-06-11 20:50:19', '2025-06-11 20:50:19'),
(7, 50, 4, 1, '2025-06-17 16:00:00', 'Dolor de barriga', 'aceptada', '2025-06-11 20:51:07', '2025-06-11 20:51:07'),
(8, 43, 4, 1, '2025-06-16 10:00:00', 'Mordida', 'aceptada', '2025-06-11 20:51:42', '2025-06-11 20:51:42'),
(9, 51, 4, 1, '2025-06-16 13:00:00', 'Intoxicacion', 'aceptada', '2025-06-11 20:52:33', '2025-06-11 20:52:33'),
(10, 46, 2, 1, '2025-06-11 17:00:00', 'Consulta', 'aceptada', '2025-06-11 20:53:28', '2025-06-11 20:53:28'),
(11, 52, 2, 1, '2025-06-12 11:00:00', 'Esta decaido', 'aceptada', '2025-06-11 21:17:23', '2025-06-11 21:17:23'),
(12, 44, 4, 1, '2025-06-12 11:00:00', 'Se le cae mucho el pelo', 'aceptada', '2025-06-11 21:17:51', '2025-06-11 21:17:51'),
(13, 48, 2, 1, '2025-06-19 15:00:00', 'Notificacion', 'aceptada', '2025-06-12 19:23:07', '2025-06-12 19:23:07'),
(14, 49, 2, 1, '2025-06-19 10:00:00', 'Prueba', 'aceptada', '2025-06-12 19:33:36', '2025-06-12 19:33:36'),
(15, 48, 2, 1, '2025-06-17 02:00:00', 'khn', 'pendiente', '2025-06-12 21:59:54', '2025-06-12 21:59:54'),
(16, 48, 2, 1, '2025-06-23 04:00:00', 'sadas', 'pendiente', '2025-06-12 22:37:23', '2025-06-12 22:37:23'),
(17, 48, 2, 1, '2025-06-18 03:00:00', 'hjhf', 'pendiente', '2025-06-12 23:05:07', '2025-06-12 23:05:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desparasitaciones`
--

CREATE TABLE `desparasitaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `proxima_dosis` date DEFAULT NULL,
  `tipo` enum('Interna','Externa') NOT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `desparasitaciones`
--

INSERT INTO `desparasitaciones` (`id`, `mascota_id`, `nombre`, `fecha_aplicacion`, `proxima_dosis`, `tipo`, `observaciones`, `created_at`, `updated_at`) VALUES
(32, 50, 'Drontal Plus', '2025-05-10', '2025-08-10', 'Interna', 'Desparasitación interna completa', '2025-06-11 16:24:47', '2025-06-11 16:24:47'),
(33, 46, 'Milbemax', '2025-06-01', '2025-09-01', 'Interna', 'Gato adulto, dosis única efectiva', '2025-06-11 16:26:42', '2025-06-11 16:26:42'),
(34, 45, 'NexGard\'', '2025-06-05', '2025-07-05', 'Externa', 'Contra pulgas y garrapatas', '2025-06-11 16:30:37', '2025-06-11 16:30:37'),
(35, 44, 'Profender', '2025-06-01', '2025-09-01', 'Interna', 'Aplicación cutánea para parásitos intestinales', '2025-06-11 16:31:44', '2025-06-11 16:31:44'),
(36, 42, 'Simparica', '2025-06-03', '2025-07-03', 'Interna', 'Pastilla masticable para perros de 10kg', '2025-06-11 16:32:31', '2025-06-11 16:32:31'),
(37, 49, 'Bravecto', '2025-05-15', '2025-08-15', 'Externa', 'Dura 3 meses, protección completa', '2025-06-11 16:33:26', '2025-06-11 16:33:26'),
(38, 51, 'Panacur', '2025-06-06', '2025-08-15', 'Interna', 'Conejo con riesgo leve, dosis ajustada', '2025-06-11 16:34:17', '2025-06-11 16:34:17'),
(39, 52, 'Vermectin', '2025-06-07', '2025-09-10', 'Externa', 'Conejo joven, control preventivo', '2025-06-11 16:35:43', '2025-06-11 16:35:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`id`, `mascota_id`, `titulo`, `descripcion`, `fecha`, `created_at`, `updated_at`) VALUES
(25, 52, 'Otitis externa', 'Inflamación del canal auditivo. Se recomienda limpieza diaria y gotas óticas', '2025-06-01', '2025-06-11 20:24:35', '2025-06-11 20:24:35'),
(26, 51, 'Gingivitis felina', 'Encías inflamadas, posible acumulación de sarro. Limpieza dental sugerida', '2025-06-02', '2025-06-11 20:28:07', '2025-06-11 20:28:07'),
(27, 50, 'Artritis leve', 'Dolor y rigidez articular. Se recomienda suplemento articular y chequeo regular', '2025-06-03', '2025-06-11 20:29:02', '2025-06-11 20:29:02'),
(28, 49, 'Rinitis alérgica', 'Estornudos y secreción nasal. Posible alergia ambiental', '2025-06-04', '2025-06-11 20:33:20', '2025-06-11 20:33:20'),
(29, 48, 'Dermatitis por pulgas', 'Lesiones cutáneas por infestación. Tratamiento antipulgas ya iniciado', '2025-06-05', '2025-06-11 20:34:00', '2025-06-11 20:34:00'),
(30, 46, 'Estreñimiento felino', 'Dificultad para defecar. Recomendado aumentar fibra y agua en la dieta', '2025-06-06', '2025-06-11 20:34:41', '2025-06-11 20:34:41'),
(31, 45, 'Obesidad', 'Sobrepeso detectado. Se sugiere dieta controlada y mayor ejercicio', '2025-06-07', '2025-06-11 20:35:34', '2025-06-11 20:35:34'),
(32, 44, 'Cistitis', 'Inflamación de la vejiga. Posible infección urinaria, tratamiento antibiótico iniciado', '2025-06-08', '2025-06-11 20:36:08', '2025-06-11 20:36:08'),
(33, 48, 'Luxación patelar', 'Rótula fuera de lugar en ciertas posturas. Se evalúa tratamiento quirúrgico', '2025-06-09', '2025-06-11 20:37:30', '2025-06-11 20:37:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medicos`
--

CREATE TABLE `historial_medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `vacuna_id` bigint(20) UNSIGNED DEFAULT NULL,
  `desparasitacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tratamiento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `diagnostico_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_medicos`
--

INSERT INTO `historial_medicos` (`id`, `mascota_id`, `vacuna_id`, `desparasitacion_id`, `tratamiento_id`, `diagnostico_id`, `tipo`, `descripcion`, `fecha`, `created_at`, `updated_at`) VALUES
(162, 41, NULL, NULL, 34, NULL, 'Tratamiento', 'Tratamiento: Amoxicilina', '2025-06-01', '2025-06-11 16:04:48', '2025-06-11 16:04:48'),
(163, 42, NULL, NULL, 35, NULL, 'Tratamiento', 'Tratamiento: Vitaminas B12', '2025-06-05', '2025-06-11 16:08:09', '2025-06-11 16:08:09'),
(164, 43, NULL, NULL, 36, NULL, 'Tratamiento', 'Tratamiento: Meloxicam', '2025-06-02', '2025-06-11 16:12:06', '2025-06-11 16:12:06'),
(165, 43, NULL, NULL, 37, NULL, 'Tratamiento', 'Tratamiento: Electrolitos orales', '2025-06-08', '2025-06-11 16:13:59', '2025-06-11 16:13:59'),
(166, 44, NULL, NULL, 38, NULL, 'Tratamiento', 'Tratamiento: Prednisona', '2025-06-06', '2025-06-11 16:15:35', '2025-06-11 16:15:35'),
(167, 45, NULL, NULL, 39, NULL, 'Tratamiento', 'Tratamiento: Probióticos', '2025-06-01', '2025-06-11 16:16:48', '2025-06-11 16:16:48'),
(168, 46, NULL, NULL, 40, NULL, 'Tratamiento', 'Tratamiento: Suplemento Articular', '2025-06-09', '2025-06-11 16:17:51', '2025-06-11 16:17:51'),
(169, 47, NULL, NULL, 41, NULL, 'Tratamiento', 'Tratamiento: Gotas óticas Otomax', '2025-06-10', '2025-06-11 16:19:01', '2025-06-11 16:19:01'),
(170, 51, NULL, NULL, 42, NULL, 'Tratamiento', 'Tratamiento: DigestPlus Conejo', '2025-06-10', '2025-06-11 16:20:05', '2025-06-11 16:20:05'),
(171, 52, NULL, NULL, 43, NULL, 'Tratamiento', 'Tratamiento: Vitaminas A y D Conejo', '2025-06-11', '2025-06-11 16:21:35', '2025-06-11 16:21:35'),
(172, 50, NULL, 32, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Drontal Plus', '2025-05-10', '2025-06-11 16:24:47', '2025-06-11 16:24:47'),
(173, 46, NULL, 33, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Milbemax', '2025-06-01', '2025-06-11 16:26:42', '2025-06-11 16:26:42'),
(174, 45, NULL, 34, NULL, NULL, 'Desparasitación', 'Desparasitación externa: NexGard\'', '2025-06-05', '2025-06-11 16:30:37', '2025-06-11 16:30:37'),
(175, 44, NULL, 35, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Profender', '2025-06-01', '2025-06-11 16:31:44', '2025-06-11 16:31:44'),
(176, 42, NULL, 36, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Simparica', '2025-06-03', '2025-06-11 16:32:31', '2025-06-11 16:32:31'),
(177, 49, NULL, 37, NULL, NULL, 'Desparasitación', 'Desparasitación externa: Bravecto', '2025-05-15', '2025-06-11 16:33:26', '2025-06-11 16:33:26'),
(178, 51, NULL, 38, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Panacur', '2025-06-06', '2025-06-11 16:34:17', '2025-06-11 16:34:17'),
(179, 52, NULL, 39, NULL, NULL, 'Desparasitación', 'Desparasitación externa: Vermectin', '2025-06-07', '2025-06-11 16:35:43', '2025-06-11 16:35:43'),
(181, 48, 48, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Rabia', '2026-05-01', '2025-06-11 18:27:12', '2025-06-11 18:27:12'),
(182, 50, 49, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Triple Felina', '2026-05-05', '2025-06-11 18:29:18', '2025-06-11 18:29:18'),
(183, 50, 50, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Quíntuple', '2026-06-11', '2025-06-11 18:30:31', '2025-06-11 18:30:31'),
(184, 43, 51, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Rabia', '2025-06-13', '2025-06-11 18:31:39', '2025-06-11 18:31:39'),
(185, 46, 52, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Leucemia Felina', '2024-06-20', '2025-06-11 18:33:03', '2025-06-11 18:33:03'),
(186, 45, 53, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Tos de las Perreras', '2025-06-06', '2025-06-11 18:34:08', '2025-06-11 18:34:08'),
(187, 41, 54, NULL, NULL, NULL, 'Vacuna', 'Vacuna aplicada: Moquillo', '2025-06-11', '2025-06-11 18:35:04', '2025-06-11 18:35:04'),
(189, 52, NULL, NULL, NULL, 25, 'Diagnostico', 'Diagnostico: Inflamación del canal auditivo. Se recomienda limpieza diaria y gotas óticas', '2025-06-01', '2025-06-11 20:24:35', '2025-06-11 20:24:35'),
(190, 51, NULL, NULL, NULL, 26, 'Diagnostico', 'Diagnostico: Encías inflamadas, posible acumulación de sarro. Limpieza dental sugerida', '2025-06-02', '2025-06-11 20:28:07', '2025-06-11 20:28:07'),
(191, 50, NULL, NULL, NULL, 27, 'Diagnostico', 'Diagnostico: Dolor y rigidez articular. Se recomienda suplemento articular y chequeo regular', '2025-06-03', '2025-06-11 20:29:02', '2025-06-11 20:29:02'),
(192, 49, NULL, NULL, NULL, 28, 'Diagnostico', 'Diagnostico: Estornudos y secreción nasal. Posible alergia ambiental', '2025-06-04', '2025-06-11 20:33:20', '2025-06-11 20:33:20'),
(193, 48, NULL, NULL, NULL, 29, 'Diagnostico', 'Diagnostico: Lesiones cutáneas por infestación. Tratamiento antipulgas ya iniciado', '2025-06-05', '2025-06-11 20:34:00', '2025-06-11 20:34:00'),
(194, 46, NULL, NULL, NULL, 30, 'Diagnostico', 'Diagnostico: Dificultad para defecar. Recomendado aumentar fibra y agua en la dieta', '2025-06-06', '2025-06-11 20:34:41', '2025-06-11 20:34:41'),
(195, 45, NULL, NULL, NULL, 31, 'Diagnostico', 'Diagnostico: Sobrepeso detectado. Se sugiere dieta controlada y mayor ejercicio', '2025-06-07', '2025-06-11 20:35:34', '2025-06-11 20:35:34'),
(196, 44, NULL, NULL, NULL, 32, 'Diagnostico', 'Diagnostico: Inflamación de la vejiga. Posible infección urinaria, tratamiento antibiótico iniciado', '2025-06-08', '2025-06-11 20:36:08', '2025-06-11 20:36:08'),
(197, 48, NULL, NULL, NULL, 33, 'Diagnostico', 'Diagnostico: Rótula fuera de lugar en ciertas posturas. Se evalúa tratamiento quirúrgico', '2025-06-09', '2025-06-11 20:37:30', '2025-06-11 20:37:30'),
(198, 41, NULL, NULL, 44, NULL, 'Tratamiento', 'Tratamiento: Prueba paseador', '2025-06-12', '2025-06-11 22:09:04', '2025-06-11 22:09:04'),
(199, 46, NULL, NULL, 45, NULL, 'Tratamiento', 'Tratamiento: Prueba paseador', '2025-06-11', '2025-06-12 19:44:17', '2025-06-12 19:44:17'),
(200, 46, NULL, NULL, 46, NULL, 'Tratamiento', 'Tratamiento: Pruebapaseador2', '2025-06-10', '2025-06-12 20:07:06', '2025-06-12 20:07:06'),
(201, 46, NULL, NULL, 47, NULL, 'Tratamiento', 'Tratamiento: Pruebanotificacion', '2025-06-14', '2025-06-12 20:09:20', '2025-06-12 22:44:03'),
(202, 41, NULL, NULL, 48, NULL, 'Tratamiento', 'Tratamiento: pruebanuevanoti', '2025-06-12', '2025-06-12 22:53:52', '2025-06-12 22:53:52'),
(203, 41, NULL, NULL, 49, NULL, 'Tratamiento', 'Tratamiento: Prueba5000', '2025-06-12', '2025-06-12 23:06:42', '2025-06-12 23:06:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raza` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `microchip` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `esterilizado` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `user_id`, `nombre`, `especie`, `raza`, `fecha_nacimiento`, `edad`, `descripcion`, `created_at`, `updated_at`, `sexo`, `microchip`, `color`, `esterilizado`, `foto`) VALUES
(41, 2, 'Firulais', 'Perro', 'Labrador', '2020-05-10', 4, 'Muy juguetón', '2025-06-11 15:29:32', '2025-06-11 15:29:32', 'Macho', '1234567890', 'Marrón', '1', 'qXRowuHduaio5eRfSvYAtHLJpmgSnwHiEJC2XtQq.png'),
(42, 2, 'Misu', 'Gato', 'Siames', '2021-03-15', 3, 'Tranquilo y cariñoso', '2025-06-11 15:31:35', '2025-06-11 15:31:35', 'Hembra', '2345678901', 'Gris', '0', '2bUJv1IcxqPEBkbH3t1Lsl2wcIe2bnTKo1MQN8oh.png'),
(43, 4, 'Rex', 'Perro', 'Pastor Alemán', '2019-07-20', 5, 'Protector y leal', '2025-06-11 15:39:16', '2025-06-11 22:01:48', 'Macho', '3456789012', 'Negro y marrón', '1', 'aCOgQ2ZmgdbIigERweg8ghFbTu2aqc9lJ7i8JkPw.png'),
(44, 4, 'Luna', 'Gato', 'Persa', '2022-01-30', 2, 'Muy dormilona', '2025-06-11 15:42:13', '2025-06-11 15:42:13', 'Hembra', '4567890123', 'Blanco', '0', 'IT2SGuO4rsid8dXOJVwaY6VNEedvWVyznmYqlrWP.png'),
(45, 2, 'Toby', 'Perro', 'Beagle', '2021-08-01', 3, 'Amigable con niños', '2025-06-11 15:43:30', '2025-06-11 15:43:30', 'Macho', '5678901234', 'Tricolor', '1', 'cZ3tIJ4pozeg7MHJmdxZSLv5W2wiJo7b4ETka7gz.png'),
(46, 2, 'Nina', 'Gato', 'Angora', '2020-11-05', 4, 'Muy peluda y mimosa', '2025-06-11 15:45:59', '2025-06-11 15:45:59', 'Hembra', '6789012345', 'Blanco y gris', '0', 'hvVXThkj0oimpc88Wg3Os9cYhNM36tVAVeyEh26x.png'),
(47, 4, 'Rocky', 'Perro', 'Bulldog', '2023-04-15', 1, 'Le encanta jugar con pelotas', '2025-06-11 15:48:47', '2025-06-11 15:48:47', 'Macho', '7890123456', 'Blanco con manchas negras', '1', 'Qfw6pnLJ5WMardFlg3bGPn41Li12BR6URP3SuVvQ.png'),
(48, 2, 'Oreo', 'Perro', 'Border Collie', '2018-08-08', 8, 'Muy inteligente y activo', '2025-06-11 15:51:12', '2025-06-11 15:51:12', 'Macho', '2345678910', '\'Blanco y negro', '1', '7h4EvzXlkJu0tDQj5hCx95nVsL9usr3Md9lGedch.png'),
(49, 2, 'Maggie', 'Perro', 'Cocker', '2018-06-05', 8, 'Muy tierna y obediente', '2025-06-11 15:52:50', '2025-06-11 15:52:50', 'Hembra', '3456789123', 'Marrón claro', '1', 'zggerL4jjaGJ0GDpSKzPiumvYatTQBBXXLhhR7zR.png'),
(50, 4, 'Magore', 'Perro', 'Cocker', '2019-04-12', 1, 'Cariñosa y juguetona', '2025-06-11 15:54:54', '2025-06-11 15:54:54', 'Hembra', '4567891234', 'Blanco y negro', '0', 'DTEUjgFeVekRK5kXurMzEabxKW8FrRvV7Yx3SvGH.png'),
(51, 4, 'Pistache', 'Conejo', 'Enano Holandés', '2022-02-20', 2, 'Conejo curioso y tranquilo', '2025-06-11 15:58:31', '2025-06-11 15:58:31', 'Macho', '5678912345', 'Blanco y gris', '0', 'LE2I2rg7gQv0XUgZ2KFHazNU7ylqtXBCPyRJw0jR.png'),
(52, 2, 'Bunny', 'Conejo', 'Lop', '2020-07-11', 1, 'Orejas largas, muy dócil', '2025-06-11 16:01:34', '2025-06-11 16:01:34', 'Hembra', '6789123456', 'Gris claro', '1', 'CngSV7ZukDGksxijTs7scIwF382TdHhhRkoQKhVb.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota_paseador`
--

CREATE TABLE `mascota_paseador` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `paseador_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_16_075947_add_telefono_and_role_to_users_table', 1),
(5, '2025_05_20_172433_create_user_sessions_table', 1),
(6, '2025_05_20_174030_create_personal_access_tokens_table', 1),
(7, '2025_05_20_183551_add_logout_at_to_user_sessions_table', 1),
(8, '2025_05_21_103814_crear_tabla_mascotas', 1),
(9, '2025_05_22_192149_add_campos_extra_mascotas_table', 2),
(10, '2025_05_22_201904_add_foto_to_mascotas_table', 3),
(11, '2025_05_27_154815_create_historial_medicos_table', 4),
(12, '2025_05_28_134141_create_vacunas_table', 5),
(13, '2025_05_31_171933_create_vacunas_table', 6),
(14, '2025_05_31_172002_create_historial_medicos_table', 7),
(15, '2025_06_01_141300_create_desparasitaciones_table', 8),
(16, '2025_06_01_161045_add_desparasitacion_id_to_historial_medicos_table', 9),
(17, '2025_06_04_190711_update_cascade_on_historial_desparasitacion', 10),
(18, '2025_06_04_191508_create_tratamientos_table', 11),
(19, '2025_06_04_200901_create_diagnosticos_table', 12),
(20, '2025_06_04_201109_add_diagnostico_id_to_historial_medicos_table', 13),
(21, '2025_06_07_133459_create_mascota_paseador_table', 14),
(22, '2025_06_07_145428_create_notificacions_table', 15),
(23, '2025_06_07_163341_add_frecuencia_horas_to_tratamientos_table', 16),
(24, '2025_06_08_142742_update_frecuencia_column_in_tratamientos_table', 17),
(25, '2025_06_08_155414_create_citas_table', 18),
(26, '2025_06_08_155651_create_asignacion_paseadors_table', 19),
(27, '2025_06_08_182816_rename_asignacion_paseadors_table', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE `notificacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `veterinario_id` bigint(20) UNSIGNED NOT NULL,
  `dueno_id` bigint(20) UNSIGNED NOT NULL,
  `paseador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_notificacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `leido` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacions`
--

INSERT INTO `notificacions` (`id`, `mascota_id`, `veterinario_id`, `dueno_id`, `paseador_id`, `tipo`, `mensaje`, `fecha_notificacion`, `leido`, `created_at`, `updated_at`) VALUES
(4005, 48, 1, 2, NULL, 'Cita', 'Nueva cita solicitada para revisar a la mascota el 2025-06-23T04:00', '2025-06-12 23:09:57', 1, '2025-06-12 22:37:23', '2025-06-12 23:09:57'),
(4006, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4007, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4008, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4009, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4010, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4011, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4012, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4013, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4014, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4015, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4016, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4017, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4018, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4019, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4020, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4021, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4022, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4023, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4024, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4025, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4026, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4027, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4028, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4029, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4030, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4031, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4032, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4033, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4034, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4035, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4036, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4037, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4038, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4039, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4040, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4041, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4042, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4043, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4044, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4045, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4046, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4047, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4048, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4049, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4050, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4051, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4052, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4053, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4054, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4055, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4056, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4057, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4058, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4059, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4060, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4061, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4062, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4063, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4064, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4065, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4066, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4067, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4068, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4069, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4070, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4071, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4072, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4073, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4074, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4075, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4076, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4077, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4078, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4079, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4080, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4081, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4082, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4083, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4084, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4085, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4086, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4087, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4088, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4089, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4090, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4091, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4092, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4093, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4094, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4095, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4096, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4097, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4098, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4099, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4100, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4101, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4102, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4103, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4104, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4105, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4106, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4107, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4108, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4109, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4110, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4111, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4112, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4113, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4114, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4115, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4116, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4117, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4118, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4119, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4120, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4121, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4122, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4123, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4124, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4125, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4126, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4127, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4128, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4129, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4130, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4131, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4132, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4133, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4134, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4135, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4136, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4137, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4138, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4139, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4140, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4141, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4142, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4143, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4144, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4145, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4146, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4147, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4148, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4149, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4150, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4151, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4152, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4153, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4154, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4155, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4156, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4157, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4158, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4159, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4160, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4161, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4162, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4163, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4164, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4165, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4166, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4167, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4168, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4169, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4170, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4171, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4172, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4173, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4174, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4175, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4176, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4177, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4178, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4179, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4180, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4181, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4182, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4183, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4184, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4185, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4186, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4187, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4188, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4189, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4190, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4191, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4192, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4193, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4194, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4195, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4196, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4197, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4198, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4199, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4200, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4201, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4202, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4203, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4204, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4205, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4206, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4207, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4208, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4209, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4210, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4211, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4212, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4213, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4214, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4215, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4216, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4217, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4218, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4219, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4220, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4221, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4222, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4223, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4224, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4225, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4226, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4227, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4228, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4229, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4230, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4231, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4232, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4233, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4234, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4235, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4236, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4237, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4238, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4239, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4240, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4241, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4242, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4243, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4244, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:52', '2025-06-12 23:09:57'),
(4245, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4246, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4247, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4248, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4249, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4250, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4251, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4252, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4253, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4254, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4255, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4256, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4257, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4258, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4259, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4260, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4261, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4262, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4263, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4264, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4265, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4266, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4267, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4268, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4269, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4270, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4271, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4272, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4273, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4274, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4275, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4276, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4277, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4278, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4279, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4280, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4281, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4282, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4283, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4284, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4285, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4286, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4287, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4288, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4289, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4290, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4291, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4292, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4293, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4294, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4295, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4296, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4297, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4298, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4299, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4300, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4301, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4302, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4303, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4304, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4305, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57');
INSERT INTO `notificacions` (`id`, `mascota_id`, `veterinario_id`, `dueno_id`, `paseador_id`, `tipo`, `mensaje`, `fecha_notificacion`, `leido`, `created_at`, `updated_at`) VALUES
(4306, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4307, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4308, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4309, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4310, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4311, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4312, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4313, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4314, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4315, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4316, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4317, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4318, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4319, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4320, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4321, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4322, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4323, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4324, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4325, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4326, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4327, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4328, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4329, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4330, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4331, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4332, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4333, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4334, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4335, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4336, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4337, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4338, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4339, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4340, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4341, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4342, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4343, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4344, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4345, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4346, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4347, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4348, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4349, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4350, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4351, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4352, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4353, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4354, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4355, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4356, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4357, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4358, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4359, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4360, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4361, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4362, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4363, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4364, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4365, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4366, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4367, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4368, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4369, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4370, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4371, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4372, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4373, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4374, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4375, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4376, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4377, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4378, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4379, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4380, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4381, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4382, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4383, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4384, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4385, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4386, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4387, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4388, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4389, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4390, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4391, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4392, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4393, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4394, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4395, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4396, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4397, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4398, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4399, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4400, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4401, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4402, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4403, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4404, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4405, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4406, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4407, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4408, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4409, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4410, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4411, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4412, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4413, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4414, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4415, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4416, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4417, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4418, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4419, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4420, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4421, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4422, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4423, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4424, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4425, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4426, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4427, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4428, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4429, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4430, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4431, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4432, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4433, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4434, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4435, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4436, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4437, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4438, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4439, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4440, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4441, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4442, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4443, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4444, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4445, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4446, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4447, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4448, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4449, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4450, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4451, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4452, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4453, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:57', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:57'),
(4454, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4455, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4456, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4457, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4458, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4459, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4460, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4461, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4462, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4463, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4464, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4465, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4466, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4467, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4468, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4469, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4470, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4471, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4472, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4473, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4474, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4475, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4476, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4477, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4478, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4479, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4480, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4481, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4482, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4483, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4484, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4485, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4486, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4487, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4488, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4489, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4490, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4491, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4492, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4493, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4494, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4495, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4496, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4497, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4498, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4499, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4500, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4501, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4502, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4503, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4504, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4505, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4506, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4507, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4508, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4509, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4510, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4511, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4512, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4513, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4514, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4515, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4516, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4517, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4518, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4519, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4520, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4521, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4522, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4523, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4524, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4525, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4526, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4527, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4528, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4529, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4530, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4531, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4532, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4533, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4534, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4535, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4536, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4537, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4538, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4539, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4540, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4541, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4542, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4543, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4544, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4545, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4546, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4547, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4548, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4549, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4550, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4551, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4552, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4553, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4554, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4555, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4556, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4557, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4558, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4559, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4560, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4561, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4562, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4563, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4564, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4565, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4566, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4567, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4568, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4569, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4570, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4571, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4572, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4573, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4574, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4575, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4576, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4577, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4578, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4579, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4580, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4581, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4582, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4583, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4584, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4585, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4586, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4587, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4588, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4589, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4590, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4591, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4592, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4593, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4594, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4595, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4596, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4597, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4598, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4599, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4600, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4601, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4602, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4603, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4604, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4605, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4606, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58');
INSERT INTO `notificacions` (`id`, `mascota_id`, `veterinario_id`, `dueno_id`, `paseador_id`, `tipo`, `mensaje`, `fecha_notificacion`, `leido`, `created_at`, `updated_at`) VALUES
(4607, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4608, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4609, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4610, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4611, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4612, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4613, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4614, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4615, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4616, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4617, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4618, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4619, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4620, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4621, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4622, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4623, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4624, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4625, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4626, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4627, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4628, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4629, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4630, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4631, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4632, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4633, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4634, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4635, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4636, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4637, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4638, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4639, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4640, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4641, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4642, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4643, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4644, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4645, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4646, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4647, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4648, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4649, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4650, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4651, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4652, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4653, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4654, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4655, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4656, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4657, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4658, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4659, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4660, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4661, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4662, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4663, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4664, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4665, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4666, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4667, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4668, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4669, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4670, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4671, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4672, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4673, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4674, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4675, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4676, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4677, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4678, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4679, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4680, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4681, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4682, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4683, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4684, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4685, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4686, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4687, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4688, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4689, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4690, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4691, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4692, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4693, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4694, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4695, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4696, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4697, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4698, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4699, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4700, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4701, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4702, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4703, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4704, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4705, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4706, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4707, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4708, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4709, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4710, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4711, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4712, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4713, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4714, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4715, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4716, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:53', '2025-06-12 23:09:58'),
(4717, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4718, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4719, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4720, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4721, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4722, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4723, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4724, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4725, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4726, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4727, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4728, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4729, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4730, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4731, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4732, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4733, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4734, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4735, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4736, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4737, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4738, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4739, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4740, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4741, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4742, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4743, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4744, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4745, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4746, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4747, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4748, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4749, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4750, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4751, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4752, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4753, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4754, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4755, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4756, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4757, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4758, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4759, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4760, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4761, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4762, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4763, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4764, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar pruebanuevanoti a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 22:53:54', '2025-06-12 23:09:58'),
(4765, 48, 1, 2, NULL, 'Cita', 'Nueva cita solicitada para revisar a la mascota el 2025-06-18T03:00', '2025-06-12 23:09:58', 1, '2025-06-12 23:05:07', '2025-06-12 23:09:58'),
(4766, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4767, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4768, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4769, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4770, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4771, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4772, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4773, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4774, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4775, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4776, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4777, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4778, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4779, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4780, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4781, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4782, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4783, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4784, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4785, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4786, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4787, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4788, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4789, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4790, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4791, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4792, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4793, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4794, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4795, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4796, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4797, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4798, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4799, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4800, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4801, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4802, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4803, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4804, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4805, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4806, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4807, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4808, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4809, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4810, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4811, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4812, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4813, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4814, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4815, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4816, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4817, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4818, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4819, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4820, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4821, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4822, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4823, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4824, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4825, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4826, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4827, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4828, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4829, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4830, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4831, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4832, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4833, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4834, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4835, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4836, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4837, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4838, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4839, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4840, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4841, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4842, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4843, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4844, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4845, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4846, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4847, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4848, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4849, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4850, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4851, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4852, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4853, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4854, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4855, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4856, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4857, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4858, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4859, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4860, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4861, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4862, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4863, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4864, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4865, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4866, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4867, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4868, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4869, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4870, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4871, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4872, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4873, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4874, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4875, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4876, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4877, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4878, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4879, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4880, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4881, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4882, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4883, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4884, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4885, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4886, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4887, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4888, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4889, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4890, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4891, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4892, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4893, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4894, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4895, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4896, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4897, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4898, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4899, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4900, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4901, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4902, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4903, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4904, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4905, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4906, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4907, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4908, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4909, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4910, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4911, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:42', '2025-06-12 23:09:58'),
(4912, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58');
INSERT INTO `notificacions` (`id`, `mascota_id`, `veterinario_id`, `dueno_id`, `paseador_id`, `tipo`, `mensaje`, `fecha_notificacion`, `leido`, `created_at`, `updated_at`) VALUES
(4913, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4914, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4915, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4916, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4917, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4918, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4919, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4920, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4921, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4922, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4923, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4924, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4925, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4926, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4927, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4928, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4929, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4930, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4931, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4932, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4933, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4934, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4935, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4936, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4937, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4938, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4939, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4940, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4941, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4942, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4943, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4944, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4945, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4946, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4947, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4948, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4949, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4950, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4951, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4952, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4953, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4954, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4955, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4956, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4957, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4958, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4959, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4960, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4961, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4962, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4963, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4964, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4965, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4966, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4967, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4968, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4969, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4970, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4971, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4972, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4973, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4974, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4975, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4976, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4977, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4978, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4979, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4980, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4981, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4982, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4983, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4984, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4985, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4986, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4987, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4988, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4989, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4990, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4991, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4992, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4993, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4994, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4995, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4996, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4997, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4998, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(4999, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5000, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5001, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5002, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5003, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5004, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5005, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5006, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5007, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5008, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5009, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5010, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5011, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5012, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5013, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5014, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5015, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5016, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5017, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5018, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5019, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5020, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5021, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5022, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5023, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5024, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5025, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58'),
(5026, 41, 1, 2, NULL, 'Tratamiento', 'Recordatorio: administrar Prueba5000 a Firulais', '2025-06-12 23:09:58', 1, '2025-06-12 23:06:43', '2025-06-12 23:09:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '7a88f5fd4460019292d7fc4b569fc6c9f654945421873f07761fb2f843c05742', '[\"*\"]', '2025-05-21 13:00:37', NULL, '2025-05-21 12:59:44', '2025-05-21 13:00:37'),
(2, 'App\\Models\\User', 1, 'auth_token', '12d15bf835466429eaa88489564033ec0e600b662bf489028b2e03e32388a199', '[\"*\"]', NULL, NULL, '2025-05-21 13:01:50', '2025-05-21 13:01:50'),
(3, 'App\\Models\\User', 3, 'auth_token', '8ac850600fc7a04afc34d44c2f93f870b9212eb6d972b4ee5dc3ee91cfd416ca', '[\"*\"]', '2025-05-21 13:17:11', NULL, '2025-05-21 13:03:32', '2025-05-21 13:17:11'),
(4, 'App\\Models\\User', 1, 'auth_token', '4a3ce7d91d84b9a038d97fb4837d6ea7d33be0042818b85df7cf981c794684e8', '[\"*\"]', '2025-05-21 13:27:08', NULL, '2025-05-21 13:26:44', '2025-05-21 13:27:08'),
(5, 'App\\Models\\User', 1, 'auth_token', '65aa2545b52999b1268df6d9629c5286610ee9c38299c212d22a86b9e2cb67b3', '[\"*\"]', '2025-05-22 16:09:43', NULL, '2025-05-21 13:27:30', '2025-05-22 16:09:43'),
(6, 'App\\Models\\User', 1, 'auth_token', '3f6e0888d5d4748a824d087db24ef89b6cd642234163f46655a009a3054460e2', '[\"*\"]', '2025-05-22 16:04:11', NULL, '2025-05-21 13:43:53', '2025-05-22 16:04:11'),
(9, 'App\\Models\\User', 1, 'auth_token', '534cbce713b916de85efd1070d1574eff0085a5ba8c2d9a488868ee22598b268', '[\"*\"]', '2025-05-22 18:40:57', NULL, '2025-05-22 16:15:18', '2025-05-22 18:40:57'),
(11, 'App\\Models\\User', 4, 'auth_token', '00466a5786d36f1d7d456465e9ef87008a82c9b9e42b2075e82aa1862b923e99', '[\"*\"]', NULL, NULL, '2025-05-25 13:02:20', '2025-05-25 13:02:20'),
(17, 'App\\Models\\User', 2, 'auth_token', 'd8485a0dd84fdaa17029f2b4b35651688ccdf7586b51c4847f39e252c768b966', '[\"*\"]', '2025-05-25 15:54:30', NULL, '2025-05-25 15:54:04', '2025-05-25 15:54:30'),
(18, 'App\\Models\\User', 1, 'auth_token', 'd6f944f8c442ff45ea6b824e729f792dd48eedc09d87656a484a8f4db73adc56', '[\"*\"]', '2025-05-25 17:43:32', NULL, '2025-05-25 17:42:31', '2025-05-25 17:43:32'),
(20, 'App\\Models\\User', 1, 'auth_token', '1f379327a88d08035fa9064914d3c07ff7d4b794a1c77c8ee2018a4b19954854', '[\"*\"]', '2025-05-27 16:24:13', NULL, '2025-05-27 16:00:20', '2025-05-27 16:24:13'),
(21, 'App\\Models\\User', 2, 'auth_token', 'a458807360c62eeb57bfc4481d99f89458193cc2ee7bee10c3dca08f3bea1be6', '[\"*\"]', '2025-05-27 16:48:02', NULL, '2025-05-27 16:47:17', '2025-05-27 16:48:02'),
(22, 'App\\Models\\User', 1, 'auth_token', '8dcd8c6611f43199f18eb6a0e735b06f7b071b0f8f3e875252569005e0235a3a', '[\"*\"]', '2025-05-27 16:52:42', NULL, '2025-05-27 16:50:20', '2025-05-27 16:52:42'),
(23, 'App\\Models\\User', 2, 'auth_token', 'b30054adf2f81d3b29f57e0ba353f8abca712b068c0ec47e72329db556199834', '[\"*\"]', '2025-05-27 16:55:49', NULL, '2025-05-27 16:53:40', '2025-05-27 16:55:49'),
(24, 'App\\Models\\User', 2, 'auth_token', '4ff510377521cf0e431e0291d62c0f973491d1d99ea4ad0dae0c8a4beba19a04', '[\"*\"]', '2025-05-27 16:59:14', NULL, '2025-05-27 16:59:11', '2025-05-27 16:59:14'),
(35, 'App\\Models\\User', 1, 'auth_token', '94669a6fc8ae652dae10b6b0183c99816986b323b32210a9ff7c973f24dd3f62', '[\"*\"]', '2025-05-28 16:12:07', NULL, '2025-05-28 07:29:27', '2025-05-28 16:12:07'),
(41, 'App\\Models\\User', 1, 'auth_token', '64adc6b5b798f73e3e912d81a68a8b3abafcfc1443db49ba0c7637cf399aaabc', '[\"*\"]', '2025-06-01 15:52:01', NULL, '2025-06-01 11:49:15', '2025-06-01 15:52:01'),
(42, 'App\\Models\\User', 1, 'auth_token', '156f8677c8a7ff17bde552a7136692c12e9c0311791f9385630fafd22c31ea94', '[\"*\"]', '2025-06-03 13:01:59', NULL, '2025-06-03 13:01:52', '2025-06-03 13:01:59'),
(44, 'App\\Models\\User', 1, 'auth_token', '461b9bd3ad6919990785ad99ffebd22c3e2ef85e6a8b0c53ec117ea2603979b8', '[\"*\"]', '2025-06-03 14:41:29', NULL, '2025-06-03 14:02:00', '2025-06-03 14:41:29'),
(46, 'App\\Models\\User', 1, 'auth_token', '4dfed1ec2ff7d702c42fc56d9c54255e71f1942f25f6c6c2fa81243b099ed4c2', '[\"*\"]', '2025-06-03 16:00:07', NULL, '2025-06-03 15:58:36', '2025-06-03 16:00:07'),
(47, 'App\\Models\\User', 1, 'auth_token', 'cdde9b7d1109d7712ddc56a459d9182b3b2c516c281d4f7a5297f4d2fe49d4e7', '[\"*\"]', '2025-06-03 16:58:56', NULL, '2025-06-03 16:56:00', '2025-06-03 16:58:56'),
(48, 'App\\Models\\User', 1, 'auth_token', '41545e9a43ee4aa6e6f65b1d6c9083e20cfe9b700395175c89ed30630a20d5a8', '[\"*\"]', '2025-06-04 17:47:14', NULL, '2025-06-04 16:30:52', '2025-06-04 17:47:14'),
(49, 'App\\Models\\User', 1, 'auth_token', 'eb125cfedcec2e0a6061959590f6257eaf08b00ec5068e00e05dc70c0642fcdc', '[\"*\"]', '2025-06-04 18:33:57', NULL, '2025-06-04 17:47:30', '2025-06-04 18:33:57'),
(50, 'App\\Models\\User', 1, 'auth_token', 'c46d12b24cded96c38406c92c17d8a30795b171e9a33a726f42c6e37fe361afa', '[\"*\"]', '2025-06-05 14:50:03', NULL, '2025-06-05 13:55:15', '2025-06-05 14:50:03'),
(51, 'App\\Models\\User', 1, 'auth_token', 'c003f4368f3b60cd417423ed25bb22323c5adb3a93202db3ac95991bd622c549', '[\"*\"]', '2025-06-05 16:30:31', NULL, '2025-06-05 14:51:20', '2025-06-05 16:30:31'),
(53, 'App\\Models\\User', 1, 'auth_token', '7956e3f1085225dbd4e2d33a5d2345f2453b7ce00ecaff349c59a478de87da66', '[\"*\"]', '2025-06-07 11:24:24', NULL, '2025-06-07 11:21:34', '2025-06-07 11:24:24'),
(54, 'App\\Models\\User', 2, 'auth_token', '0f604e5455b81dafd10d04fe8f8dd40aea12df057b44b488e9b33119ab5c73b8', '[\"*\"]', '2025-06-07 11:26:28', NULL, '2025-06-07 11:25:21', '2025-06-07 11:26:28'),
(66, 'App\\Models\\User', 1, 'auth_token', '4df1a6e975578da9f876ca26b4458e9e7a5c6f744cf6bfd3631f63b4526489f0', '[\"*\"]', '2025-06-07 13:39:19', NULL, '2025-06-07 13:20:36', '2025-06-07 13:39:19'),
(68, 'App\\Models\\User', 2, 'auth_token', '6c739e0e08913465571ec0d7ac012c20b540f6c78cc61d13a438f6fb13a4cf3c', '[\"*\"]', '2025-06-07 15:13:50', NULL, '2025-06-07 14:17:32', '2025-06-07 15:13:50'),
(79, 'App\\Models\\User', 2, 'auth_token', 'e166303ffcbc55132f6b56694d8b4d162da839de7eead3a83223fc76e40efba7', '[\"*\"]', '2025-06-08 13:29:19', NULL, '2025-06-08 13:26:56', '2025-06-08 13:29:19'),
(80, 'App\\Models\\User', 1, 'auth_token', '00f60aadc5481a3cfd4f22f3a3465123cc0ac140c4e7eeb7fe5b6b7414f710d9', '[\"*\"]', '2025-06-08 13:38:33', NULL, '2025-06-08 13:38:31', '2025-06-08 13:38:33'),
(91, 'App\\Models\\User', 3, 'auth_token', '8eb3c3a479a52651893f355b2c83c5fb7da40822d647d835c4971aa0b52ed0b1', '[\"*\"]', '2025-06-08 17:03:55', NULL, '2025-06-08 17:03:42', '2025-06-08 17:03:55'),
(103, 'App\\Models\\User', 2, 'auth_token', '038760c2f248b0fcb4848c05afc7e6fe0422475dd7ca207d7b72aecf426eff09', '[\"*\"]', '2025-06-10 10:38:32', NULL, '2025-06-10 10:16:24', '2025-06-10 10:38:32'),
(104, 'App\\Models\\User', 2, 'auth_token', 'b666dc6cf974fef8c99f0abfa4234e39328022be2faf1b6b008a1f6f9ce9b98e', '[\"*\"]', '2025-06-10 10:31:19', NULL, '2025-06-10 10:25:28', '2025-06-10 10:31:19'),
(107, 'App\\Models\\User', 1, 'auth_token', '5e81cad3c282d1b2bf297a2ba2e91b8595f7d97081367271eea5818a9390b413', '[\"*\"]', '2025-06-10 20:39:04', NULL, '2025-06-10 20:35:12', '2025-06-10 20:39:04'),
(120, 'App\\Models\\User', 1, 'auth_token', '871e6609e0926e7a2233c40c36e613d63f41a5138599af7adbb0777c8b396235', '[\"*\"]', '2025-06-12 17:35:36', NULL, '2025-06-12 17:35:27', '2025-06-12 17:35:36'),
(121, 'App\\Models\\User', 2, 'auth_token', '203d806c666c737b08e0d99209bd5f8e177d5e6ac5d57909a36c7b2aa922d386', '[\"*\"]', '2025-06-12 17:35:38', NULL, '2025-06-12 17:35:35', '2025-06-12 17:35:38'),
(122, 'App\\Models\\User', 1, 'auth_token', '32b0db9317972abd69dbce310afe923a9b841570d3eaa3e01915ad005c5b3c5d', '[\"*\"]', '2025-06-12 17:38:37', NULL, '2025-06-12 17:35:59', '2025-06-12 17:38:37'),
(123, 'App\\Models\\User', 1, 'auth_token', '7845fa8fa59e464f6089bd0d3b3e62cca107bda5432fb363889638e468f548a2', '[\"*\"]', '2025-06-12 17:56:53', NULL, '2025-06-12 17:39:47', '2025-06-12 17:56:53'),
(124, 'App\\Models\\User', 1, 'auth_token', 'b80e7945fbeda465ef04d54bdc9a24b780df5cd9beb438ead87a7580dc5c6493', '[\"*\"]', '2025-06-12 19:23:07', NULL, '2025-06-12 19:21:42', '2025-06-12 19:23:07'),
(164, 'App\\Models\\User', 1, 'auth_token', '9418efc3680db558fbe7e42e44cc1ce59b587fda2cb29162fead6e3d5d0b9fc3', '[\"*\"]', '2025-06-12 23:09:59', NULL, '2025-06-12 23:05:32', '2025-06-12 23:09:59'),
(166, 'App\\Models\\User', 2, 'auth_token', '6325194484fb7accd4c768145797dd6393bb1ead370747d7db73a6bb96e818a9', '[\"*\"]', '2025-06-14 10:58:06', NULL, '2025-06-14 10:57:26', '2025-06-14 10:58:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AvivqbLDFCGDz65gHC6k6ICGR8stBv4i88QBjLl4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmpxZ1M1VW5DVHVvNzBrQ3JOSUYySUhQZlV6T0xsZzVBcnJCTnM1cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749552003),
('Ds8Yq4sELdKMo57GVFWXtysQCH8hcoR3oPcF5X1w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXRwSEExY3dGY29SZDhBU3ZMZ3ZGQnVMem9PY1RmMk5BU2NpajVweSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749389982),
('f1O4TzmmI440XqPSw6YKPgzUdgBAtEiRM7KBDDyt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZElFVW81MUdEZzNseUg2YVFLQUNWZUEyYXFyQVNVWktTa3JhbG96aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749749734),
('gAcRR5k1Rwni3bREJL1nzmfcS7X8jEbhVyww0yuY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXFrVEc5NUZEZWF4SlY5MmJYcmJOSHdkNkxSOTdZVU1ialExRlVFMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749708026),
('hbCT330r839kFpWNs6EWVOfVEKcAO8Gu4vhrp1a2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmdWS2R0TDFLREJXbU9wSXZmSUZ3MThzM3BVQjdEQXJuYlRVQkdDcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749898645),
('HRZpkmjCFruKjqEP0kbgb0as1XqkptRlcuhJ8uPg', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2o2Y1p4S0hwa0dmODhUaHNVUGhlcUNFeHpIWm4xVlBrTjd3b1I4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749769531),
('klWGzsNohJc6Dng57kRxn6R4aPl0l3mxJ3aHnvSd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialhDSEtVOVpUME56RUd6QXVjRE5zYmlmSWxaaG9DVlRrUzNRcEtmciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749486832),
('LDFX0woQw1W0OP4tKXNLvjAV1Rph2zgTGFHXWsha', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlFwY1ZSMkVGRGoyS05WVmlIRlZHTlJIMDd4VVJ5WUVqUU9KWmc5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749396743),
('lmP1AjwqQoL8Y1Za7GmmGtDmp8urZq9NEagK30Xu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3ZYTFV3YTB6cmZlbTNZV2tocGNDZjJxdnk4U3V6cFFtTTkxc2VNQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749593609),
('LPjnYSXmaiWlHVSnvUTJ3o6UvjCmYp8H0kr5Rc77', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnc5ZVo4RHpWRHo5MXJlNjFYTk1iejc3YnNSYU9IdGU2cjQ0QXAzOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749469430),
('m8JnVv1PZILSnEJNNhbjLmqflB44EYEdRWjOgGHu', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2FXdnpDQ2dhUGlYaExXT1p2SFhiQ3RMemNYaDZya3ZaM2FwYnlieiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749411865),
('MCPPmoxMl0rbk86JBbOnO31TBwrBijdvzKuVPpOP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzBVVDRWWmZ3aUdMVVk4WTFTd3FTOXlnOHpsZEFmVlhnamNmaDNCVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749640344),
('ocFh0XkrvbDVtIzLZD2RhXOYlDXVNszg6GoOhLO2', NULL, '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3F1Q0ZRdEFzS0xxZ0NLQ2pmRGpBVjRTTkRXdUpZMmFqdDJtNVRKSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749679770),
('PRqec8pPwwkEjsoVKFC07rynjnyvpbv9YoYXGyxJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0txS2xCTGE2bFFZa0FPd0ZFWWpTaTF4Z3JtazV1WlduQ0ZqMzNjViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749402221),
('TBExur6sJ4WhXaBv2aHwhrM62F1gsNbkC4bibKZR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkxVeG1Tem1ERkVISHBmQ1F0SUNzRFRLOGJNcUdLakdsRVRyNnZQeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749550583),
('v6g7limSmeBOHLmMzNJqO0awLiiPyz8UUGGt6x9G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUFDMDZtQ2NUelNEWDNXSUFPSGNGWmJOeEI5MVZkT1dYamQzeFNXSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749550316),
('wA3CIeMD7ntQaSUXei33214RoLj5C45Giw2CbGJu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFJyWVcySXE4OWZuMTJGak1MRTlRZlZYdWtaZlBZZWR0dGhGMWRnNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749486766);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `frecuencia_minutos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id`, `mascota_id`, `nombre`, `fecha_inicio`, `fecha_fin`, `observaciones`, `created_at`, `updated_at`, `frecuencia_minutos`) VALUES
(34, 41, 'Amoxicilina', '2025-06-01', '2025-06-07', 'Antibiótico para infección respiratoria. 2 veces al día', '2025-06-11 16:04:48', '2025-06-11 16:04:48', 720),
(35, 42, 'Vitaminas B12', '2025-06-05', '2025-06-12', 'Suplemento para fortalecer sistema inmune una vez al día', '2025-06-11 16:08:09', '2025-06-11 16:09:34', 1440),
(36, 43, 'Meloxicam', '2025-06-02', '2025-06-09', 'Antiinflamatorio oral para dolor articular dos veces al día', '2025-06-11 16:12:06', '2025-06-11 16:12:06', 720),
(37, 43, 'Electrolitos orales', '2025-06-08', '2025-06-14', 'cada 8h', '2025-06-11 16:13:59', '2025-06-11 16:22:08', 480),
(38, 44, 'Prednisona', '2025-06-06', '2025-06-13', 'cada 12h', '2025-06-11 16:15:35', '2025-06-11 16:15:35', 720),
(39, 45, 'Probióticos', '2025-06-01', '2025-06-08', 'cada 24h', '2025-06-11 16:16:48', '2025-06-11 16:16:48', 1440),
(40, 46, 'Suplemento Articular', '2025-06-09', '2025-06-16', 'cada 24h', '2025-06-11 16:17:51', '2025-06-11 16:17:51', 1440),
(41, 47, 'Gotas óticas Otomax', '2025-06-10', '2025-06-17', 'cada 8h', '2025-06-11 16:19:01', '2025-06-11 16:19:01', 480),
(42, 51, 'DigestPlus Conejo', '2025-06-10', '2025-06-19', 'cada 24h', '2025-06-11 16:20:05', '2025-06-11 16:20:05', 1440),
(43, 52, 'Vitaminas A y D Conejo', '2025-06-11', '2025-06-20', 'cada 24h', '2025-06-11 16:21:35', '2025-06-11 16:21:35', 1440),
(44, 41, 'Prueba paseador', '2025-06-12', '2025-06-20', 'prueba notificacion', '2025-06-11 22:09:04', '2025-06-11 22:09:04', 2880),
(45, 46, 'Prueba paseador', '2025-06-11', NULL, 'Prueba paseador', '2025-06-12 19:44:17', '2025-06-12 19:44:17', 480),
(46, 46, 'Pruebapaseador2', '2025-06-10', '2025-06-23', 'Pruebapaseador2', '2025-06-12 20:07:06', '2025-06-12 20:07:06', 440),
(47, 46, 'Pruebanotificacion', '2025-06-14', '2025-06-15', 'prueba', '2025-06-12 20:09:20', '2025-06-12 22:44:03', 60),
(48, 41, 'pruebanuevanoti', '2025-06-12', NULL, 'pruebanuevanoti', '2025-06-12 22:53:52', '2025-06-12 22:53:52', 40),
(49, 41, 'Prueba5000', '2025-06-12', '2025-06-15', 'Prueba5000', '2025-06-12 23:06:42', '2025-06-12 23:06:42', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'dueno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `telefono`, `role`) VALUES
(1, 'Meliza', 'melisaguerrero17@gmail.com', '2025-05-21 13:01:40', '$2y$12$8j1qkoMZGCYH5SF6vtAYcO/uUJ7VZobUsO0jN6neOLLl1tqVC3h8.', NULL, '2025-05-21 12:58:16', '2025-06-10 16:43:44', '1234567', 'veterinario'),
(2, 'carlos', 'carlosvillacis25@gmail.com', '2025-05-21 12:59:32', '$2y$12$cXQW11zNvpxaPc4tntK3NeTgAKtiVXWYNCUPGxfPl5Xn8Y5OnkRGW', NULL, '2025-05-21 12:58:43', '2025-05-21 12:59:32', '1234568', 'dueno'),
(3, 'Paseador', 'gpt05528@gmail.com', '2025-05-21 13:03:22', '$2y$12$9gp191fR8SJPo9xiJP4Due16us0hdtx3ZzkwHNEvSivif7hT3pyJS', NULL, '2025-05-21 13:03:03', '2025-05-21 13:03:22', '654124234', 'paseador'),
(4, 'Dueña', 'melisiitaa17@gmail.com', '2025-05-25 13:01:58', '$2y$12$J6or16hmOAZtrvYqL0iVh.XFWHOGkzAhptryLPHjqoyacslau9dDW', NULL, '2025-05-25 13:01:20', '2025-05-25 13:01:58', '654124234', 'dueno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `logout_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `action`, `ip_address`, `user_agent`, `logout_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-21 12:59:44', '2025-05-21 12:59:44'),
(2, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-21 13:01:50', '2025-05-21 13:01:50'),
(3, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-21 13:03:32', '2025-05-21 13:03:32'),
(4, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-21 13:26:44', '2025-05-21 13:26:44'),
(5, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-21 13:27:30', '2025-05-21 13:27:30'),
(6, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-21 13:43:53', '2025-05-21 13:43:53'),
(7, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 16:11:04', '2025-05-22 16:08:44', '2025-05-22 16:11:04'),
(8, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 16:13:22', '2025-05-22 16:13:18', '2025-05-22 16:13:22'),
(9, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-22 16:15:18', '2025-05-22 16:15:18'),
(10, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-25 13:54:38', '2025-05-25 09:43:45', '2025-05-25 13:54:38'),
(11, 4, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, '2025-05-25 13:02:20', '2025-05-25 13:02:20'),
(12, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 14:03:18', '2025-05-25 13:54:48', '2025-05-25 14:03:18'),
(13, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 15:12:31', '2025-05-25 14:03:27', '2025-05-25 15:12:31'),
(14, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-25 15:12:40', '2025-05-25 15:12:40'),
(15, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-05-25 15:52:13', '2025-05-25 15:52:00', '2025-05-25 15:52:13'),
(16, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-05-25 15:53:56', '2025-05-25 15:52:21', '2025-05-25 15:53:56'),
(17, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-05-25 17:42:22', '2025-05-25 15:54:04', '2025-05-25 17:42:22'),
(18, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-25 17:42:31', '2025-05-25 17:42:31'),
(19, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-27 13:38:22', '2025-05-25 17:43:59', '2025-05-27 13:38:22'),
(20, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-27 16:00:20', '2025-05-27 16:00:20'),
(21, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-27 16:47:17', '2025-05-27 16:47:17'),
(22, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-27 16:50:20', '2025-05-27 16:50:20'),
(23, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-27 16:53:40', '2025-05-27 16:53:40'),
(24, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-27 16:59:11', '2025-05-27 16:59:11'),
(25, 4, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 04:51:37', '2025-05-27 17:00:10', '2025-05-28 04:51:37'),
(26, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:09:52', '2025-05-28 04:52:37', '2025-05-28 06:09:52'),
(27, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:13:03', '2025-05-28 06:10:03', '2025-05-28 06:13:03'),
(28, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:19:16', '2025-05-28 06:13:11', '2025-05-28 06:19:16'),
(29, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:20:58', '2025-05-28 06:19:24', '2025-05-28 06:20:58'),
(30, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:26:47', '2025-05-28 06:21:11', '2025-05-28 06:26:47'),
(31, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 06:32:21', '2025-05-28 06:27:02', '2025-05-28 06:32:21'),
(32, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 07:19:01', '2025-05-28 06:32:28', '2025-05-28 07:19:01'),
(33, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 07:23:00', '2025-05-28 07:19:10', '2025-05-28 07:23:00'),
(34, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-28 07:29:18', '2025-05-28 07:23:09', '2025-05-28 07:29:18'),
(35, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-05-28 07:29:27', '2025-05-28 07:29:27'),
(36, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-31 12:53:28', '2025-05-28 16:13:24', '2025-05-31 12:53:28'),
(37, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-31 16:49:50', '2025-05-31 12:53:40', '2025-05-31 16:49:50'),
(38, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-31 16:54:02', '2025-05-31 16:50:01', '2025-05-31 16:54:02'),
(39, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-01 10:18:08', '2025-05-31 16:54:11', '2025-06-01 10:18:08'),
(40, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-01 11:49:00', '2025-06-01 10:18:15', '2025-06-01 11:49:00'),
(41, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', NULL, '2025-06-01 11:49:15', '2025-06-01 11:49:15'),
(42, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-03 13:01:52', '2025-06-03 13:01:52'),
(43, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 14:01:46', '2025-06-03 13:51:29', '2025-06-03 14:01:46'),
(44, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-03 14:02:00', '2025-06-03 14:02:00'),
(45, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-06-03 15:58:25', '2025-06-03 15:57:20', '2025-06-03 15:58:25'),
(46, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-03 15:58:36', '2025-06-03 15:58:36'),
(47, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, '2025-06-03 16:56:00', '2025-06-03 16:56:00'),
(48, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-04 16:30:53', '2025-06-04 16:30:53'),
(49, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-04 17:47:30', '2025-06-04 17:47:30'),
(50, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-05 13:55:15', '2025-06-05 13:55:15'),
(51, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-05 14:51:20', '2025-06-05 14:51:20'),
(52, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 11:21:23', '2025-06-06 15:00:29', '2025-06-07 11:21:23'),
(53, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-07 11:21:34', '2025-06-07 11:21:34'),
(54, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-07 11:25:21', '2025-06-07 11:25:21'),
(55, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 11:49:46', '2025-06-07 11:27:30', '2025-06-07 11:49:46'),
(56, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 11:50:27', '2025-06-07 11:49:53', '2025-06-07 11:50:27'),
(57, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 11:52:43', '2025-06-07 11:50:35', '2025-06-07 11:52:43'),
(58, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 11:53:34', '2025-06-07 11:52:51', '2025-06-07 11:53:34'),
(59, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:26:42', '2025-06-07 11:53:42', '2025-06-07 12:26:42'),
(60, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:27:10', '2025-06-07 12:26:59', '2025-06-07 12:27:10'),
(61, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:28:17', '2025-06-07 12:27:17', '2025-06-07 12:28:17'),
(62, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:31:37', '2025-06-07 12:28:32', '2025-06-07 12:31:37'),
(63, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:33:31', '2025-06-07 12:31:47', '2025-06-07 12:33:31'),
(64, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:37:46', '2025-06-07 12:33:50', '2025-06-07 12:37:46'),
(65, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 12:39:38', '2025-06-07 12:37:54', '2025-06-07 12:39:38'),
(66, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-07 13:20:36', '2025-06-07 13:20:36'),
(67, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-07 14:17:23', '2025-06-07 13:57:14', '2025-06-07 14:17:23'),
(68, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-07 14:17:32', '2025-06-07 14:17:32'),
(69, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-08 09:40:26', '2025-06-08 09:17:41', '2025-06-08 09:40:26'),
(70, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 09:42:47', '2025-06-08 09:40:34', '2025-06-08 09:42:47'),
(71, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 09:57:06', '2025-06-08 09:42:56', '2025-06-08 09:57:06'),
(72, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 10:01:34', '2025-06-08 09:57:14', '2025-06-08 10:01:34'),
(73, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 12:12:11', '2025-06-08 10:02:19', '2025-06-08 12:12:11'),
(74, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 12:48:17', '2025-06-08 12:12:20', '2025-06-08 12:48:17'),
(75, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 12:50:18', '2025-06-08 12:48:23', '2025-06-08 12:50:18'),
(76, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-08 13:24:26', '2025-06-08 12:50:25', '2025-06-08 13:24:26'),
(77, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 13:25:08', '2025-06-08 13:24:42', '2025-06-08 13:25:08'),
(78, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 13:26:48', '2025-06-08 13:25:19', '2025-06-08 13:26:48'),
(79, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-08 13:26:56', '2025-06-08 13:26:56'),
(80, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-08 13:38:32', '2025-06-08 13:38:32'),
(81, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-08 13:39:31', '2025-06-08 13:39:25', '2025-06-08 13:39:31'),
(82, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-08 19:31:42', '2025-06-08 13:39:42', '2025-06-08 19:31:42'),
(83, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:23:00', '2025-06-08 14:14:35', '2025-06-08 15:23:00'),
(84, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:42:10', '2025-06-08 15:23:07', '2025-06-08 15:42:10'),
(85, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:42:57', '2025-06-08 15:42:18', '2025-06-08 15:42:57'),
(86, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:53:11', '2025-06-08 15:43:05', '2025-06-08 15:53:11'),
(87, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:53:45', '2025-06-08 15:53:22', '2025-06-08 15:53:45'),
(88, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 15:56:08', '2025-06-08 15:54:01', '2025-06-08 15:56:08'),
(89, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 17:01:29', '2025-06-08 15:56:18', '2025-06-08 17:01:29'),
(90, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 17:03:23', '2025-06-08 17:01:36', '2025-06-08 17:03:23'),
(91, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-08 17:03:42', '2025-06-08 17:03:42'),
(92, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 19:44:35', '2025-06-08 19:44:26', '2025-06-08 19:44:35'),
(93, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 11:43:39', '2025-06-09 10:30:09', '2025-06-09 11:43:39'),
(94, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 16:12:50', '2025-06-09 11:43:51', '2025-06-09 16:12:50'),
(95, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 16:21:22', '2025-06-09 16:13:04', '2025-06-09 16:21:22'),
(96, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 16:28:06', '2025-06-09 16:25:02', '2025-06-09 16:28:06'),
(97, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 16:30:11', '2025-06-09 16:28:17', '2025-06-09 16:30:11'),
(98, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-10 10:08:31', '2025-06-09 16:32:47', '2025-06-10 10:08:31'),
(99, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 10:01:07', '2025-06-09 16:33:54', '2025-06-10 10:01:07'),
(100, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 10:08:07', '2025-06-10 10:02:15', '2025-06-10 10:08:07'),
(101, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-10 10:10:53', '2025-06-10 10:09:28', '2025-06-10 10:10:53'),
(102, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-10 10:11:57', '2025-06-10 10:11:57'),
(103, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-10 10:16:24', '2025-06-10 10:16:24'),
(104, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 10:38:51', '2025-06-10 10:25:28', '2025-06-10 10:38:51'),
(105, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 10:37:02', '2025-06-10 10:34:23', '2025-06-10 10:37:02'),
(106, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 10:57:13', '2025-06-10 10:40:04', '2025-06-10 10:57:13'),
(107, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-10 20:35:12', '2025-06-10 20:35:12'),
(108, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-10 20:57:55', '2025-06-10 20:47:39', '2025-06-10 20:57:55'),
(109, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-10 22:13:21', '2025-06-10 21:44:42', '2025-06-10 22:13:21'),
(110, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-11 21:18:26', '2025-06-10 22:13:30', '2025-06-11 21:18:26'),
(111, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-11 11:12:14', '2025-06-11 11:11:17', '2025-06-11 11:12:14'),
(112, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-11 11:14:50', '2025-06-11 11:12:25', '2025-06-11 11:14:50'),
(113, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-11 21:59:56', '2025-06-11 21:18:34', '2025-06-11 21:59:56'),
(114, 4, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-11 22:05:04', '2025-06-11 22:00:06', '2025-06-11 22:05:04'),
(115, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-11 22:07:15', '2025-06-11 22:05:25', '2025-06-11 22:07:15'),
(116, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-11 22:09:17', '2025-06-11 22:07:24', '2025-06-11 22:09:17'),
(117, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-12 05:59:16', '2025-06-11 22:09:30', '2025-06-12 05:59:16'),
(118, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-12 06:00:19', '2025-06-12 05:59:26', '2025-06-12 06:00:19'),
(119, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-12 06:01:13', '2025-06-12 06:00:27', '2025-06-12 06:01:13'),
(120, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-12 17:35:27', '2025-06-12 17:35:27'),
(121, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', NULL, '2025-06-12 17:35:35', '2025-06-12 17:35:35'),
(122, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-12 17:35:59', '2025-06-12 17:35:59'),
(123, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', NULL, '2025-06-12 17:39:47', '2025-06-12 17:39:47'),
(124, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', NULL, '2025-06-12 19:21:42', '2025-06-12 19:21:42'),
(125, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2025-06-12 19:34:47', '2025-06-12 19:33:00', '2025-06-12 19:34:47'),
(126, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:39:22', '2025-06-12 19:36:41', '2025-06-12 19:39:22'),
(127, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:40:09', '2025-06-12 19:39:34', '2025-06-12 19:40:09'),
(128, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:41:30', '2025-06-12 19:40:17', '2025-06-12 19:41:30'),
(129, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:42:20', '2025-06-12 19:41:42', '2025-06-12 19:42:20'),
(130, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:44:24', '2025-06-12 19:42:33', '2025-06-12 19:44:24'),
(131, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:47:56', '2025-06-12 19:44:36', '2025-06-12 19:47:56'),
(132, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:48:28', '2025-06-12 19:48:12', '2025-06-12 19:48:28'),
(133, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:50:03', '2025-06-12 19:48:36', '2025-06-12 19:50:03'),
(134, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:51:03', '2025-06-12 19:50:25', '2025-06-12 19:51:03'),
(135, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:53:51', '2025-06-12 19:51:13', '2025-06-12 19:53:51'),
(136, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:56:37', '2025-06-12 19:54:00', '2025-06-12 19:56:37'),
(137, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 19:58:01', '2025-06-12 19:56:49', '2025-06-12 19:58:01'),
(138, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 20:01:11', '2025-06-12 19:58:12', '2025-06-12 20:01:11'),
(139, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 20:05:08', '2025-06-12 20:01:23', '2025-06-12 20:05:08'),
(140, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 20:11:18', '2025-06-12 20:05:54', '2025-06-12 20:11:18'),
(141, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 20:11:44', '2025-06-12 20:11:32', '2025-06-12 20:11:44'),
(142, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 20:12:13', '2025-06-12 20:11:53', '2025-06-12 20:12:13'),
(143, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 21:15:06', '2025-06-12 20:16:52', '2025-06-12 21:15:06'),
(144, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 21:15:47', '2025-06-12 21:15:16', '2025-06-12 21:15:47'),
(145, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 21:21:32', '2025-06-12 21:16:10', '2025-06-12 21:21:32'),
(146, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 21:22:20', '2025-06-12 21:21:41', '2025-06-12 21:22:20'),
(147, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:00:08', '2025-06-12 21:22:29', '2025-06-12 22:00:08'),
(148, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:10:01', '2025-06-12 22:00:40', '2025-06-12 22:10:01'),
(149, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:10:29', '2025-06-12 22:10:10', '2025-06-12 22:10:29'),
(150, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:11:33', '2025-06-12 22:10:38', '2025-06-12 22:11:33'),
(151, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:26:48', '2025-06-12 22:11:41', '2025-06-12 22:26:48'),
(152, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:36:47', '2025-06-12 22:27:10', '2025-06-12 22:36:47'),
(153, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:37:31', '2025-06-12 22:37:01', '2025-06-12 22:37:31'),
(154, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:38:03', '2025-06-12 22:37:58', '2025-06-12 22:38:03'),
(155, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:44:19', '2025-06-12 22:38:36', '2025-06-12 22:44:19'),
(156, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:52:41', '2025-06-12 22:44:27', '2025-06-12 22:52:41'),
(157, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:54:19', '2025-06-12 22:52:59', '2025-06-12 22:54:19'),
(158, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:54:48', '2025-06-12 22:54:27', '2025-06-12 22:54:48'),
(159, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:55:26', '2025-06-12 22:54:56', '2025-06-12 22:55:26'),
(160, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:56:47', '2025-06-12 22:55:35', '2025-06-12 22:56:47'),
(161, 3, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 22:57:11', '2025-06-12 22:56:57', '2025-06-12 22:57:11'),
(162, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 23:04:24', '2025-06-12 22:57:34', '2025-06-12 23:04:24'),
(163, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-12 23:05:14', '2025-06-12 23:04:32', '2025-06-12 23:05:14'),
(164, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-12 23:05:32', '2025-06-12 23:05:32'),
(165, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-14 10:57:16', '2025-06-14 10:39:14', '2025-06-14 10:57:16'),
(166, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', NULL, '2025-06-14 10:57:26', '2025-06-14 10:57:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `proxima_dosis` date DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`id`, `mascota_id`, `nombre`, `fecha_aplicacion`, `proxima_dosis`, `lote`, `observaciones`, `created_at`, `updated_at`) VALUES
(48, 48, 'Rabia', '2026-05-01', '2027-05-01', 'L-RA2025-01', 'Vacuna anual obligatoria', '2025-06-11 18:27:12', '2025-06-11 18:27:12'),
(49, 50, 'Triple Felina', '2026-05-05', '2026-07-08', 'L-TF2025-03', 'Protege contra calicivirus,panleucopenia y rinotraqueitis', '2025-06-11 18:29:18', '2025-06-11 18:29:18'),
(50, 50, 'Quíntuple', '2026-06-11', '2027-06-18', 'L-Q2025-02', 'Refuerzo anual completo', '2025-06-11 18:30:31', '2025-06-11 18:30:31'),
(51, 43, 'Rabia', '2025-06-13', '2026-06-18', 'L-RA2025-04', 'Aplicación correcta, sin reacciones adversas', '2025-06-11 18:31:39', '2025-06-11 18:31:39'),
(52, 46, 'Leucemia Felina', '2024-06-20', '2025-06-20', 'L-LF2025-05', 'Dosis para prevención de FELV', '2025-06-11 18:33:03', '2025-06-11 18:33:03'),
(53, 45, 'Tos de las Perreras', '2025-06-06', '2025-12-08', NULL, 'Requiere refuerzo semestral', '2025-06-11 18:34:08', '2025-06-11 18:34:08'),
(54, 41, 'Moquillo', '2025-06-11', '2026-10-21', 'L-MO2025-07', 'Protección esencial para cachorros', '2025-06-11 18:35:04', '2025-06-11 18:35:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones_paseadores`
--
ALTER TABLE `asignaciones_paseadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignacion_paseadors_mascota_id_foreign` (`mascota_id`),
  ADD KEY `asignacion_paseadors_paseador_id_foreign` (`paseador_id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citas_mascota_id_foreign` (`mascota_id`),
  ADD KEY `citas_dueno_id_foreign` (`dueno_id`),
  ADD KEY `citas_veterinario_id_foreign` (`veterinario_id`);

--
-- Indices de la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desparasitaciones_mascota_id_foreign` (`mascota_id`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosticos_mascota_id_foreign` (`mascota_id`);

--
-- Indices de la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_medicos_mascota_id_foreign` (`mascota_id`),
  ADD KEY `historial_medicos_vacuna_id_foreign` (`vacuna_id`),
  ADD KEY `historial_medicos_desparasitacion_id_foreign` (`desparasitacion_id`),
  ADD KEY `historial_medicos_tratamiento_id_foreign` (`tratamiento_id`),
  ADD KEY `historial_medicos_diagnostico_id_foreign` (`diagnostico_id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `mascota_paseador`
--
ALTER TABLE `mascota_paseador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mascota_paseador_mascota_id_paseador_id_unique` (`mascota_id`,`paseador_id`),
  ADD KEY `mascota_paseador_paseador_id_foreign` (`paseador_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacions_mascota_id_foreign` (`mascota_id`),
  ADD KEY `notificacions_veterinario_id_foreign` (`veterinario_id`),
  ADD KEY `notificacions_dueno_id_foreign` (`dueno_id`),
  ADD KEY `notificacions_paseador_id_foreign` (`paseador_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tratamientos_mascota_id_foreign` (`mascota_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_sessions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacunas_mascota_id_foreign` (`mascota_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaciones_paseadores`
--
ALTER TABLE `asignaciones_paseadores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `mascota_paseador`
--
ALTER TABLE `mascota_paseador`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5027;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones_paseadores`
--
ALTER TABLE `asignaciones_paseadores`
  ADD CONSTRAINT `asignacion_paseadors_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignacion_paseadors_paseador_id_foreign` FOREIGN KEY (`paseador_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_dueno_id_foreign` FOREIGN KEY (`dueno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_veterinario_id_foreign` FOREIGN KEY (`veterinario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  ADD CONSTRAINT `desparasitaciones_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `diagnosticos_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  ADD CONSTRAINT `historial_medicos_desparasitacion_id_foreign` FOREIGN KEY (`desparasitacion_id`) REFERENCES `desparasitaciones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_medicos_diagnostico_id_foreign` FOREIGN KEY (`diagnostico_id`) REFERENCES `diagnosticos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_medicos_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_medicos_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_medicos_vacuna_id_foreign` FOREIGN KEY (`vacuna_id`) REFERENCES `vacunas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascota_paseador`
--
ALTER TABLE `mascota_paseador`
  ADD CONSTRAINT `mascota_paseador_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mascota_paseador_paseador_id_foreign` FOREIGN KEY (`paseador_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notificacions`
--
ALTER TABLE `notificacions`
  ADD CONSTRAINT `notificacions_dueno_id_foreign` FOREIGN KEY (`dueno_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notificacions_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notificacions_paseador_id_foreign` FOREIGN KEY (`paseador_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notificacions_veterinario_id_foreign` FOREIGN KEY (`veterinario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD CONSTRAINT `vacunas_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
