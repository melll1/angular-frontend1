-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2025 a las 20:07:45
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
(1, 12, 'Desparasitante Interna', '2025-06-02', '2025-06-04', 'Interna', 'nada', '2025-06-03 14:47:43', '2025-06-03 14:47:43'),
(2, 12, 'Desparasitante Interna', '2025-05-27', '2025-06-04', 'Interna', 'nada', '2025-06-03 14:59:09', '2025-06-03 14:59:09'),
(3, 13, 'Desparasitante Interna', '2025-06-10', '2025-06-04', 'Interna', 'nada', '2025-06-03 15:12:11', '2025-06-03 15:12:11'),
(4, 12, 'Desparasitante Interna', '2025-05-27', NULL, 'Interna', 'nada', '2025-06-03 15:22:49', '2025-06-03 15:22:49'),
(5, 12, 'Desparasitante Interna', '2025-05-27', '2025-06-04', 'Interna', 'nada', '2025-06-03 15:29:49', '2025-06-03 15:29:49'),
(6, 12, 'Desparasitante Interna', '2025-05-27', '2025-06-04', 'Interna', 'nada', '2025-06-03 15:30:41', '2025-06-03 15:30:41'),
(7, 12, 'Desparasitante Interna', '2025-06-02', NULL, 'Interna', 'nada', '2025-06-03 15:31:26', '2025-06-03 15:31:26'),
(8, 12, 'Desparasitante Externa', '2025-06-03', '2025-06-05', 'Externa', 'nada', '2025-06-03 15:32:25', '2025-06-03 15:32:25'),
(9, 12, 'Desparasitante Externa', '2025-06-03', '2025-06-05', 'Externa', 'nada', '2025-06-03 15:36:05', '2025-06-03 15:36:05'),
(10, 13, 'Desparasitante Interna', '2025-06-10', '2025-06-17', 'Interna', 'NADA', '2025-06-03 15:47:23', '2025-06-03 15:47:23'),
(11, 13, 'Desparasitante Interna', '2025-06-09', '2025-06-17', 'Interna', 'nada', '2025-06-03 16:03:55', '2025-06-03 16:03:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medicos`
--

CREATE TABLE `historial_medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mascota_id` bigint(20) UNSIGNED NOT NULL,
  `vacuna_id` bigint(20) UNSIGNED DEFAULT NULL,
  `desparasitacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_medicos`
--

INSERT INTO `historial_medicos` (`id`, `mascota_id`, `vacuna_id`, `desparasitacion_id`, `tipo`, `descripcion`, `fecha`, `created_at`, `updated_at`) VALUES
(19, 12, 19, NULL, 'Vacuna', 'Vacuna aplicada: Prueba1', '2025-06-01', '2025-06-01 09:34:27', '2025-06-01 09:34:27'),
(20, 13, 20, NULL, 'Vacuna', 'Vacuna aplicada: Prueba3', '2025-06-02', '2025-06-01 09:38:54', '2025-06-01 09:38:54'),
(21, 13, 21, NULL, 'Vacuna', 'Vacuna aplicada: Prueba2', '2025-06-01', '2025-06-01 09:40:29', '2025-06-01 09:40:29'),
(22, 12, 22, NULL, 'Vacuna', 'Vacuna aplicada: Prueba4', '2025-06-01', '2025-06-01 10:02:51', '2025-06-01 10:02:51'),
(24, 12, 23, NULL, 'Vacuna', 'Vacuna aplicada: Prueba8', '2025-05-31', '2025-06-01 14:37:56', '2025-06-01 14:37:56'),
(25, 12, 24, NULL, 'Vacuna', 'Vacuna aplicada: Prueba9', '2025-06-01', '2025-06-01 14:58:01', '2025-06-01 14:58:01'),
(26, 12, 25, NULL, 'Vacuna', 'Vacuna aplicada: Prueba13', '2025-06-03', '2025-06-03 13:52:11', '2025-06-03 13:52:11'),
(27, 12, 26, NULL, 'Vacuna', 'Vacuna aplicada: Prueba14', '2025-06-03', '2025-06-03 14:03:27', '2025-06-03 14:03:27'),
(28, 12, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-06-02', '2025-06-03 14:47:43', '2025-06-03 14:47:43'),
(29, 12, NULL, NULL, 'Desparasitación', 'Interna', '2025-06-02', '2025-06-03 14:47:44', '2025-06-03 14:47:44'),
(30, 12, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-05-27', '2025-06-03 14:59:09', '2025-06-03 14:59:09'),
(31, 12, NULL, NULL, 'Desparasitación', 'Interna', '2025-05-27', '2025-06-03 14:59:10', '2025-06-03 14:59:10'),
(32, 12, 27, NULL, 'Vacuna', 'Vacuna aplicada: Maggie', '2025-06-02', '2025-06-03 15:01:52', '2025-06-03 15:01:52'),
(33, 13, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-06-10', '2025-06-03 15:12:11', '2025-06-03 15:12:11'),
(34, 13, 28, NULL, 'Vacuna', 'Vacuna aplicada: Prueba20', '2025-06-04', '2025-06-03 15:22:13', '2025-06-03 15:22:13'),
(35, 12, NULL, NULL, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-05-27', '2025-06-03 15:22:49', '2025-06-03 15:22:49'),
(36, 12, NULL, NULL, 'Desparasitación', 'Desparasitación externa: Desparasitante Externa', '2025-06-03', '2025-06-03 15:36:05', '2025-06-03 15:36:05'),
(37, 13, NULL, 10, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-06-10', '2025-06-03 15:47:23', '2025-06-03 15:47:23'),
(38, 13, NULL, 11, 'Desparasitación', 'Desparasitación interna: Desparasitante Interna', '2025-06-09', '2025-06-03 16:03:55', '2025-06-03 16:03:55');

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
(12, 2, 'Maggie', 'Perro', 'Cocker', '2025-05-06', 5, NULL, '2025-05-25 12:55:51', '2025-05-31 16:50:28', 'Macho', '798462136543641230', 'marron', '1', 'hMpthH7NKLizha7BfU2ySIg0C4TJMgHpQkEpezmZ.jpg'),
(13, 4, 'Oreo', 'Perro', 'Collie', '2025-05-01', 9, NULL, '2025-05-25 13:03:47', '2025-05-25 13:03:47', 'Macho', '1111111111111', 'negro', '1', NULL),
(15, 4, 'Bolita', 'Perro', 'no se sabe', '2025-04-09', 5, NULL, '2025-05-25 13:52:35', '2025-05-25 13:52:35', 'Hembra', '000000000000000', 'blanco', '1', NULL),
(16, 2, 'Pistache', 'Conejo', 'no se sabe', '2025-05-03', 5, NULL, '2025-05-25 15:53:41', '2025-05-25 17:32:19', 'Macho', '1111eu3grfedds', 'marron', '1', 'Cev25PjQ8I3XDvAizawY7uKPO11jjsgMOqsPAD82.jpg'),
(17, 2, 'Maggore', 'Perro', 'mezcla', '2025-04-15', 5, NULL, '2025-05-25 17:43:32', '2025-05-28 07:28:32', 'Hembra', '7894561', 'blanco y negro', '1', 'TDuKB8JivQ7BOhOE2VHKJaKUSrQk0VihMbbUyuNr.jpg'),
(19, 4, 'Prueba2', 'Perro', 'no se sabe', '2025-05-13', 2, NULL, '2025-05-28 07:32:20', '2025-05-28 07:32:20', 'Hembra', '7894561', 'marron', '1', NULL);

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
(16, '2025_06_01_161045_add_desparasitacion_id_to_historial_medicos_table', 9);

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
(48, 'App\\Models\\User', 1, 'auth_token', 'ab2b37b2ff39686ce627225162f7f945ddc07ad4b19b0c43d01447fa21c7fbf0', '[\"*\"]', '2025-06-03 16:03:55', NULL, '2025-06-03 16:03:25', '2025-06-03 16:03:55');

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
('023jQbDixEAyG25cIqSoVtGojTXcZcSZHJpnKjxs', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVR2ZERsbEZ2bTBmWGtJSXpqVXZHZnd6bkRRSXBCdHA0UFlrMGdoSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748193159),
('6zA3OVhqJKM0GHT6X9nMZNiac2XlQgmRXUVUF6iS', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3BxR3dEd2lweGh3S2dVVHFxYUI0NXQzN3pCTGVUaUt4dDN1WU1SdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747842232),
('9FG6khMFvClcmuR1qZYASu97R37JubFUoLerChb8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVndyMTRXYXpxdzYyeWZrZGtFcW9pbFFlZXRwZzZ4MjByR3pjZk4yWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747841249),
('akPqV4dxT0Kej1wzOe5feIV1JmJXfnCFAkYpn1rH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUNOY256cnB6QmNqckJ2aXdFcjFkbzFGZUQwd3l2N1pRQldBVm9XRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748709264),
('dRL0oh0Q0oFwmF2eq6D0FWkR9Cez9j3b6M8y8qDl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHAzNEZlMll3YzBzZE4yYkFOUGJxbzJ6N2p4U2E0bU9Rem81dDdRTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748173424),
('E76bhfvkYllbwbLm6nJYuKPlCbf7oap9GXpGoc0s', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmlOSENRWlZvMzM2VWRJQUxEU2ZWNEtPTGF4ZDBybElxZmN1OGZyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748202238),
('IdOx0rW7J1zTm9eXi8zsAKOUhqId2SH7fOiQRO36', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXZYc3BUYW96SmxhcnVuY01VTTJjOGV5eFdIazc3OExYRW9pNFR0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748372409),
('j1JjDyQEIWjDvD1LNoQLoFueHtkhWMCypI2TZ7vC', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1NISE5mTHJ5aWJzVjVkdFhlY09sVU9LNTRsVGp4M2ZiM003ekxCVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748785753),
('j4mBgXpiEDyPGzY7yKHSBtFOCAgJk5ZrjRPMyevL', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzdaN2EzZVFtazRmRkdyY2tOYzNHaFN2MElCeUZXZEg0OUJJSmJnRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748717650),
('N6N8ozqy7YhFjiOrbkDYiCvDSNnZONC19wdHh9VX', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0NISno4T2F6UzZBelN5bkY5QnFGd1JWcXVEcUhRSDlxWnZncTNWYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748456003),
('qCxDE552sJ3Xd2Gb4cA0anZj3ifIES48OHkmcOop', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTdiNTdtaGF1VFN2dEJKZnNtcDFOeUtrRlc3SFdqQVlBR3FhaWFBUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748962911),
('qGYC6qTydDPPyYteljDkJDpf2dKlcEzGkVxPMRtx', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWJvRDhIY1lldmtnOWFJd3U5NEpZUzV5eWN6cEU4TTg5WVlhOXFsaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747937717),
('SeEZQqlWNIL1Iujf4I8dWzhliMi9EeqCXWzK0oXk', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3dEVGNtTmE1ejBXWmQwVjBNUndzUG1zaHFucXptY1ZkMGFkczZrSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748424565),
('u82ysQzp7oC6zQ5WTQxCqAm0jZti5hKZeyp7oaVf', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTJIQzlDRzhxc0RxWmhnTkxyOGliWWNYdGlqYkNCM3hTWHROZ3hDdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748973804),
('xeEUFG2PBIu07LuIbJOCxwWTJsRpOs8LJ2f4iWuK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHExRlB4MGlJa1lUTzk4UlFySlZLN3V1b1dLVFRTQXZMd1pzcWw0ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zYW5jdHVtL2NzcmYtY29va2llIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748195644);

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
(1, 'Meliza', 'melisaguerrero17@gmail.com', '2025-05-21 13:01:40', '$2y$12$fx3VOb1474nptDfv5z7LTeF1kXJMKagQzs.6tLUtxfR.P01t68pRq', NULL, '2025-05-21 12:58:16', '2025-05-21 13:01:40', '1234567', 'veterinario'),
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
(44, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-03 15:41:56', '2025-06-03 14:02:00', '2025-06-03 15:41:56'),
(45, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-03 15:42:26', '2025-06-03 15:42:05', '2025-06-03 15:42:26'),
(46, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-03 15:51:21', '2025-06-03 15:42:35', '2025-06-03 15:51:21'),
(47, 2, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-03 16:03:17', '2025-06-03 15:51:30', '2025-06-03 16:03:17'),
(48, 1, 'login', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', NULL, '2025-06-03 16:03:25', '2025-06-03 16:03:25');

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
(19, 12, 'Prueba1', '2025-06-01', '2025-06-03', '1', NULL, '2025-06-01 09:34:27', '2025-06-01 09:35:12'),
(20, 13, 'Prueba3', '2025-06-02', '2025-06-03', '1', 'nada', '2025-06-01 09:38:54', '2025-06-01 09:38:54'),
(21, 13, 'Prueba2', '2025-06-01', '2025-06-02', '1', 'nada', '2025-06-01 09:40:29', '2025-06-01 09:40:29'),
(22, 12, 'Prueba4', '2025-06-01', '2025-06-02', '1', 'NadaPrueba4', '2025-06-01 10:02:51', '2025-06-01 10:03:27'),
(23, 12, 'Prueba8', '2025-05-31', '2025-06-02', '1', 'nada', '2025-06-01 14:37:56', '2025-06-01 14:37:56'),
(24, 12, 'Prueba9', '2025-06-01', '2025-06-03', '1', 'nada', '2025-06-01 14:58:00', '2025-06-01 14:58:00'),
(25, 12, 'Prueba13', '2025-06-03', '2025-06-04', '1', 'nada', '2025-06-03 13:52:11', '2025-06-03 13:52:11'),
(26, 12, 'Prueba14', '2025-06-03', '2025-06-04', '1', 'nada', '2025-06-03 14:03:27', '2025-06-03 14:03:27'),
(27, 12, 'Maggie', '2025-06-02', '2025-06-04', '1', 'nada', '2025-06-03 15:01:52', '2025-06-03 15:01:52'),
(28, 13, 'Prueba20', '2025-06-04', '2025-06-04', '1', 'nada', '2025-06-03 15:22:13', '2025-06-03 15:22:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desparasitaciones_mascota_id_foreign` (`mascota_id`);

--
-- Indices de la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_medicos_mascota_id_foreign` (`mascota_id`),
  ADD KEY `historial_medicos_vacuna_id_foreign` (`vacuna_id`),
  ADD KEY `historial_medicos_desparasitacion_id_foreign` (`desparasitacion_id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `desparasitaciones`
--
ALTER TABLE `desparasitaciones`
  ADD CONSTRAINT `desparasitaciones_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_medicos`
--
ALTER TABLE `historial_medicos`
  ADD CONSTRAINT `historial_medicos_desparasitacion_id_foreign` FOREIGN KEY (`desparasitacion_id`) REFERENCES `desparasitaciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `historial_medicos_mascota_id_foreign` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_medicos_vacuna_id_foreign` FOREIGN KEY (`vacuna_id`) REFERENCES `vacunas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
