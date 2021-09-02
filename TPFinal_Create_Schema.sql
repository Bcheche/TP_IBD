-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema schema_tpfinal_medico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema schema_tpfinal_medico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `schema_tpfinal_medico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `schema_tpfinal_medico` ;

-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`condicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`condicao` (
  `codigo_icd` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `definicao` VARCHAR(450) NOT NULL,
  PRIMARY KEY (`codigo_icd`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`medico` (
  `crm` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `ultimo_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`crm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`paciente` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `ultimo_nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `medico_crm` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_paciente_medico1_idx` (`medico_crm` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_medico1`
    FOREIGN KEY (`medico_crm`)
    REFERENCES `schema_tpfinal_medico`.`medico` (`crm`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`condicao_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`condicao_paciente` (
  `paciente_cpf` INT NOT NULL,
  `condicao_codigo_icd` VARCHAR(100) NOT NULL,
  INDEX `fk_condicao_paciente_paciente1_idx` (`paciente_cpf` ASC) VISIBLE,
  INDEX `fk_condicao_paciente_condicao1_idx` (`condicao_codigo_icd` ASC) VISIBLE,
  CONSTRAINT `fk_condicao_paciente_paciente1`
    FOREIGN KEY (`paciente_cpf`)
    REFERENCES `schema_tpfinal_medico`.`paciente` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_condicao_paciente_condicao1`
    FOREIGN KEY (`condicao_codigo_icd`)
    REFERENCES `schema_tpfinal_medico`.`condicao` (`codigo_icd`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`sintoma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`sintoma` (
  `codigo_ctcae` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `definicao` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`codigo_ctcae`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`relato_sintoma_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`relato_sintoma_paciente` (
  `iniciado_em` DATETIME NOT NULL,
  `encerrado_em` DATETIME NULL DEFAULT NULL,
  `gravidade` INT NOT NULL,
  `sintoma_codigo_ctcae` VARCHAR(100) NOT NULL,
  `paciente_cpf` INT NOT NULL,
  INDEX `fk_relato_sintoma_paciente_sintoma1_idx` (`sintoma_codigo_ctcae` ASC) VISIBLE,
  INDEX `fk_relato_sintoma_paciente_paciente1_idx` (`paciente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_relato_sintoma_paciente_sintoma1`
    FOREIGN KEY (`sintoma_codigo_ctcae`)
    REFERENCES `schema_tpfinal_medico`.`sintoma` (`codigo_ctcae`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_relato_sintoma_paciente_paciente1`
    FOREIGN KEY (`paciente_cpf`)
    REFERENCES `schema_tpfinal_medico`.`paciente` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `schema_tpfinal_medico`.`telefone_de_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `schema_tpfinal_medico`.`telefone_de_contato` (
  `telefone` INT NOT NULL,
  `medico_crm` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`telefone`),
  INDEX `fk_telefone_de_contato_medico_idx` (`medico_crm` ASC) VISIBLE,
  CONSTRAINT `fk_telefone_de_contato_medico`
    FOREIGN KEY (`medico_crm`)
    REFERENCES `schema_tpfinal_medico`.`medico` (`crm`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
