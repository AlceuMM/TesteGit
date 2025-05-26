-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: mysql49-farm1.kinghost.net
-- Tempo de geração: 26/05/2025 às 14:19
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
  `qt_disponivel_kg` decimal(10,0) NOT NULL DEFAULT 0,
  `qt_capacidade_maxima` decimal(10,0) NOT NULL,
  `qt_capacidade_atual` decimal(10,2) DEFAULT NULL,
  `qt_disponivel_volume` decimal(10,0) NOT NULL DEFAULT 0,
  `qt_volume_total` decimal(10,5) DEFAULT NULL,
  `qt_volume_atual` decimal(10,5) DEFAULT NULL,
  `dt_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Fazendo dump de dados para tabela `estoque`
--

INSERT INTO `estoque` (`cd_estoque`, `nm_estoque`, `cd_planta`, `qt_disponivel_kg`, `qt_capacidade_maxima`, `qt_capacidade_atual`, `qt_disponivel_volume`, `qt_volume_total`, `qt_volume_atual`, `dt_atualizacao`) VALUES
(10, 'Estoque Motores', 65, '850', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:09:29'),
(11, 'Estoque Baterias', 65, '900', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:31:27'),
(12, 'Estoque Placas', 13, '500', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:40:18'),
(13, 'Estoque Metal', 34, '750', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:40:26'),
(14, 'Estoque Plástico', 54, '350', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:40:32'),
(16, 'Estoque Descarte', 10, '550', '1000', NULL, '0', NULL, NULL, '2025-05-14 09:32:15'),
(17, 'Estoque vidro ', 65, '0', '1500', '20.00', '0', '1500.00000', '0.00500', '2025-05-26 16:49:39');

--
-- Gatilhos `estoque`
--
DELIMITER $$
CREATE TRIGGER `trg_estoque_atual_after_delete` AFTER DELETE ON `estoque`
 FOR EACH ROW BEGIN
  UPDATE planta
    SET
      qt_capacidade_atual_kg = (
        SELECT IFNULL(SUM(qt_capacidade_atual), 0)
        FROM estoque WHERE cd_planta = OLD.cd_planta
      ),
      qt_capacidade_atual_volume = (
        SELECT IFNULL(SUM(qt_volume_atual), 0)
        FROM estoque WHERE cd_planta = OLD.cd_planta
      )
    WHERE cd_planta = OLD.cd_planta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_estoque_atual_after_insert` AFTER INSERT ON `estoque`
 FOR EACH ROW BEGIN
  UPDATE planta
    SET
      qt_capacidade_atual_kg = (
        SELECT IFNULL(SUM(qt_capacidade_atual), 0)
        FROM estoque WHERE cd_planta = NEW.cd_planta
      ),
      qt_capacidade_atual_volume = (
        SELECT IFNULL(SUM(qt_volume_atual), 0)
        FROM estoque WHERE cd_planta = NEW.cd_planta
      )
    WHERE cd_planta = NEW.cd_planta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_estoque_atual_after_update` AFTER UPDATE ON `estoque`
 FOR EACH ROW BEGIN
  -- Atualiza a planta antiga se mudou de planta
  IF OLD.cd_planta <> NEW.cd_planta THEN

    UPDATE planta
      SET
        qt_capacidade_atual_kg = (
          SELECT IFNULL(SUM(qt_capacidade_atual), 0)
          FROM estoque WHERE cd_planta = OLD.cd_planta
        ),
        qt_capacidade_atual_volume = (
          SELECT IFNULL(SUM(qt_volume_atual), 0)
          FROM estoque WHERE cd_planta = OLD.cd_planta
        )
      WHERE cd_planta = OLD.cd_planta;
  END IF;

  -- Atualiza a planta nova
  UPDATE planta
    SET
      qt_capacidade_atual_kg = (
        SELECT IFNULL(SUM(qt_capacidade_atual), 0)
        FROM estoque WHERE cd_planta = NEW.cd_planta
      ),
      qt_capacidade_atual_volume = (
        SELECT IFNULL(SUM(qt_volume_atual), 0)
        FROM estoque WHERE cd_planta = NEW.cd_planta
      )
    WHERE cd_planta = NEW.cd_planta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_estoque_total_after_delete` AFTER DELETE ON `estoque`
 FOR EACH ROW BEGIN
  UPDATE planta
    SET
      qt_capacidade_total_kg = (
        SELECT IFNULL(SUM(qt_capacidade_maxima), 0)
        FROM estoque
        WHERE cd_planta = OLD.cd_planta
      ),
      qt_capacidade_total_volume = (
        SELECT IFNULL(SUM(qt_volume_total), 0)
        FROM estoque
        WHERE cd_planta = OLD.cd_planta
      )
    WHERE cd_planta = OLD.cd_planta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_estoque_total_after_insert` AFTER INSERT ON `estoque`
 FOR EACH ROW BEGIN
  UPDATE planta
    SET
      qt_capacidade_total_kg = (
        SELECT IFNULL(SUM(qt_capacidade_maxima), 0)
        FROM estoque
        WHERE cd_planta = NEW.cd_planta
      ),
      qt_capacidade_total_volume = (
        SELECT IFNULL(SUM(qt_volume_total), 0)
        FROM estoque
        WHERE cd_planta = NEW.cd_planta
      )
    WHERE cd_planta = NEW.cd_planta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_estoque_total_after_update` AFTER UPDATE ON `estoque`
 FOR EACH ROW BEGIN
  -- Atualiza a planta antiga, caso o estoque tenha mudado de planta
  IF OLD.cd_planta <> NEW.cd_planta THEN
    UPDATE planta
      SET
        qt_capacidade_total_kg = (
          SELECT IFNULL(SUM(qt_capacidade_maxima), 0)
          FROM estoque
          WHERE cd_planta = OLD.cd_planta
        ),
        qt_capacidade_total_volume = (
          SELECT IFNULL(SUM(qt_volume_total), 0)
          FROM estoque
          WHERE cd_planta = OLD.cd_planta
        )
      WHERE cd_planta = OLD.cd_planta;
  END IF;

  -- Atualiza a planta nova
  UPDATE planta
    SET
      qt_capacidade_total_kg = (
        SELECT IFNULL(SUM(qt_capacidade_maxima), 0)
        FROM estoque
        WHERE cd_planta = NEW.cd_planta
      ),
      qt_capacidade_total_volume = (
        SELECT IFNULL(SUM(qt_volume_total), 0)
        FROM estoque
        WHERE cd_planta = NEW.cd_planta
      )
    WHERE cd_planta = NEW.cd_planta;
END
$$
DELIMITER ;

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
  MODIFY `cd_estoque` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
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
