-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql49-farm1.kinghost.net
-- Tempo de geração: 26/05/2025 às 11:40
-- Versão do servidor: 11.4.5-MariaDB-log
-- Versão do PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `ecotech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `cd_estoque` int(11) NOT NULL,
  `nm_estoque` varchar(100) NOT NULL,
  `cd_planta` int(11) NOT NULL,
  `qt_disponivel` int(11) NOT NULL DEFAULT 0,
  `qt_capacidade_maxima` int(11) NOT NULL,
  `qt_volume_total` decimal(10,5) DEFAULT NULL,
  `qt_volume_atual` decimal(10,5) DEFAULT NULL,
  `dt_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Fazendo dump de dados para tabela `estoque`
--

INSERT INTO `estoque` (`cd_estoque`, `nm_estoque`, `cd_planta`, `qt_disponivel`, `qt_capacidade_maxima`, `qt_volume_total`, `qt_volume_atual`, `dt_atualizacao`) VALUES
(10, 'Estoque Motores', 65, 850, 1000, NULL, NULL, '2025-05-14 09:09:29'),
(11, 'Estoque Baterias', 65, 900, 1000, NULL, NULL, '2025-05-14 09:31:27'),
(12, 'Estoque Placas', 13, 500, 1000, NULL, NULL, '2025-05-14 09:40:18'),
(13, 'Estoque Metal', 34, 750, 1000, NULL, NULL, '2025-05-14 09:40:26'),
(14, 'Estoque Plástico', 54, 350, 1000, NULL, NULL, '2025-05-14 09:40:32'),
(16, 'Estoque Descarte', 10, 550, 1000, NULL, NULL, '2025-05-14 09:32:15');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`cd_estoque`), ADD KEY `cd_planta` (`cd_planta`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `cd_estoque` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
ADD CONSTRAINT `estoque_ibfk_3` FOREIGN KEY (`cd_planta`) REFERENCES `planta` (`cd_planta`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
