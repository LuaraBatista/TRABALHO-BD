-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260810.843def3cd8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 06:09 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `focinhos_bico_vet`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamento`
--

CREATE TABLE `agendamento` (
  `id_agendamento` int NOT NULL,
  `data` date DEFAULT NULL,
  `horario` time NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animais`
--

CREATE TABLE `animais` (
  `id_animal` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `especie` varchar(50) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(30) DEFAULT NULL,
  `id_tutores` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aplicacao_vacina`
--

CREATE TABLE `aplicacao_vacina` (
  `id_aplicacao` int NOT NULL,
  `data_aplicacao` date NOT NULL,
  `id_animal` int NOT NULL,
  `id_vacina` int NOT NULL,
  `id_veterinario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL,
  `data` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_agendamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consulta_procedimento`
--

CREATE TABLE `consulta_procedimento` (
  `id_consulta` int NOT NULL,
  `id_procedimento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidade`
--

CREATE TABLE `especialidade` (
  `id_especialidade` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fatura`
--

CREATE TABLE `fatura` (
  `id_fatura` int NOT NULL,
  `data_emissao` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `id_consulta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_fatura`
--

CREATE TABLE `item_fatura` (
  `id_item` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `id_fatura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_pagamento` date NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `id_fatura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedimento`
--

CREATE TABLE `procedimento` (
  `id_procedimento` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutores`
--

CREATE TABLE `tutores` (
  `id_tutores` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacina`
--

CREATE TABLE `vacina` (
  `id_vacina` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `fabricante` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario`
--

CREATE TABLE `veterinario` (
  `id_veterinario` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario_especialidade`
--

CREATE TABLE `veterinario_especialidade` (
  `id_veterinario` int NOT NULL,
  `id_especialidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indexes for table `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_tutores` (`id_tutores`);

--
-- Indexes for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD PRIMARY KEY (`id_aplicacao`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_vacina` (`id_vacina`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_agendamento` (`id_agendamento`);

--
-- Indexes for table `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  ADD PRIMARY KEY (`id_consulta`,`id_procedimento`),
  ADD KEY `id_procedimento` (`id_procedimento`);

--
-- Indexes for table `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Indexes for table `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id_fatura`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Indexes for table `item_fatura`
--
ALTER TABLE `item_fatura`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_fatura` (`id_fatura`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_fatura` (`id_fatura`);

--
-- Indexes for table `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`id_procedimento`);

--
-- Indexes for table `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id_tutores`);

--
-- Indexes for table `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`id_vacina`);

--
-- Indexes for table `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id_veterinario`);

--
-- Indexes for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD PRIMARY KEY (`id_veterinario`,`id_especialidade`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id_agendamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animais`
--
ALTER TABLE `animais`
  MODIFY `id_animal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  MODIFY `id_aplicacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id_fatura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_fatura`
--
ALTER TABLE `item_fatura`
  MODIFY `id_item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `id_procedimento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutores`
--
ALTER TABLE `tutores`
  MODIFY `id_tutores` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacina`
--
ALTER TABLE `vacina`
  MODIFY `id_vacina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id_veterinario` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animais` (`id_animal`),
  ADD CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`);

--
-- Constraints for table `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`id_tutores`) REFERENCES `tutores` (`id_tutores`);

--
-- Constraints for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD CONSTRAINT `aplicacao_vacina_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animais` (`id_animal`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_2` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id_vacina`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`);

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animais` (`id_animal`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamento` (`id_agendamento`);

--
-- Constraints for table `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  ADD CONSTRAINT `consulta_procedimento_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
  ADD CONSTRAINT `consulta_procedimento_ibfk_2` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`);

--
-- Constraints for table `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`);

--
-- Constraints for table `item_fatura`
--
ALTER TABLE `item_fatura`
  ADD CONSTRAINT `item_fatura_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id_fatura`);

--
-- Constraints for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id_fatura`);

--
-- Constraints for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD CONSTRAINT `veterinario_especialidade_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `veterinario_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
