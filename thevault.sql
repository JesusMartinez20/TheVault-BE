-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2021 a las 17:41:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `thevault`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletos`
--

CREATE TABLE `boletos` (
  `id` int(11) NOT NULL,
  `asientos` int(11) DEFAULT NULL,
  `id_funcion` int(11) DEFAULT NULL,
  `id_username` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `boletos`
--

INSERT INTO `boletos` (`id`, `asientos`, `id_funcion`, `id_username`) VALUES
(9, 4, 1, 'Luisf'),
(10, 10, 4, 'Luisf'),
(11, 5, 7, 'Luisf'),
(12, 7, 8, 'Luisf');

--
-- Disparadores `boletos`
--
DELIMITER $$
CREATE TRIGGER `trigger_asientosOcupados` AFTER INSERT ON `boletos` FOR EACH ROW UPDATE funciones SET funciones.asientos_ocupados=funciones.asientos_ocupados + NEW.asientos WHERE funciones.id = NEW.id_funcion
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `opinion` varchar(250) DEFAULT NULL,
  `calificacion` tinyint(4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(40) DEFAULT NULL,
  `id_pelicula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `titulo`, `opinion`, `calificacion`, `fecha`, `usuario`, `id_pelicula`) VALUES
(1, 'Que buena película', 'Ufff, es mi pelicula favorita', 5, '2021-06-14', 'Jessusu20', 1),
(2, 'Me encanto', 'Me gusto mucho la musica y el final!', 4, '2021-06-17', 'Jessusu20', 2),
(3, 'Emocionante', 'Vale cada minuto de la película ', 5, '2021-06-17', 'Luisf', 2),
(4, 'De las mejores', 'No puedo esperar para volver a verla', 4, '2021-06-17', 'Luisf', 7),
(5, 'Atrapante', 'Cada escena es una obra maestra', 4, '2021-06-17', 'Luisf', 4),
(6, 'Me encantó', 'Ha sido una montaña de emociones, pero el ritmo me parece lento', 4, '2021-06-17', 'LuisF', 9),
(7, 'Impresionante', 'Es de las mejores películas que he visto, me encanta la trama', 5, '2021-06-17', 'LuisF', 1),
(8, 'Increíble ', 'Definitivamente el manejo de cámara, el guión y la música te atrapan', 4, '2021-06-17', 'Luisf', 10),
(9, 'Lo mejor de Iñarritu', 'Uno de las mejores obras hechas en el cine mexicano ', 5, '2021-06-17', 'Jessusu20', 10),
(10, 'Me sorprendio', 'No me esperaba ver tanta maestría en esta película, me voló la cabeza', 4, '2021-06-17', 'Jessusu20', 5),
(11, 'El inicio de mejor saga', 'Simplemente te deja sin palabras, una historia atrapante', 5, '2021-06-17', 'Jessusu20', 3),
(12, 'Gran película ', 'Muchas veces subestimada, esta película es grandiosa pero con fallos de ritmo', 3, '2021-06-17', 'TheRaven0', 6),
(13, 'Recomendada', 'Una gran película del género que no cae en la mediocridad a pesar de la sobredemanda', 4, '2021-06-17', 'TheRaven0', 8),
(14, 'Un clásico imperdible', 'Ideal para introducirse al cine de Tarantino', 5, '2021-06-17', 'TheRaven0', 1),
(15, 'Obra maestra', 'No sólo marcó el cine de una generación, marcó precedentes de todas las áreas del cine ', 4, '2021-06-17', 'TheRaven0', 2),
(16, 'Magnífica ', 'Es una película que no te deja respirar de principio a fin, me encantan sus secuencias', 5, '2021-06-17', 'TheRaven0', 4),
(17, 'Buena película ', 'Una forma refrescante del cine de época. ', 4, '2021-06-17', 'TheRaven0', 9),
(18, 'Me gustó ', 'La historia es propósito a y atrapan te, los juegos de cámara son sorprendentes', 4, '2021-06-17', 'VioletUmi', 5),
(19, 'Buena', 'Me parece que una saga muy buena pero no perfecta', 3, '2021-06-17', 'VioletUmi', 3),
(20, 'Recomendada', 'Si tienen la oportunidad de verla en una sala de cine, ¡se los recomiendo! ', 4, '2021-06-17', 'VioletUmi', 2),
(21, 'Reflexiva', 'Esta película marcó un precedente para el cine mexicano. Definitivamente muy buena. ', 5, '2021-06-17', 'VioletUmi', 10),
(22, 'Sorpresiva', 'Disfruté mucho de esta película, el sonido y las escenas de esta película valen la pena en una pantalla grande. ', 5, '2021-06-17', 'VioletUmi', 4),
(23, 'Intrigante', 'Me gustó la manera en que esta película te atrapa desde el principio. ', 4, '2021-06-17', 'VioletUmi', 6),
(24, 'Tienen que verla', 'Si no la han visto, denle una oportunidad. No se vana a arrepentir. ', 4, '2021-06-17', 'Jessusu20', 6),
(25, 'Simplemente espectacular', 'Cada plano te deja con el aliento helado. Pudo tener cosas mejores pero en su género se lleva el podio. ', 4, '2021-06-17', 'Jessusu20', 9),
(26, 'Espectacular ', 'Tienen que verla', 4, '2021-06-17', 'Chit0mx', 1),
(27, 'La recomiendo', 'Una historia que te deja reflexionando, es buenísima. ', 5, '2021-06-17', 'Chit0mx', 4),
(28, 'Buena película de guerra', 'Es divertida lo suficiente, pero tiene partes poco interesantes. ', 3, '2021-06-17', 'Chit0mx', 9),
(29, 'Mi favorita ', 'Desde el primer momento se volvió una de mis favoritas ', 5, '2021-06-17', 'Chit0mx', 7),
(30, 'Increíble ', 'Tiene uno de los mejores intros de la historia del cine. No necesito decir más. ', 5, '2021-06-17', 'TheRaven0', 7),
(31, 'Gran trama', 'Te deja al borde del asiento en toda la película. ', 5, '2021-06-17', 'Luisf', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `id` int(11) NOT NULL,
  `horario` datetime DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_pelicula` int(11) DEFAULT NULL,
  `asientos_ocupados` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`id`, `horario`, `id_sala`, `id_pelicula`, `asientos_ocupados`) VALUES
(1, '2021-11-27 14:30:00', 1, 2, 4),
(2, '2021-11-27 17:00:00', 1, 2, 0),
(3, '2021-11-27 18:00:00', 1, 2, 0),
(4, '2021-11-28 00:00:00', 2, 2, 10),
(5, '2021-11-28 13:00:00', 3, 2, 0),
(6, '2021-11-27 16:45:00', 3, 4, 0),
(7, '2021-11-27 17:30:00', 1, 4, 5),
(8, '2021-11-27 20:30:00', 2, 4, 7),
(9, '2021-11-21 08:46:30', 1, 4, 0),
(10, '2021-11-21 08:49:00', 1, 4, 0),
(11, '2021-11-21 08:49:45', 1, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `id` int(11) NOT NULL,
  `rol` enum('Director','Actor','Actriz','Guionista','Productor','Director de fotograf?a') DEFAULT NULL,
  `id_pelicula` int(11) DEFAULT NULL,
  `id_staff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`id`, `rol`, `id_pelicula`, `id_staff`) VALUES
(1, 'Director', 1, 1),
(2, 'Actor', 1, 2),
(3, 'Actor', 1, 3),
(4, 'Actor', 2, 4),
(5, 'Director', 2, 5),
(6, 'Actor', 2, 6),
(7, 'Actor', 3, 7),
(8, 'Actor', 3, 8),
(9, 'Actor', 3, 9),
(10, 'Actor', 4, 10),
(11, 'Actor', 4, 11),
(12, 'Actor', 4, 12),
(13, 'Actor', 5, 13),
(14, 'Actor', 5, 14),
(15, 'Actor', 6, 15),
(16, 'Actor', 6, 16),
(17, 'Actor', 6, 17),
(18, 'Actor', 7, 18),
(19, 'Actor', 7, 19),
(20, 'Actor', 7, 20),
(21, 'Actor', 8, 21),
(22, 'Actor', 8, 22),
(23, 'Actor', 9, 23),
(24, 'Actor', 9, 24),
(25, 'Actor', 9, 25),
(26, 'Actor', 10, 26),
(27, 'Actor', 10, 27),
(28, 'Actor', 10, 28),
(29, 'Actor', 5, 11),
(30, 'Actor', 8, 4),
(31, 'Director', 3, 29),
(32, 'Director', 4, 30),
(33, 'Director', 5, 31),
(34, 'Director', 6, 32),
(35, 'Director', 7, 33),
(36, 'Director', 8, 32),
(37, 'Director', 9, 1),
(38, 'Director', 10, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `duracion` smallint(6) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `imagen` varchar(300) DEFAULT NULL,
  `fecha_estreno` int(11) DEFAULT NULL,
  `en_proyeccion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `duracion`, `pais`, `imagen`, `fecha_estreno`, `en_proyeccion`) VALUES
(1, 'Pulp Fiction', 178, 'Estados Unidos', 'https://cdn.shopify.com/s/files/1/0265/2769/4934/products/pulp_fiction_ver2_xxlg_530x@2x.jpg?v=1579934456', 1994, 0),
(2, 'Taxi Driver', 114, 'Estados Unidos', 'https://images-na.ssl-images-amazon.com/images/I/51TBx9tzHFL._AC_.jpg', 1976, 1),
(3, 'The Godfather', 178, 'Estados Unidos', 'https://movieposters2.com/images/1535670-b.jpg', 1972, 0),
(4, 'Children of Men', 114, 'Reino Unido', 'https://formalshark.co.uk/wp-content/uploads/2017/03/Children-Of-Men-poster-1.jpg', 2006, 1),
(5, 'Boogie Nights', 156, 'Estados Unidos', 'https://images-na.ssl-images-amazon.com/images/I/51d4CX4-KkL._AC_.jpg', 1997, 1),
(6, 'The Departed', 151, 'Estados Unidos', 'https://images-na.ssl-images-amazon.com/images/I/51cjgP9KO7L._AC_.jpg', 2006, 0),
(7, 'Trainspotting', 95, 'Reino Unido', 'https://i.pinimg.com/originals/4a/77/3b/4a773b665f2cd746de7f08fc0cb3b79f.jpg', 1996, 1),
(8, 'Goodfellas', 148, 'Estados Unidos', 'https://images-na.ssl-images-amazon.com/images/I/51rOnIjLqzL._AC_SY450_.jpg', 1990, 0),
(9, 'Inglourious Basterds', 153, 'Estados Unidos', 'https://m.media-amazon.com/images/I/51Ro7n9T2fL._AC_.jpg', 2009, 1),
(10, 'Amores Perros', 155, 'México', 'https://m.media-amazon.com/images/M/MV5BMjQxMWJhMzMtMzllZi00NzMwLTllYjktNTcwZmU4ZmU3NTA0XkEyXkFqcGdeQXVyMTAzMDM4MjM0._V1_.jpg', 2000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

CREATE TABLE `premio` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `academia` varchar(100) DEFAULT NULL,
  `id_pelicula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `premio`
--

INSERT INTO `premio` (`id`, `categoria`, `fecha`, `lugar`, `academia`, `id_pelicula`) VALUES
(1, 'Mejor guion original', '0000-00-00', 'Angeles, California', 'Premios Oscar', 1),
(2, 'Mejor actriz de reparto', '0000-00-00', '', 'Premios BAFTA', 2),
(3, 'Mejor musica original', '0000-00-00', '', 'Premios BAFTA', 2),
(4, 'Palma de Oro', '0000-00-00', '', 'Festival de Cine de Cannes', 2),
(5, 'Mejor pelicula', '0000-00-00', '', 'Premios Oscar', 3),
(6, 'Mejor actor', '0000-00-00', '', 'Premios Oscar', 3),
(7, 'Mejor guion adaptado', '0000-00-00', '', 'Premios Oscar', 3),
(8, 'Mejor pelicula - Drama', '0000-00-00', '', 'Globos de Oro', 3),
(9, 'Mejor director', '0000-00-00', '', 'Globos de Oro', 3),
(10, 'Mejor actor - Drama', '0000-00-00', '', 'Globos de Oro', 3),
(11, 'Mejor guion', '0000-00-00', '', 'Globos de Oro', 3),
(12, 'Mejor banda sonora', '0000-00-00', '', 'Globos de Oro', 3),
(13, 'Mejor musica original', '0000-00-00', '', 'Premios BAFTA', 3),
(14, 'Mejor fotografia', '0000-00-00', '', 'ASC', 4),
(15, 'Mejor actor de reparto', '0000-00-00', '', 'Globos de Oro', 5),
(16, 'Mejor pelicula', '0000-00-00', '', 'Premios Oscar', 6),
(17, 'Mejor director', '0000-00-00', '', 'Premios Oscar', 6),
(18, 'Mejor guion adaptado', '0000-00-00', '', 'Premios Oscar', 6),
(19, 'Mejor montaje', '0000-00-00', '', 'Premios Oscar', 6),
(20, 'Mejor director', '0000-00-00', '', 'Globos de Oro', 6),
(21, 'Mejor guion adaptado', '0000-00-00', '', 'Premios BAFTA', 7),
(22, 'Mejor pelicula', '0000-00-00', '', 'Festival Internacional de Cine de Seattle', 7),
(23, 'Mejor actor de reparto', '0000-00-00', '', 'Premios Oscar', 8),
(24, 'Mejor pelicula', '0000-00-00', '', 'Premios BAFTA', 8),
(25, 'Mejor director', '0000-00-00', '', 'Premios BAFTA', 8),
(26, 'Mejor guion adaptado', '0000-00-00', '', 'Premios BAFTA', 8),
(27, 'Mejor montaje', '0000-00-00', '', 'Premios BAFTA', 8),
(28, 'Mejor diseño de vestuario', '0000-00-00', '', 'Premios BAFTA', 8),
(29, 'Mejor actor de reparto', '0000-00-00', '', 'Premios Oscar', 9),
(30, 'Mejor actor de reparto', '0000-00-00', '', 'Globos de Oro', 9),
(31, 'Mejor actor de reparto', '0000-00-00', '', 'Premios BAFTA', 9),
(32, 'Mejor pelicula en lengua no inglesa', '0000-00-00', '', 'Premios BAFTA', 10),
(33, 'Premio de la crítica', '0000-00-00', '', 'Festival de Cine de Cannes', 10),
(34, 'Mejor pelicula', '0000-00-00', '', 'Festival Internacional de Cine de Tokio', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `capacidad`) VALUES
(1, 40),
(2, 50),
(3, 35),
(4, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nacinalidad` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` char(2) DEFAULT NULL,
  `imagen` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`id`, `nombre`, `nacinalidad`, `fecha_nacimiento`, `sexo`, `imagen`) VALUES
(1, 'Quentin Tarantino', 'Estados Unidos', '1963-03-27', 'M', NULL),
(2, 'Samuel L. Jackson', 'Estados Unidos', '1948-12-21', 'M', 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Samuel_L._Jackson_2019_by_Glenn_Francis.jpg'),
(3, 'John Travolta', 'Estados Unidos', '1954-02-18', 'M', 'https://upload.wikimedia.org/wikipedia/commons/4/4f/John_Travolta_Cannes_2018.jpg'),
(4, 'Robert De Niro', 'Estados Unidos', '1943-08-17', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Robert_De_Niro_Cannes_2016.jpg/220px-Robert_De_Niro_Cannes_2016.jpg'),
(5, 'Martin Scorsese', 'Estados Unidos', '1942-11-17', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Martin_Scorsese_Berlinale_2010_%28cropped%29.jpg/220px-Martin_Scorsese_Berlinale_2010_%28cropped%29.jpg'),
(6, 'Jodie Foster', 'Estados Unidos', '1962-11-19', 'F', 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Jodie_Foster_C%C3%A9sars_2011_2_%28cropped%29.jpg'),
(7, 'Al Pacino', 'Estados Unidos', '1940-04-25', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Al_Pacino.jpg/220px-Al_Pacino.jpg'),
(8, 'Marlon Brando', 'Estados Unidos', '1924-04-03', 'M', 'https://www.biografiasyvidas.com/biografia/b/fotos/brando.jpg'),
(9, 'Diane Keaton', 'Estados Unidos', '1946-01-05', 'F', 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Diane_Keaton_by_Firooz_Zahedi_2.jpg'),
(10, 'Clive Owen', 'Reino Unido', '1964-10-03', 'M', 'https://m.guiadelocio.com/var/guiadelocio.com/storage/images/cine/personajes/clive-owen/3754464-14-esl-ES/clive-owen.jpg'),
(11, 'Julianne Moore', 'Estados Unidos', '1960-12-03', 'F', 'https://upload.wikimedia.org/wikipedia/commons/0/03/Julianne_Moore_Cannes_2018_%28tweaked%29.jpg'),
(12, 'Michael Caine', 'Reino Unido', '1933-03-14', 'M', 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Sir_Michael_Caine%2C_28th_EFA_Awards_2015%2C_Berlin_%28cropped%29.jpg'),
(13, 'Mark Wahlberg', 'Estados Unidos', '1971-06-05', 'M', 'https://es.web.img3.acsta.net/pictures/17/07/12/16/23/035660.jpg'),
(14, 'Philip Seymour Hoffman', 'Estados Unidos', '1967-07-23', 'M', 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Philip_Seymour_Hoffman_2011.jpg'),
(15, 'Leonardo DiCaprio', 'Estados Unidos', '1974-11-11', 'M', 'https://upload.wikimedia.org/wikipedia/commons/4/46/Leonardo_Dicaprio_Cannes_2019.jpg'),
(16, 'Matt Damon', 'Estados Unidos', '1970-10-08', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Damon_cropped.jpg/250px-Damon_cropped.jpg'),
(17, 'Jack Nicholson', 'Estados Unidos', '1937-04-22', 'M', 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Jack_Nicholson.0920.jpg'),
(18, 'Ewan McGregor', 'Reino Unido', '1971-03-31', 'M', 'https://static.wikia.nocookie.net/constantinediaries/images/6/6b/Ewan_McGregor.jpg/revision/latest?cb=20190623172118&path-prefix=es'),
(19, 'Jonny Lee Miller', 'Reino Unido', '1972-11-15', 'M', 'https://static.wikia.nocookie.net/sherlockholmes/images/9/99/JohnnyLeeMiller.jpg/revision/latest?cb=20140117190942&path-prefix=es'),
(20, 'Ewen Bremner', 'Reino Unido', '1970-12-11', 'M', 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/38326/38326_173x231.jpg'),
(21, 'Joe Pesci', 'Estados Unidos', '1943-02-09', 'M', 'https://r1.abcimg.es/resizer/resizer.php?imagen=https%3A%2F%2Fstatic2.abc.es%2Fmedia%2Fpersonajes%2F000%2F013%2F938%2Fjoe-pesci-1.jpg&nuevoancho=690&medio=abc'),
(22, 'Ray Liotta', 'Estados Unidos', '1954-12-18', 'M', 'https://i.pinimg.com/originals/bf/4c/2c/bf4c2c0b2bca71466414453e7e0b4f94.jpg'),
(23, 'Brad Pitt', 'Estados Unidos', '1963-12-18', 'M', 'https://media.fashionnetwork.com/cdn-cgi/image/fit=contain,width=1000,height=1000/m/0d2f/313d/73c9/143a/6875/d46e/d976/bb81/2b1d/b017/b017.jpg'),
(24, 'Christoph Waltz', 'Austria', '1956-08-04', 'M', 'https://static.wikia.nocookie.net/doblaje/images/2/21/Christoph_waltz_-2019.jpg/revision/latest/top-crop/width/360/height/450?cb=20190816041900&path-prefix=es'),
(25, 'Mélanie Laurent', 'Francia', '1983-02-21', 'F', 'https://upload.wikimedia.org/wikipedia/commons/5/5d/M%C3%A9lanie_Laurent_C%C3%A9sar_2016_%28cropped%29.jpg'),
(26, 'Gael García Bernal', 'México', '1978-11-30', 'M', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Gael_Garcia_Bernal_2015.jpg'),
(27, 'Vanessa Bauche', 'México', '1973-02-18', 'F', 'https://upload.wikimedia.org/wikipedia/commons/b/be/MX_MM_CEREMONIA_PEREMIOS_ARIEL_-_35492337790_%28cropped%29.jpg'),
(28, 'Emilio Echevarría', 'México', '1944-07-03', 'M', 'https://images.mubicdn.net/images/cast_member/2357/cache-133949-1613764508/image-w856.jpg?size=800x'),
(29, 'Francis F. Coppola', 'Estados Unidos', '1939-04-07', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Francis_Ford_Coppola_2011_CC.jpg/250px-Francis_Ford_Coppola_2011_CC.jpg'),
(30, 'Alfonso Cuarón', 'México', '1961-11-28', 'M', 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Alfonso_Cuar%C3%B3n%2C_President_jury_Venezia_72_%2825805089406%29_%28cropped%29.jpg'),
(31, 'Paul T. Anderson', 'Estados Unidos', '1970-06-26', 'M', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSc_m6f3ce9f7qKtN3A-y7Ks4X56J4cfoQO0R6cUq24r7oVDHpS'),
(32, 'Martin Scorsese', 'Estados Unidos', '1942-11-17', 'M', 'https://i.pinimg.com/originals/19/79/38/197938b88254d1bda43c8117bc9a4e96.jpg'),
(33, 'Danny Boyle', 'Inglaterra', '1956-10-20', 'M', 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Danny_Boyle_May_2019.jpg'),
(34, 'Alejandro Iñárritu', 'México', '1963-08-15', 'M', 'https://wrmx00.epimg.net/radio/imagenes/2020/05/14/de_pelicula_w/1589477720_331445_1589485512_noticia_normal.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `username` varchar(40) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `contrasena` varchar(40) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `avatar` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `fecha_registro`, `nombre`, `contrasena`, `fecha_nacimiento`, `correo`, `avatar`) VALUES
('admin', '2021-11-17', 'Administrador', '1234', '2021-11-17', 'admin@thevault.com', 2),
('Chit0mx', '2021-06-17', 'Andres Mercado', '1234', '2000-03-17', 'Chit0mx@gmail.com', 2),
('Jessusu20', '2021-06-14', 'Jesus Martinez', '1234', '2000-07-20', 'jesusumarcor20@gmail.com', 2),
('Luisf', '2021-06-17', 'Felipe García', '1234', '2000-03-14', 'luisgarav@gmail.com', 2),
('TheRaven0', '2021-06-17', 'Kevin Medina', '1234', '2000-10-04', 'kevingenial01@gmail.com', 2),
('VioletUmi', '2021-06-17', 'Claudia Cortes', '1234', '2000-05-03', 'violetumi@gmail.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_funcion` (`id_funcion`),
  ADD KEY `id_username` (`id_username`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comentarios_ibfk_1` (`usuario`),
  ADD KEY `comentarios_ibfk_2` (`id_pelicula`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_pelicula` (`id_pelicula`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participacion_ibfk_1` (`id_pelicula`),
  ADD KEY `participacion_ibfk_2` (`id_staff`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `premio`
--
ALTER TABLE `premio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `premio_ibfk_1` (`id_pelicula`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `funciones`
--
ALTER TABLE `funciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `participacion`
--
ALTER TABLE `participacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `premio`
--
ALTER TABLE `premio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD CONSTRAINT `boletos_ibfk_1` FOREIGN KEY (`id_funcion`) REFERENCES `funciones` (`id`),
  ADD CONSTRAINT `boletos_ibfk_2` FOREIGN KEY (`id_username`) REFERENCES `usuario` (`username`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`),
  ADD CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`);

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `participacion_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id`);

--
-- Filtros para la tabla `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `premio_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
