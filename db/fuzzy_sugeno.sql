-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 02:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fuzzy_sugeno`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id_diagnosa` int(5) NOT NULL,
  `nama_diagnosa` varchar(100) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosa`
--

INSERT INTO `diagnosa` (`id_diagnosa`, `nama_diagnosa`, `score`) VALUES
(1, 'RINGAN', 10),
(2, 'SEDANG', 60),
(3, 'BERAT', 100);

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(10) NOT NULL,
  `id_data` int(10) NOT NULL,
  `kondisi` varchar(200) NOT NULL,
  `id_diagnosa` int(5) NOT NULL,
  `z_score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_data`, `kondisi`, `id_diagnosa`, `z_score`) VALUES
(218, 391, 'tidak hamil/menyusui', 1, 10),
(219, 392, 'tidak hamil/menyusui', 2, 20),
(220, 393, 'tidak hamil/menyusui', 2, 60),
(221, 394, 'hamil/menyusui', 1, 10),
(222, 395, 'tidak hamil/menyusui', 1, 10),
(223, 396, 'tidak hamil/menyusui', 1, 10),
(224, 397, 'tidak hamil/menyusui', 2, 30),
(225, 398, 'tidak hamil/menyusui', 2, 35),
(226, 399, 'tidak hamil/menyusui', 2, 45.71),
(227, 400, 'tidak hamil/menyusui', 1, 10),
(228, 401, 'tidak hamil/menyusui', 2, 60),
(229, 402, 'tidak hamil/menyusui', 3, 84.44),
(230, 403, 'tidak hamil/menyusui', 2, 60),
(231, 404, 'tidak hamil/menyusui', 2, 35),
(232, 405, 'tidak hamil/menyusui', 1, 10),
(233, 406, 'tidak hamil/menyusui', 1, 10),
(234, 407, 'tidak hamil/menyusui', 2, 30),
(235, 408, 'hamil/menyusui', 2, 20),
(236, 409, 'tidak hamil/menyusui', 2, 40),
(237, 410, 'tidak hamil/menyusui', 2, 40),
(238, 411, 'hamil/menyusui', 1, 10),
(239, 412, 'tidak hamil/menyusui', 1, 10),
(240, 413, 'tidak hamil/menyusui', 2, 35),
(241, 414, 'tidak hamil/menyusui', 2, 60),
(242, 415, 'tidak hamil/menyusui', 1, 10),
(243, 416, 'tidak hamil/menyusui', 2, 60),
(244, 417, 'tidak hamil/menyusui', 3, 80),
(245, 418, 'tidak hamil/menyusui', 2, 35),
(246, 419, 'tidak hamil/menyusui', 1, 10),
(247, 420, 'tidak hamil/menyusui', 2, 35),
(248, 421, 'tidak hamil/menyusui', 1, 10),
(249, 422, 'tidak hamil/menyusui', 2, 35),
(250, 423, 'tidak hamil/menyusui', 1, 10),
(251, 424, 'tidak hamil/menyusui', 1, 10),
(252, 425, 'tidak hamil/menyusui', 1, 10),
(253, 426, 'hamil/menyusui', 2, 60),
(254, 427, 'hamil/menyusui', 2, 60),
(255, 428, 'hamil/menyusui', 2, 35),
(256, 429, 'tidak hamil/menyusui', 2, 60),
(257, 430, 'hamil/menyusui', 1, 10),
(258, 431, 'tidak hamil/menyusui', 1, 10),
(259, 432, 'tidak hamil/menyusui', 3, 68.83),
(260, 433, 'tidak hamil/menyusui', 1, 10),
(261, 434, 'tidak hamil/menyusui', 2, 35),
(262, 435, 'tidak hamil/menyusui', 3, 70),
(263, 436, 'tidak hamil/menyusui', 2, 35),
(264, 437, 'hamil/menyusui', 2, 40),
(265, 438, 'tidak hamil/menyusui', 1, 10),
(266, 439, 'hamil/menyusui', 2, 30),
(267, 440, 'tidak hamil/menyusui', 2, 18.62),
(268, 441, 'hamil/menyusui', 1, 10),
(269, 442, 'tidak hamil/menyusui', 2, 20),
(270, 443, 'tidak hamil/menyusui', 2, 35),
(271, 444, 'tidak hamil/menyusui', 2, 60),
(272, 445, 'tidak hamil/menyusui', 2, 16.76),
(273, 446, 'tidak hamil/menyusui', 2, 60),
(274, 447, 'tidak hamil/menyusui', 2, 35),
(275, 448, 'tidak hamil/menyusui', 1, 10),
(276, 449, 'tidak hamil/menyusui', 2, 60),
(277, 450, 'tidak hamil/menyusui', 2, 60),
(278, 451, 'hamil/menyusui', 1, 10),
(279, 452, 'hamil/menyusui', 2, 60),
(280, 453, 'tidak hamil/menyusui', 2, 60),
(281, 454, 'tidak hamil/menyusui', 2, 60),
(282, 455, 'tidak hamil/menyusui', 3, 70),
(283, 456, 'tidak hamil/menyusui', 2, 46.67),
(284, 457, 'hamil/menyusui', 2, 46.67),
(285, 458, 'tidak hamil/menyusui', 3, 70),
(286, 459, 'tidak hamil/menyusui', 2, 35),
(287, 460, 'tidak hamil/menyusui', 2, 35),
(288, 461, 'tidak hamil/menyusui', 2, 52),
(297, 471, 'tidak hamil/menyusui', 3, 80),
(298, 472, 'hamil/menyusui', 2, 35),
(299, 473, 'tidak hamil/menyusui', 2, 60),
(300, 474, 'tidak hamil/menyusui', 3, 80),
(301, 475, 'tidak hamil/menyusui', 2, 30),
(302, 476, 'tidak hamil/menyusui', 1, 10),
(303, 477, 'tidak hamil/menyusui', 2, 35),
(304, 478, 'tidak hamil/menyusui', 2, 20),
(305, 479, 'tidak hamil/menyusui', 1, 10),
(306, 480, 'tidak hamil/menyusui', 2, 35),
(307, 481, 'tidak hamil/menyusui', 2, 35),
(308, 482, 'tidak hamil/menyusui', 1, 10),
(309, 483, 'tidak hamil/menyusui', 2, 60),
(310, 484, 'tidak hamil/menyusui', 2, 60),
(311, 485, 'tidak hamil/menyusui', 2, 35),
(312, 486, 'tidak hamil/menyusui', 2, 35),
(313, 487, 'tidak hamil/menyusui', 2, 35),
(314, 488, 'tidak hamil/menyusui', 2, 35),
(315, 489, 'hamil/menyusui', 2, 52.45),
(316, 490, 'tidak hamil/menyusui', 3, 100),
(317, 491, 'tidak hamil/menyusui', 1, 10),
(318, 492, 'tidak hamil/menyusui', 3, 74.29),
(319, 493, 'tidak hamil/menyusui', 2, 35),
(320, 494, 'tidak hamil/menyusui', 2, 35),
(321, 495, 'tidak hamil/menyusui', 2, 37.78),
(322, 496, 'hamil/menyusui', 2, 35),
(323, 497, 'tidak hamil/menyusui', 1, 10),
(324, 498, 'tidak hamil/menyusui', 1, 10),
(325, 499, 'tidak hamil/menyusui', 1, 10),
(326, 500, 'tidak hamil/menyusui', 1, 10),
(327, 501, 'tidak hamil/menyusui', 2, 35),
(328, 502, 'tidak hamil/menyusui', 2, 35),
(329, 503, 'tidak hamil/menyusui', 2, 35),
(330, 504, 'tidak hamil/menyusui', 2, 24.71);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_periksa`
--

CREATE TABLE `hasil_periksa` (
  `id_hasil_periksa` int(100) NOT NULL,
  `id_data` int(100) NOT NULL,
  `id_variabel` int(5) NOT NULL,
  `id_keanggotaan` int(10) NOT NULL,
  `mem_func` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil_periksa`
--

INSERT INTO `hasil_periksa` (`id_hasil_periksa`, `id_data`, `id_variabel`, `id_keanggotaan`, `mem_func`) VALUES
(1458, 391, 1, 3, 1),
(1459, 391, 2, 5, 1),
(1460, 391, 3, 7, 1),
(1461, 391, 4, 10, 1),
(1462, 392, 1, 3, 1),
(1463, 392, 2, 5, 1),
(1464, 392, 3, 7, 1),
(1465, 392, 4, 10, 0.8),
(1466, 392, 4, 11, 0.2),
(1467, 393, 1, 3, 1),
(1468, 393, 2, 5, 0.5),
(1469, 393, 2, 6, 0.5),
(1470, 393, 3, 7, 0.944444),
(1471, 393, 3, 8, 0.0555556),
(1472, 393, 4, 11, 1),
(1473, 394, 1, 3, 1),
(1474, 394, 2, 5, 1),
(1475, 394, 3, 7, 1),
(1476, 394, 4, 10, 1),
(1477, 395, 1, 1, 1),
(1478, 395, 2, 4, 0.875),
(1479, 395, 2, 5, 0.125),
(1480, 395, 3, 7, 1),
(1481, 395, 4, 10, 1),
(1482, 396, 1, 3, 1),
(1483, 396, 2, 4, 0.875),
(1484, 396, 2, 5, 0.125),
(1485, 396, 3, 7, 1),
(1486, 396, 4, 10, 1),
(1487, 397, 1, 1, 1),
(1488, 397, 2, 4, 0.875),
(1489, 397, 2, 5, 0.125),
(1490, 397, 3, 7, 1),
(1491, 397, 4, 11, 0.6),
(1492, 397, 4, 12, 0.4),
(1493, 398, 1, 3, 1),
(1494, 398, 2, 5, 0.5),
(1495, 398, 2, 6, 0.5),
(1496, 398, 3, 7, 1),
(1497, 398, 4, 10, 0.8),
(1498, 398, 4, 11, 0.2),
(1499, 399, 1, 3, 1),
(1500, 399, 2, 5, 0.5),
(1501, 399, 2, 6, 0.5),
(1502, 399, 3, 7, 1),
(1503, 399, 4, 10, 0.2),
(1504, 399, 4, 11, 0.8),
(1505, 400, 1, 3, 1),
(1506, 400, 2, 5, 1),
(1507, 400, 3, 7, 1),
(1508, 400, 4, 10, 1),
(1509, 401, 1, 3, 1),
(1510, 401, 2, 6, 1),
(1511, 401, 3, 7, 0.388889),
(1512, 401, 3, 8, 0.611111),
(1513, 401, 4, 10, 0.2),
(1514, 401, 4, 11, 0.8),
(1515, 402, 1, 3, 1),
(1516, 402, 2, 6, 1),
(1517, 402, 3, 7, 0.388889),
(1518, 402, 3, 8, 0.611111),
(1519, 402, 4, 10, 0.2),
(1520, 402, 4, 11, 0.8),
(1521, 403, 1, 3, 1),
(1522, 403, 2, 6, 1),
(1523, 403, 3, 7, 1),
(1524, 403, 4, 10, 1),
(1525, 404, 1, 3, 1),
(1526, 404, 2, 5, 0.5),
(1527, 404, 2, 6, 0.5),
(1528, 404, 3, 7, 1),
(1529, 404, 4, 10, 1),
(1530, 405, 1, 3, 1),
(1531, 405, 2, 5, 1),
(1532, 405, 3, 7, 1),
(1533, 405, 4, 10, 1),
(1534, 406, 1, 2, 1),
(1535, 406, 2, 5, 1),
(1536, 406, 3, 7, 1),
(1537, 406, 4, 10, 1),
(1538, 407, 1, 3, 1),
(1539, 407, 2, 5, 1),
(1540, 407, 3, 7, 1),
(1541, 407, 4, 10, 0.6),
(1542, 407, 4, 11, 0.4),
(1543, 408, 1, 3, 1),
(1544, 408, 2, 5, 1),
(1545, 408, 3, 7, 1),
(1546, 408, 4, 10, 0.8),
(1547, 408, 4, 11, 0.2),
(1548, 409, 1, 3, 1),
(1549, 409, 2, 5, 1),
(1550, 409, 3, 7, 0.777778),
(1551, 409, 3, 8, 0.222222),
(1552, 409, 4, 10, 0.4),
(1553, 409, 4, 11, 0.6),
(1554, 410, 1, 3, 1),
(1555, 410, 2, 5, 1),
(1556, 410, 3, 7, 1),
(1557, 410, 4, 10, 0.4),
(1558, 410, 4, 11, 0.6),
(1559, 411, 1, 3, 1),
(1560, 411, 2, 5, 1),
(1561, 411, 3, 7, 1),
(1562, 411, 4, 10, 1),
(1563, 412, 1, 3, 1),
(1564, 412, 2, 5, 1),
(1565, 412, 3, 7, 1),
(1566, 412, 4, 10, 1),
(1567, 413, 1, 3, 1),
(1568, 413, 2, 5, 0.5),
(1569, 413, 2, 6, 0.5),
(1570, 413, 3, 7, 1),
(1571, 413, 4, 10, 1),
(1572, 414, 1, 3, 1),
(1573, 414, 2, 6, 1),
(1574, 414, 3, 7, 1),
(1575, 414, 4, 10, 1),
(1576, 415, 1, 3, 1),
(1577, 415, 2, 5, 1),
(1578, 415, 3, 7, 1),
(1579, 415, 4, 10, 1),
(1580, 416, 1, 3, 1),
(1581, 416, 2, 6, 1),
(1582, 416, 3, 7, 1),
(1583, 416, 4, 10, 1),
(1584, 417, 1, 3, 1),
(1585, 417, 2, 5, 0.5),
(1586, 417, 2, 6, 0.5),
(1587, 417, 3, 8, 0.882353),
(1588, 417, 3, 9, 0.117647),
(1589, 417, 4, 11, 0.8),
(1590, 417, 4, 12, 0.2),
(1591, 418, 1, 3, 1),
(1592, 418, 2, 5, 0.5),
(1593, 418, 2, 6, 0.5),
(1594, 418, 3, 7, 1),
(1595, 418, 4, 10, 1),
(1596, 419, 1, 3, 1),
(1597, 419, 2, 5, 1),
(1598, 419, 3, 7, 1),
(1599, 419, 4, 10, 1),
(1600, 420, 1, 3, 1),
(1601, 420, 2, 5, 0.5),
(1602, 420, 2, 6, 0.5),
(1603, 420, 3, 7, 1),
(1604, 420, 4, 10, 0.8),
(1605, 420, 4, 11, 0.2),
(1606, 421, 1, 3, 1),
(1607, 421, 2, 5, 1),
(1608, 421, 3, 7, 1),
(1609, 421, 4, 10, 1),
(1610, 422, 1, 3, 1),
(1611, 422, 2, 5, 0.5),
(1612, 422, 2, 6, 0.5),
(1613, 422, 3, 7, 1),
(1614, 422, 4, 10, 1),
(1615, 423, 1, 1, 1),
(1616, 423, 2, 4, 0.875),
(1617, 423, 2, 5, 0.125),
(1618, 423, 3, 7, 1),
(1619, 423, 4, 10, 1),
(1620, 424, 1, 3, 1),
(1621, 424, 2, 4, 0.875),
(1622, 424, 2, 5, 0.125),
(1623, 424, 3, 7, 1),
(1624, 424, 4, 10, 1),
(1625, 425, 1, 3, 1),
(1626, 425, 2, 4, 0.875),
(1627, 425, 2, 5, 0.125),
(1628, 425, 3, 7, 1),
(1629, 425, 4, 10, 1),
(1630, 426, 1, 3, 1),
(1631, 426, 2, 6, 1),
(1632, 426, 3, 7, 1),
(1633, 426, 4, 10, 1),
(1634, 427, 1, 3, 1),
(1635, 427, 2, 6, 1),
(1636, 427, 3, 7, 1),
(1637, 427, 4, 10, 1),
(1638, 428, 1, 3, 1),
(1639, 428, 2, 5, 0.5),
(1640, 428, 2, 6, 0.5),
(1641, 428, 3, 7, 1),
(1642, 428, 4, 10, 1),
(1643, 429, 1, 3, 1),
(1644, 429, 2, 5, 0.5),
(1645, 429, 2, 6, 0.5),
(1646, 429, 3, 7, 1),
(1647, 429, 4, 11, 0.8),
(1648, 429, 4, 12, 0.2),
(1649, 430, 1, 3, 1),
(1650, 430, 2, 5, 1),
(1651, 430, 3, 7, 1),
(1652, 430, 4, 10, 1),
(1653, 431, 1, 2, 1),
(1654, 431, 2, 5, 1),
(1655, 431, 3, 7, 1),
(1656, 431, 4, 10, 1),
(1657, 432, 1, 3, 1),
(1658, 432, 2, 5, 1),
(1659, 432, 3, 8, 0.705882),
(1660, 432, 3, 9, 0.294118),
(1661, 432, 4, 11, 0.8),
(1662, 432, 4, 12, 0.2),
(1663, 433, 1, 3, 1),
(1664, 433, 2, 4, 0.875),
(1665, 433, 2, 5, 0.125),
(1666, 433, 3, 7, 1),
(1667, 433, 4, 10, 1),
(1668, 434, 1, 3, 1),
(1669, 434, 2, 5, 0.5),
(1670, 434, 2, 6, 0.5),
(1671, 434, 3, 7, 1),
(1672, 434, 4, 10, 1),
(1673, 435, 1, 3, 1),
(1674, 435, 2, 5, 0.5),
(1675, 435, 2, 6, 0.5),
(1676, 435, 3, 7, 0.833333),
(1677, 435, 3, 8, 0.166667),
(1678, 435, 4, 11, 0.8),
(1679, 435, 4, 12, 0.2),
(1680, 436, 1, 3, 1),
(1681, 436, 2, 5, 0.5),
(1682, 436, 2, 6, 0.5),
(1683, 436, 3, 7, 1),
(1684, 436, 4, 10, 0.6),
(1685, 436, 4, 11, 0.4),
(1686, 437, 1, 3, 1),
(1687, 437, 2, 5, 1),
(1688, 437, 3, 7, 1),
(1689, 437, 4, 10, 0.4),
(1690, 437, 4, 11, 0.6),
(1691, 438, 1, 3, 1),
(1692, 438, 2, 5, 1),
(1693, 438, 3, 7, 1),
(1694, 438, 4, 10, 1),
(1695, 439, 1, 3, 1),
(1696, 439, 2, 5, 1),
(1697, 439, 3, 7, 0.777778),
(1698, 439, 3, 8, 0.222222),
(1699, 439, 4, 10, 0.6),
(1700, 439, 4, 11, 0.4),
(1701, 440, 1, 3, 1),
(1702, 440, 2, 4, 0.875),
(1703, 440, 2, 5, 0.125),
(1704, 440, 3, 7, 1),
(1705, 440, 4, 10, 0.6),
(1706, 440, 4, 11, 0.4),
(1707, 441, 1, 2, 1),
(1708, 441, 2, 5, 1),
(1709, 441, 3, 7, 1),
(1710, 441, 4, 10, 1),
(1711, 442, 1, 3, 1),
(1712, 442, 2, 5, 1),
(1713, 442, 3, 7, 1),
(1714, 442, 4, 10, 0.8),
(1715, 442, 4, 11, 0.2),
(1716, 443, 1, 3, 1),
(1717, 443, 2, 5, 0.5),
(1718, 443, 2, 6, 0.5),
(1719, 443, 3, 7, 1),
(1720, 443, 4, 10, 1),
(1721, 444, 1, 3, 1),
(1722, 444, 2, 6, 1),
(1723, 444, 3, 7, 1),
(1724, 444, 4, 10, 1),
(1725, 445, 1, 3, 1),
(1726, 445, 2, 4, 0.875),
(1727, 445, 2, 5, 0.125),
(1728, 445, 3, 7, 1),
(1729, 445, 4, 10, 0.8),
(1730, 445, 4, 11, 0.2),
(1731, 446, 1, 3, 1),
(1732, 446, 2, 5, 0.5),
(1733, 446, 2, 6, 0.5),
(1734, 446, 3, 8, 0.294118),
(1735, 446, 3, 9, 0.705882),
(1736, 446, 4, 10, 1),
(1737, 447, 1, 3, 1),
(1738, 447, 2, 5, 0.5),
(1739, 447, 2, 6, 0.5),
(1740, 447, 3, 7, 1),
(1741, 447, 4, 10, 1),
(1742, 448, 1, 3, 1),
(1743, 448, 2, 4, 0.875),
(1744, 448, 2, 5, 0.125),
(1745, 448, 3, 7, 1),
(1746, 448, 4, 10, 1),
(1747, 449, 1, 3, 1),
(1748, 449, 2, 5, 0.5),
(1749, 449, 2, 6, 0.5),
(1750, 449, 3, 7, 1),
(1751, 449, 4, 12, 1),
(1752, 450, 1, 3, 1),
(1753, 450, 2, 6, 1),
(1754, 450, 3, 7, 1),
(1755, 450, 4, 10, 1),
(1756, 451, 1, 3, 1),
(1757, 451, 2, 5, 1),
(1758, 451, 3, 7, 1),
(1759, 451, 4, 10, 1),
(1760, 452, 1, 3, 1),
(1761, 452, 2, 6, 1),
(1762, 452, 3, 7, 1),
(1763, 452, 4, 10, 1),
(1764, 453, 1, 3, 1),
(1765, 453, 2, 5, 0.5),
(1766, 453, 2, 6, 0.5),
(1767, 453, 3, 7, 1),
(1768, 453, 4, 12, 1),
(1769, 454, 1, 3, 1),
(1770, 454, 2, 5, 0.5),
(1771, 454, 2, 6, 0.5),
(1772, 454, 3, 7, 1),
(1773, 454, 4, 11, 0.2),
(1774, 454, 4, 12, 0.8),
(1775, 455, 1, 3, 1),
(1776, 455, 2, 5, 0.5),
(1777, 455, 2, 6, 0.5),
(1778, 455, 3, 7, 0.833333),
(1779, 455, 3, 8, 0.166667),
(1780, 455, 4, 11, 0.2),
(1781, 455, 4, 12, 0.8),
(1782, 456, 1, 3, 1),
(1783, 456, 2, 4, 0.875),
(1784, 456, 2, 5, 0.125),
(1785, 456, 3, 7, 0.722222),
(1786, 456, 3, 8, 0.277778),
(1787, 456, 4, 11, 0.4),
(1788, 456, 4, 12, 0.6),
(1789, 457, 1, 3, 1),
(1790, 457, 2, 4, 0.875),
(1791, 457, 2, 5, 0.125),
(1792, 457, 3, 7, 0.722222),
(1793, 457, 3, 8, 0.277778),
(1794, 457, 4, 11, 0.4),
(1795, 457, 4, 12, 0.6),
(1796, 458, 1, 3, 1),
(1797, 458, 2, 5, 0.5),
(1798, 458, 2, 6, 0.5),
(1799, 458, 3, 7, 0.833333),
(1800, 458, 3, 8, 0.166667),
(1801, 458, 4, 11, 0.8),
(1802, 458, 4, 12, 0.2),
(1803, 459, 1, 3, 1),
(1804, 459, 2, 5, 0.5),
(1805, 459, 2, 6, 0.5),
(1806, 459, 3, 7, 1),
(1807, 459, 4, 10, 0.6),
(1808, 459, 4, 11, 0.4),
(1809, 460, 1, 3, 1),
(1810, 460, 2, 5, 0.5),
(1811, 460, 2, 6, 0.5),
(1812, 460, 3, 7, 1),
(1813, 460, 4, 10, 0.6),
(1814, 460, 4, 11, 0.4),
(1815, 461, 1, 3, 1),
(1816, 461, 2, 4, 0.75),
(1817, 461, 2, 5, 0.25),
(1818, 461, 3, 7, 0.722222),
(1819, 461, 3, 8, 0.277778),
(1820, 461, 4, 11, 0.4),
(1821, 461, 4, 12, 0.6),
(1861, 471, 1, 3, 1),
(1862, 471, 2, 5, 0.5),
(1863, 471, 2, 6, 0.5),
(1864, 471, 3, 7, 1),
(1865, 471, 4, 12, 1),
(1866, 472, 1, 3, 1),
(1867, 472, 2, 5, 0.5),
(1868, 472, 2, 6, 0.5),
(1869, 472, 3, 7, 1),
(1870, 472, 4, 10, 0.8),
(1871, 472, 4, 11, 0.2),
(1872, 473, 1, 3, 1),
(1873, 473, 2, 5, 1),
(1874, 473, 3, 7, 1),
(1875, 473, 4, 12, 1),
(1876, 474, 1, 3, 1),
(1877, 474, 2, 5, 0.5),
(1878, 474, 2, 6, 0.5),
(1879, 474, 3, 7, 1),
(1880, 474, 4, 12, 1),
(1881, 475, 1, 1, 1),
(1882, 475, 2, 5, 1),
(1883, 475, 3, 7, 0.833333),
(1884, 475, 3, 8, 0.166667),
(1885, 475, 4, 10, 0.6),
(1886, 475, 4, 11, 0.4),
(1887, 476, 1, 2, 1),
(1888, 476, 2, 5, 1),
(1889, 476, 3, 7, 1),
(1890, 476, 4, 10, 1),
(1891, 477, 1, 3, 1),
(1892, 477, 2, 5, 0.5),
(1893, 477, 2, 6, 0.5),
(1894, 477, 3, 7, 1),
(1895, 477, 4, 10, 1),
(1896, 478, 1, 3, 1),
(1897, 478, 2, 5, 1),
(1898, 478, 3, 7, 1),
(1899, 478, 4, 10, 0.8),
(1900, 478, 4, 11, 0.2),
(1901, 479, 1, 3, 1),
(1902, 479, 2, 5, 1),
(1903, 479, 3, 7, 1),
(1904, 479, 4, 10, 1),
(1905, 480, 1, 3, 1),
(1906, 480, 2, 5, 0.5),
(1907, 480, 2, 6, 0.5),
(1908, 480, 3, 7, 1),
(1909, 480, 4, 10, 1),
(1910, 481, 1, 3, 1),
(1911, 481, 2, 5, 0.5),
(1912, 481, 2, 6, 0.5),
(1913, 481, 3, 7, 1),
(1914, 481, 4, 10, 1),
(1915, 482, 1, 3, 1),
(1916, 482, 2, 4, 0.75),
(1917, 482, 2, 5, 0.25),
(1918, 482, 3, 7, 1),
(1919, 482, 4, 10, 1),
(1920, 483, 1, 3, 1),
(1921, 483, 2, 6, 1),
(1922, 483, 3, 7, 1),
(1923, 483, 4, 10, 1),
(1924, 484, 1, 3, 1),
(1925, 484, 2, 6, 1),
(1926, 484, 3, 7, 1),
(1927, 484, 4, 10, 1),
(1928, 485, 1, 3, 1),
(1929, 485, 2, 5, 0.5),
(1930, 485, 2, 6, 0.5),
(1931, 485, 3, 7, 1),
(1932, 485, 4, 10, 0.8),
(1933, 485, 4, 11, 0.2),
(1934, 486, 1, 3, 1),
(1935, 486, 2, 5, 0.5),
(1936, 486, 2, 6, 0.5),
(1937, 486, 3, 7, 1),
(1938, 486, 4, 10, 0.8),
(1939, 486, 4, 11, 0.2),
(1940, 487, 1, 3, 1),
(1941, 487, 2, 5, 0.5),
(1942, 487, 2, 6, 0.5),
(1943, 487, 3, 7, 1),
(1944, 487, 4, 10, 0.8),
(1945, 487, 4, 11, 0.2),
(1946, 488, 1, 3, 1),
(1947, 488, 2, 5, 0.5),
(1948, 488, 2, 6, 0.5),
(1949, 488, 3, 7, 1),
(1950, 488, 4, 10, 0.8),
(1951, 488, 4, 11, 0.2),
(1952, 489, 1, 3, 1),
(1953, 489, 2, 5, 0.5),
(1954, 489, 2, 6, 0.5),
(1955, 489, 3, 7, 0.722222),
(1956, 489, 3, 8, 0.277778),
(1957, 489, 4, 10, 0.4),
(1958, 489, 4, 11, 0.6),
(1959, 490, 1, 3, 1),
(1960, 490, 2, 6, 1),
(1961, 490, 3, 7, 0.722222),
(1962, 490, 3, 8, 0.277778),
(1963, 490, 4, 12, 1),
(1964, 491, 1, 2, 1),
(1965, 491, 2, 4, 0.75),
(1966, 491, 2, 5, 0.25),
(1967, 491, 3, 7, 1),
(1968, 491, 4, 10, 1),
(1969, 492, 1, 2, 1),
(1970, 492, 2, 5, 0.5),
(1971, 492, 2, 6, 0.5),
(1972, 492, 3, 7, 0.722222),
(1973, 492, 3, 8, 0.277778),
(1974, 492, 4, 12, 1),
(1975, 493, 1, 3, 1),
(1976, 493, 2, 5, 0.5),
(1977, 493, 2, 6, 0.5),
(1978, 493, 3, 7, 1),
(1979, 493, 4, 10, 1),
(1980, 494, 1, 3, 1),
(1981, 494, 2, 5, 0.5),
(1982, 494, 2, 6, 0.5),
(1983, 494, 3, 7, 1),
(1984, 494, 4, 10, 1),
(1985, 495, 1, 3, 1),
(1986, 495, 2, 5, 0.5),
(1987, 495, 2, 6, 0.5),
(1988, 495, 3, 7, 1),
(1989, 495, 4, 10, 0.4),
(1990, 495, 4, 11, 0.6),
(1991, 496, 1, 3, 1),
(1992, 496, 2, 5, 0.5),
(1993, 496, 2, 6, 0.5),
(1994, 496, 3, 7, 1),
(1995, 496, 4, 10, 0.6),
(1996, 496, 4, 11, 0.4),
(1997, 497, 1, 3, 1),
(1998, 497, 2, 5, 1),
(1999, 497, 3, 7, 1),
(2000, 497, 4, 10, 1),
(2001, 498, 1, 3, 1),
(2002, 498, 2, 5, 1),
(2003, 498, 3, 7, 1),
(2004, 498, 4, 10, 1),
(2005, 499, 1, 3, 1),
(2006, 499, 2, 5, 1),
(2007, 499, 3, 7, 1),
(2008, 499, 4, 10, 1),
(2009, 500, 1, 3, 1),
(2010, 500, 2, 5, 1),
(2011, 500, 3, 7, 1),
(2012, 500, 4, 10, 1),
(2013, 501, 1, 2, 1),
(2014, 501, 2, 5, 0.5),
(2015, 501, 2, 6, 0.5),
(2016, 501, 3, 7, 1),
(2017, 501, 4, 10, 0.8),
(2018, 501, 4, 11, 0.2),
(2019, 502, 1, 2, 1),
(2020, 502, 2, 5, 0.5),
(2021, 502, 2, 6, 0.5),
(2022, 502, 3, 7, 1),
(2023, 502, 4, 10, 0.8),
(2024, 502, 4, 11, 0.2),
(2025, 503, 1, 2, 1),
(2026, 503, 2, 5, 0.5),
(2027, 503, 2, 6, 0.5),
(2028, 503, 3, 7, 1),
(2029, 503, 4, 10, 1),
(2030, 504, 1, 3, 1),
(2031, 504, 2, 4, 0.75),
(2032, 504, 2, 5, 0.25),
(2033, 504, 3, 7, 1),
(2034, 504, 4, 10, 0.6),
(2035, 504, 4, 11, 0.4);

-- --------------------------------------------------------

--
-- Table structure for table `keanggotaan`
--

CREATE TABLE `keanggotaan` (
  `id_keanggotaan` int(10) NOT NULL,
  `id_variabel` int(5) NOT NULL,
  `b_bawah` double NOT NULL,
  `b_tengah` double NOT NULL,
  `b_atas` double NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keanggotaan`
--

INSERT INTO `keanggotaan` (`id_keanggotaan`, `id_variabel`, `b_bawah`, `b_tengah`, `b_atas`, `keterangan`) VALUES
(1, 1, 0.1, 0.3, 0.3, 'KERING'),
(2, 1, 0.1, 0.3, 0.5, 'NORMAL'),
(3, 1, 0.3, 0.5, 0.5, 'BERMINYAK'),
(4, 2, 20, 60, 60, 'KOMEDO RINGAN'),
(5, 2, 20, 60, 100, 'KOMEDO SEDANG'),
(6, 2, 60, 100, 100, 'KOMEDO BERAT'),
(7, 3, 15, 33, 33, 'PUSTUL RINGAN'),
(8, 3, 15, 33, 50, 'PUSTUL SEDANG'),
(9, 3, 33, 50, 50, 'PUSTUL BERAT'),
(10, 4, 0, 5, 5, 'TIDAK NODUL'),
(11, 4, 0, 5, 10, 'NODUL SEDANG'),
(12, 4, 5, 10, 10, 'NODUL BERAT');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_data` int(100) NOT NULL,
  `id_pasien` int(100) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `kondisi` varchar(200) NOT NULL,
  `jenis_kulit` double NOT NULL,
  `komedo` double NOT NULL,
  `pustul` double NOT NULL,
  `nodul` double NOT NULL,
  `valid` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_data`, `id_pasien`, `nama_pasien`, `jenis_kelamin`, `kondisi`, `jenis_kulit`, `komedo`, `pustul`, `nodul`, `valid`) VALUES
(391, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 0, 1),
(392, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 1, 1),
(393, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 16, 5, 1),
(394, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 4, 0, 1),
(395, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.1, 25, 6, 0, 1),
(396, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 4, 0, 1),
(397, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.1, 25, 4, 7, 1),
(398, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 15, 1, 1),
(399, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 10, 4, 1),
(400, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 8, 0, 1),
(401, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 26, 4, 1),
(402, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 26, 4, 1),
(403, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 7, 0, 1),
(404, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 15, 0, 1),
(405, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 6, 0, 1),
(406, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 60, 3, 0, 1),
(407, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 6, 2, 1),
(408, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 7, 1, 1),
(409, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 19, 3, 1),
(410, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 3, 3, 1),
(411, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 4, 0, 1),
(412, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 0, 1),
(413, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 14, 0, 1),
(414, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 5, 0, 1),
(415, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 1, 0, 1),
(416, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 10, 0, 1),
(417, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 35, 6, 1),
(418, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 0, 0, 1),
(419, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 3, 0, 1),
(420, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 12, 1, 1),
(421, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 6, 0, 1),
(422, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 0, 1),
(423, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.1, 25, 1, 0, 1),
(424, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 6, 0, 1),
(425, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 3, 0, 1),
(426, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 110, 2, 0, 1),
(427, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 110, 11, 0, 1),
(428, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 80, 5, 0, 1),
(429, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 4, 6, 1),
(430, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 8, 0, 1),
(431, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 60, 4, 0, 1),
(432, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 38, 6, 1),
(433, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 8, 0, 1),
(434, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 15, 0, 1),
(435, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 18, 6, 1),
(436, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 13, 2, 1),
(437, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 10, 3, 1),
(438, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 3, 0, 1),
(439, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 19, 2, 1),
(440, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 3, 2, 1),
(441, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.3, 60, 3, 0, 1),
(442, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 4, 1, 1),
(443, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 0, 1),
(444, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 2, 0, 1),
(445, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 4, 1, 1),
(446, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 45, 0, 1),
(447, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 4, 0, 1),
(448, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 3, 0, 1),
(449, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 11, 1),
(450, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 11, 0, 1),
(451, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 60, 9, 0, 1),
(452, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 110, 3, 0, 1),
(453, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 11, 1),
(454, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 11, 9, 1),
(455, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 18, 9, 1),
(456, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 25, 20, 8, 1),
(457, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 25, 20, 8, 1),
(458, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 18, 6, 1),
(459, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 2, 1),
(460, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 2, 1),
(461, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 30, 20, 8, 1),
(471, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 8, 20, 1),
(472, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 80, 12, 1, 1),
(473, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 35, 1),
(474, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 3, 35, 1),
(475, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.1, 60, 18, 2, 1),
(476, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 60, 6, 0, 1),
(477, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 4, 0, 1),
(478, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 4, 1, 1),
(479, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 8, 0, 1),
(480, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 4, 0, 1),
(481, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 2, 0, 1),
(482, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 30, 2, 0, 1),
(483, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 1, 0, 1),
(484, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 2, 0, 1),
(485, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 2, 1, 1),
(486, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 2, 1, 1),
(487, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 2, 1, 1),
(488, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 2, 1, 1),
(489, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 80, 20, 3, 1),
(490, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 110, 20, 20, 1),
(491, 11, ' eka triani ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 30, 10, 0, 1),
(492, 11, ' eka triani ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 80, 20, 10, 1),
(493, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 5, 0, 1),
(494, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 10, 0, 1),
(495, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 80, 11, 3, 1),
(496, 5, ' ditya salsabila ', ' perempuan ', 'hamil/menyusui', 0.5, 80, 11, 2, 1),
(497, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 11, 0, 1),
(498, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 0, 1),
(499, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 0, 1),
(500, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 60, 5, 0, 1),
(501, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 80, 2, 1, 1),
(502, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 80, 2, 1, 1),
(503, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.3, 80, 5, 0, 1),
(504, 5, ' ditya salsabila ', ' perempuan ', 'tidak hamil/menyusui', 0.5, 30, 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id_rule` int(100) NOT NULL,
  `jenis_kulit` varchar(50) NOT NULL,
  `komedo` varchar(50) NOT NULL,
  `pustul` varchar(50) NOT NULL,
  `nodul` varchar(50) NOT NULL,
  `tingkat_acne` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id_rule`, `jenis_kulit`, `komedo`, `pustul`, `nodul`, `tingkat_acne`) VALUES
(1, 'KERING', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(2, 'KERING', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(3, 'KERING', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(4, 'KERING', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'TIDAK NODUL', 'RINGAN'),
(5, 'KERING', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'TIDAK NODUL', 'RINGAN'),
(6, 'KERING', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'TIDAK NODUL', 'RINGAN'),
(7, 'KERING', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(8, 'KERING', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(9, 'KERING', 'KOMEDO BERAT', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(10, 'KERING', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL SEDANG', 'RINGAN'),
(11, 'KERING', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(12, 'KERING', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(13, 'KERING', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(14, 'KERING', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(15, 'KERING', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(16, 'KERING', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(17, 'KERING', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(18, 'KERING', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(19, 'KERING', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(20, 'KERING', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(21, 'KERING', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(22, 'KERING', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL BERAT', 'SEDANG'),
(23, 'KERING', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL BERAT', 'SEDANG'),
(24, 'KERING', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL BERAT', 'SEDANG'),
(25, 'KERING', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT'),
(26, 'KERING', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL BERAT', 'BERAT'),
(27, 'KERING', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT'),
(28, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(29, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(30, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'TIDAK NODUL', 'SEDANG'),
(31, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'TIDAK NODUL', 'RINGAN'),
(32, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(33, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(34, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(35, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(36, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(37, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL SEDANG', 'RINGAN'),
(38, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(39, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(40, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(41, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(42, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(43, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(44, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(45, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL SEDANG', 'BERAT'),
(46, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(47, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(48, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(49, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL BERAT', 'SEDANG'),
(50, 'NORMAL', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL BERAT', 'SEDANG'),
(51, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL BERAT', 'SEDANG'),
(52, 'NORMAL', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT'),
(53, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL BERAT', 'BERAT'),
(54, 'NORMAL', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT'),
(55, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(56, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'TIDAK NODUL', 'RINGAN'),
(57, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'TIDAK NODUL', 'SEDANG'),
(58, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(59, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(60, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(61, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(62, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'TIDAK NODUL', 'SEDANG'),
(63, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL BERAT', 'TIDAK NODUL', 'SEDANG'),
(64, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL SEDANG', 'RINGAN'),
(65, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(66, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL SEDANG', 'SEDANG'),
(67, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(68, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(69, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL SEDANG', 'SEDANG'),
(70, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL SEDANG', 'SEDANG'),
(71, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL SEDANG', 'BERAT'),
(72, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL SEDANG', 'BERAT'),
(73, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(74, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL RINGAN', 'NODUL BERAT', 'SEDANG'),
(75, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL RINGAN', 'NODUL BERAT', 'BERAT'),
(76, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL SEDANG', 'NODUL BERAT', 'SEDANG'),
(77, 'BERMINYAK', 'KOMEDO RINGAN', 'PUSTUL BERAT', 'NODUL BERAT', 'SEDANG'),
(78, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL SEDANG', 'NODUL BERAT', 'BERAT'),
(79, 'BERMINYAK', 'KOMEDO SEDANG', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT'),
(80, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL SEDANG', 'NODUL BERAT', 'BERAT'),
(81, 'BERMINYAK', 'KOMEDO BERAT', 'PUSTUL BERAT', 'NODUL BERAT', 'BERAT');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `id_obat` int(100) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `ringan` tinyint(4) NOT NULL,
  `sedang` tinyint(4) NOT NULL,
  `berat` tinyint(4) NOT NULL,
  `terapi` varchar(50) NOT NULL,
  `kondisi` tinyint(4) NOT NULL,
  `keterangan` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`id_obat`, `nama_obat`, `ringan`, `sedang`, `berat`, `terapi`, `kondisi`, `keterangan`) VALUES
(1, 'Retinoic Acid', 1, 1, 0, 'topical', 0, 'Tatalaksana: Dioleskan ke bagian kulit yang bermasalah saja maupun seluruh wajah.'),
(2, 'Salicylic Acid', 1, 0, 0, 'topical', 0, 'Tatalaksana: Dioleskan ke bagian kulit yang bermasalah saja maupun seluruh wajah. Obat dioleskan satu kali pada malam hari sebelum tidur hingga dua kali sehari pada jerawat yang aktif.'),
(3, 'Benzoyl Peroxide', 0, 1, 0, 'topical', 0, 'Tatalaksana: Dioleskan ke bagian kulit yang bermasalah saja maupun seluruh wajah.'),
(4, 'Antibiotik', 0, 1, 1, 'topical', 0, 'Tatalaksana: Antibiotik topikal harus digunakan hanya dalam kombinasi dengan Benzoyl Peroxide dan retinoid selama maksimal 12 minggu, dioleskan satu kali pada malam hari sebelum tidur hingga dua kali sehari pada jerawat yang aktif.'),
(5, 'Doxicyclin', 0, 1, 0, 'oral', 0, 'Tatalaksana: Digunakan pada tipe lesi berupa papul-pustul lebih dominan, dengan dosis 2x100mg per hari. Hentikan pengobatan jika jerawat memburuk atau jika tidak ada perbaikan setelah 6–8 minggu. '),
(6, 'Azitromycin', 0, 0, 1, 'oral', 0, 'Tatalaksana: Pemberian 500 mg pada hari pertama yang diikuti 250 mg/hari selama empat hari berturut-turut setiap bulannya selama tiga bulan. Digunakan pada tipe lesi berupa papul-pustul lebih dominan. Digunakan hanya dalam kombinasi topical diatas.'),
(7, 'Quinolon', 0, 0, 1, 'oral', 0, 'Tatalaksana: Pemberian 500 mg pada hari pertama yang diikuti 250 mg/hari selama empat hari berturut-turut setiap bulannya selama tiga bulan. Disarankan memakai satu jenis antibiotik oral selama pengobatan  untuk mencegah resistensi. '),
(8, 'Eritromycin', 0, 1, 1, 'oral', 1, 'Tatalaksana: 100mg per hari selama 7-14 hari. Hentikan pengobatan jika jerawat memburuk atau jika tidak ada perbaikan setelah maksimal pemakaian 6 minggu.'),
(9, 'Benzoyl Peroxide', 1, 1, 1, 'topical', 1, 'Tatalaksana: Dioleskan ke bagian kulit yang bermasalah saja maupun seluruh wajah. Obat dioleskan satu kali pada malam hari sebelum tidur hingga dua kali sehari pada jerawat yang aktif.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_pasien` int(100) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_pasien`, `nama_pasien`, `username`, `password`, `jenis_kelamin`) VALUES
(4, 'rusmansyah', 'maman', '$2y$10$onqsBsokFR7wPEe6Mx9qxeKC/xL5Suoukeex1pSfrkLWPseHacLzy', 'laki-laki'),
(5, 'ditya salsabila', 'dityas_', '$2y$10$nOWUmSEnXLNypnxU8feHG.17L3Eno35Ycd.yXuf/FtXptYGqKYyd2', 'perempuan'),
(6, 'intan yonsyah', 'intan', '$2y$10$OPUMCPS19DHJSMhW7D8qguzAFUHL5cHR1emT4ePQSu82kmz08zQXa', 'perempuan'),
(7, 'eka triani', 'ekatrn', '$2y$10$wF6mWmVYjOXHFF4j3hEq0eFRt4G9Gokb8Nv2gnaLYH7emJXMyy8lm', 'perempuan'),
(8, 'julian raus', 'julianrausss', '$2y$10$S8IeAM6fPP2vBCA/D/mS8uwmY5zChW2UBqog6ApovZTULriRPnaS.', 'laki-laki'),
(10, 'pretty fujianti', 'pretty', '$2y$10$FHdZs589UsaWJXDF1d2Z1eZjPJsC9KXgTp62S5gtmJM5pkIyBUzR6', 'perempuan'),
(11, 'eka triani', 'ekacans', '$2y$10$7uxrEFJClikK8vU/Pb/x3OtlguBtFHg7mCjzXqUv1BZAImFbAxhOq', 'perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `variabel`
--

CREATE TABLE `variabel` (
  `id_variabel` int(5) NOT NULL,
  `nama_variabel` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kelompok` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variabel`
--

INSERT INTO `variabel` (`id_variabel`, `nama_variabel`, `keterangan`, `kelompok`) VALUES
(1, 'jenis kulit', 'jenis kulit wajah', 1),
(2, 'komedo', 'komedo blackhead dan whitehead', 2),
(3, 'pustul', 'jerawat papula dan pustula', 3),
(4, 'nodul', 'jerawat nodul dengan ukuran 0,5-1 cm', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`),
  ADD KEY `id_diagnosa` (`id_diagnosa`),
  ADD KEY `nama_diagnosa` (`nama_diagnosa`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_data` (`id_data`),
  ADD KEY `tingkat_acne` (`id_diagnosa`),
  ADD KEY `kondisi` (`kondisi`),
  ADD KEY `z_score` (`z_score`);

--
-- Indexes for table `hasil_periksa`
--
ALTER TABLE `hasil_periksa`
  ADD PRIMARY KEY (`id_hasil_periksa`),
  ADD KEY `id_hasil_periksa` (`id_hasil_periksa`,`id_data`,`id_variabel`,`id_keanggotaan`,`mem_func`),
  ADD KEY `id_data` (`id_data`),
  ADD KEY `id_keanggotaan` (`id_keanggotaan`),
  ADD KEY `id_variabel` (`id_variabel`);

--
-- Indexes for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD PRIMARY KEY (`id_keanggotaan`),
  ADD KEY `id_variabel` (`id_variabel`),
  ADD KEY `b_bawah` (`b_bawah`),
  ADD KEY `b_tengah` (`b_tengah`,`b_atas`,`keterangan`),
  ADD KEY `id_keanggotaan` (`id_keanggotaan`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_data`),
  ADD UNIQUE KEY `id_data` (`id_data`,`nama_pasien`,`jenis_kelamin`,`kondisi`,`jenis_kulit`,`komedo`,`pustul`,`nodul`,`valid`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_data_2` (`id_data`,`nama_pasien`,`jenis_kelamin`,`kondisi`,`jenis_kulit`,`komedo`,`pustul`,`nodul`,`valid`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `variabel`
--
ALTER TABLE `variabel`
  ADD PRIMARY KEY (`id_variabel`),
  ADD KEY `nama_variabel` (`nama_variabel`),
  ADD KEY `id_variabel` (`id_variabel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id_diagnosa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `hasil_periksa`
--
ALTER TABLE `hasil_periksa`
  MODIFY `id_hasil_periksa` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2036;

--
-- AUTO_INCREMENT for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  MODIFY `id_keanggotaan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_data` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id_rule` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `id_obat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_pasien` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `variabel`
--
ALTER TABLE `variabel`
  MODIFY `id_variabel` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `pasien` (`id_data`);

--
-- Constraints for table `hasil_periksa`
--
ALTER TABLE `hasil_periksa`
  ADD CONSTRAINT `hasil_periksa_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `pasien` (`id_data`),
  ADD CONSTRAINT `hasil_periksa_ibfk_2` FOREIGN KEY (`id_keanggotaan`) REFERENCES `keanggotaan` (`id_keanggotaan`),
  ADD CONSTRAINT `hasil_periksa_ibfk_3` FOREIGN KEY (`id_variabel`) REFERENCES `variabel` (`id_variabel`);

--
-- Constraints for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD CONSTRAINT `keanggotaan_ibfk_1` FOREIGN KEY (`id_variabel`) REFERENCES `variabel` (`id_variabel`);

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `user` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
