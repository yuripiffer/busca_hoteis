-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Abr-2021 às 21:43
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hoteis_regioes`
--
CREATE DATABASE IF NOT EXISTS `hoteis_regioes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hoteis_regioes`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE `cidades` (
  `id_cidade` int(11) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `id_regiao_cidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id_cidade`, `cidade`, `id_regiao_cidades`) VALUES
(1, 'Araranguá', 3),
(2, 'Armazém', 3),
(3, 'Capivari de Baixo', 3),
(4, 'Criciúma', 3),
(5, 'Garopaba', 3),
(6, 'Joinville', 1),
(7, 'Mafra', 1),
(8, 'Rio Negrinho', 1),
(9, 'São Bento do Sul', 1),
(10, 'São Francisco do Sul', 1),
(11, 'Chapecó', 2),
(12, 'Concórdia', 2),
(13, 'Descanso', 2),
(14, 'Modelo', 2),
(15, 'Princesa', 2),
(16, 'Bom Jardim da Serra', 4),
(17, 'Correia Pinto', 4),
(18, 'Curitibanos', 4),
(19, 'Lages', 4),
(20, 'Urubici', 4),
(21, 'Blumenau', 5),
(22, 'Bombinhas', 5),
(23, 'Brusque', 5),
(24, 'Gaspar', 5),
(25, 'Itajaí', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id_regiao` int(11) NOT NULL,
  `regiao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id_regiao`, `regiao`) VALUES
(1, 'Nordeste'),
(2, 'Noroeste'),
(3, 'Sudeste'),
(4, 'Sudoeste'),
(5, 'Centro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteis`
--

DROP TABLE IF EXISTS `hoteis`;
CREATE TABLE `hoteis` (
  `id_hotel` int(11) NOT NULL,
  `hotel` varchar(100) NOT NULL,
  `classificacao` int(11) NOT NULL,
  `preco_diaria` double NOT NULL,
  `academia` tinyint(1) DEFAULT NULL,
  `piscina` tinyint(1) DEFAULT NULL,
  `all_inclusive` tinyint(1) DEFAULT NULL,
  `vagas` int(11) NOT NULL,
  `id_cidade_hoteis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hoteis`
--

INSERT INTO `hoteis` (`id_hotel`, `hotel`, `classificacao`, `preco_diaria`, `academia`, `piscina`, `all_inclusive`, `vagas`, `id_cidade_hoteis`) VALUES
(1, 'Jardim Europa', 5, 249.9, 1, 1, 0, 15, 8),
(2, 'Cajado', 3, 120, 0, 0, 0, 18, 5),
(3, 'Sonho Azul', 2, 89.9, 0, 0, 1, 29, 20),
(4, 'Majestic', 5, 490, 1, 1, 0, 189, 21),
(5, 'Hall', 4, 78, 1, 1, 0, 19, 14),
(6, 'Saint Germain', 4, 257.9, 1, 1, 1, 1, 2),
(7, 'Costão', 2, 120, 0, 0, 0, 0, 9),
(8, 'Brisa do Mar', 5, 512, 1, 1, 0, 30, 10),
(9, 'Maria Eduarda', 4, 89.9, 0, 0, 0, 2, 4),
(10, 'Fasano', 5, 890, 1, 1, 1, 180, 7),
(11, 'São Sebastião', 2, 49, 0, 0, 0, 12, 4),
(12, 'Slaviero', 4, 180, 0, 0, 0, 45, 14),
(13, 'Slaviero', 4, 190, 0, 0, 0, 0, 18),
(14, 'BlueTree', 4, 290, 1, 1, 1, 57, 16),
(15, 'Soraya', 2, 49.9, 0, 0, 0, 12, 25),
(16, 'Santa Maria', 3, 89, 0, 0, 0, 5, 1),
(17, 'Flower', 2, 59, 0, 0, 0, 63, 2),
(18, 'Elnull', 3, 109.89, 1, 0, 0, 8, 3),
(19, 'El Dorado', 4, 159, 1, 1, 0, 54, 6),
(20, 'Mexican', 5, 356.78, 1, 1, 1, 23, 9),
(21, 'Java Inn', 4, 278.9, 1, 1, 0, 82, 11),
(22, 'Philadelphia', 2, 59.5, 0, 0, 0, 4, 12),
(23, 'Cristoffer Inn', 2, 65.99, 0, 0, 0, 3, 19),
(24, 'Mario Elquinte', 3, 77, 0, 0, 1, 9, 23),
(25, 'Edward Silveira', 4, 234, 1, 1, 0, 77, 24),
(26, 'Copacabana', 5, 659.9, 1, 1, 1, 14, 15),
(27, 'Saint Paul', 1, 35.5, 0, 0, 0, 4, 17),
(28, 'Florianopolis Inn', 2, 90, 0, 0, 0, 0, 24),
(29, 'Blummen All', 5, 897.35, 1, 1, 1, 25, 13),
(30, 'Oxford', 4, 100, 0, 0, 0, 13, 22);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id_cidade`),
  ADD KEY `cidades_FK` (`id_regiao_cidades`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_regiao`);

--
-- Índices para tabela `hoteis`
--
ALTER TABLE `hoteis`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `hoteis_FK` (`id_cidade_hoteis`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `hoteis`
--
ALTER TABLE `hoteis`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `cidades_FK` FOREIGN KEY (`id_regiao_cidades`) REFERENCES `estado` (`id_regiao`);

--
-- Limitadores para a tabela `hoteis`
--
ALTER TABLE `hoteis`
  ADD CONSTRAINT `hoteis_FK` FOREIGN KEY (`id_cidade_hoteis`) REFERENCES `cidades` (`id_cidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
