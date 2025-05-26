-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql49-farm1.kinghost.net
-- Tempo de geração: 26/05/2025 às 11:39
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
-- Estrutura para tabela `planta`
--

CREATE TABLE IF NOT EXISTS `planta` (
  `cd_planta` int(11) NOT NULL,
  `nm_planta` varchar(100) NOT NULL,
  `qt_capacidade_total_volume` decimal(10,5) NOT NULL,
  `qt_capacidade_atual_volume` decimal(10,5) NOT NULL,
  `qt_capacidade_total_kg` decimal(15,2) NOT NULL,
  `qt_capacidade_atual_kg` decimal(15,2) DEFAULT NULL,
  `ds_endereco` varchar(255) NOT NULL,
  `nr_endereco` int(10) NOT NULL,
  `cd_bairro` int(11) NOT NULL,
  `cd_cidade` int(11) NOT NULL,
  `nr_cep` varchar(8) NOT NULL,
  `dt_criacao` timestamp NULL DEFAULT current_timestamp(),
  `ie_situacao` char(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Fazendo dump de dados para tabela `planta`
--

INSERT INTO `planta` (`cd_planta`, `nm_planta`, `qt_capacidade_total_volume`, `qt_capacidade_atual_volume`, `qt_capacidade_total_kg`, `qt_capacidade_atual_kg`, `ds_endereco`, `nr_endereco`, `cd_bairro`, `cd_cidade`, `nr_cep`, `dt_criacao`, `ie_situacao`) VALUES
(10, 'Planta EcoTech Matriz', '10000.00000', '0.00000', '1000.00', '500.00', 'RUA JULIO ZANDONA, 18', 0, 1, 1, '81320000', '2025-04-17 03:28:23', 'A'),
(11, 'Planta EcoTech Filial', '500.00000', '0.00000', '1000.00', '900.00', 'Rua puta que pariu', 0, 1, 1, '81320000', '2025-04-17 03:33:20', 'I'),
(12, 'Planta EcoTech Umbara', '100.00000', '0.00000', '1000.00', '800.00', 'Rua puta que pariu, 2', 0, 1, 1, '87654321', '2025-04-17 03:50:25', 'I'),
(13, 'Planta EcoTech Santa Felicidade', '2000.00000', '0.00000', '1000.00', '500.00', 'rua mais linda', 0, 1, 1, '12345678', '2025-04-18 03:17:07', 'A'),
(30, 'Planta EcoTech Alto da Glória', '2000.00000', '0.00000', '500.00', '450.00', 'Rua Julio Zandona, 18', 0, 3, 3, '79861124', '2025-04-22 05:52:51', 'I'),
(31, 'Planta EcoTech Hauer', '2500.00000', '0.00000', '2000.00', '1800.00', 'Rua Floriano Peixoto, 18', 0, 1, 1, '81320000', '2025-04-22 07:52:14', 'A'),
(32, 'Planta EcoTech Pilarzinho', '2500.00000', '0.00000', '2000.00', '1800.00', 'Rua Floriano Peixoto, 18', 0, 1, 1, '12345678', '2025-04-22 08:04:08', 'I'),
(33, 'Planta EcoTech São José dos Pinhais', '100.00000', '0.00000', '1000.00', '900.00', 'rua joão pedro 22', 0, 4, 1, '81810240', '2025-04-23 23:05:23', 'I'),
(34, 'Planta EcoTech CIC', '1000.00000', '0.00000', '900.00', '800.00', 'rua joão pedro', 0, 1, 1, '81810240', '2025-04-23 23:14:53', 'I'),
(53, 'Planta EcoTech Portão', '1000.00000', '0.00000', '2500.00', '2000.00', 'Rua Titaco Avara, 69', 0, 5, 1, '81720258', '2025-05-02 05:25:12', 'A'),
(54, 'Planta EcoTech Alto Boqueirão', '100.00000', '0.00000', '1000.00', '0.00', 'Zeferino Da Costa', 0, 4, 1, '81810030', '2025-05-04 23:00:25', 'I'),
(55, 'Planta EcoTech Centro', '100.00000', '0.00000', '1000.00', '1000.00', 'Zeferino Da Costa', 0, 4, 1, '81810030', '2025-05-04 23:09:04', 'I'),
(65, 'Planta EcoTech Fazendinha', '100.00000', '0.00000', '1000.00', '20.00', 'Zeferino Da Costa', 0, 4, 1, '81810030', '2025-05-04 23:43:07', 'I');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`cd_planta`), ADD KEY `cd_bairro` (`cd_bairro`), ADD KEY `cd_cidade` (`cd_cidade`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `planta`
--
ALTER TABLE `planta`
  MODIFY `cd_planta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=82;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `planta`
--
ALTER TABLE `planta`
ADD CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`cd_bairro`) REFERENCES `bairro` (`cd_bairro`),
ADD CONSTRAINT `planta_ibfk_2` FOREIGN KEY (`cd_cidade`) REFERENCES `cidade` (`cd_cidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
