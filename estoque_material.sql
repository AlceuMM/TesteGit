-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql49-farm1.kinghost.net
-- Tempo de geração: 26/05/2025 às 18:27
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
-- Estrutura para tabela `estoque_material`
--

CREATE TABLE IF NOT EXISTS `estoque_material` (
  `cd_material_etq` int(11) NOT NULL,
  `cd_material` int(11) DEFAULT NULL,
  `ds_material` varchar(50) DEFAULT NULL,
  `cd_estoque` int(11) DEFAULT NULL,
  `qt_peso` decimal(10,3) DEFAULT NULL,
  `qt_volume` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Fazendo dump de dados para tabela `estoque_material`
--

INSERT INTO `estoque_material` (`cd_material_etq`, `cd_material`, `ds_material`, `cd_estoque`, `qt_peso`, `qt_volume`) VALUES
(31, 79, 'Plásticos', 17, '20.000', '10.00000000');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `estoque_material`
--
ALTER TABLE `estoque_material`
  ADD PRIMARY KEY (`cd_material_etq`), ADD KEY `cd_material` (`cd_material`), ADD KEY `cd_estoque` (`cd_estoque`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `estoque_material`
--
ALTER TABLE `estoque_material`
  MODIFY `cd_material_etq` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `estoque_material`
--
ALTER TABLE `estoque_material`
ADD CONSTRAINT `estoque_material_ibfk_1` FOREIGN KEY (`cd_material`) REFERENCES `materiais` (`cd_material`),
ADD CONSTRAINT `estoque_material_ibfk_2` FOREIGN KEY (`cd_estoque`) REFERENCES `estoque` (`cd_estoque`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
