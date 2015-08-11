-- MySQL Script generated by MySQL Workbench
-- 08/11/15 03:19:34
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wms_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wms_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wms_db` DEFAULT CHARACTER SET utf8 ;
USE `wms_db` ;

-- -----------------------------------------------------
-- Table `wms_db`.`alerta_vencimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`alerta_vencimento` (
  `id_alerta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` TEXT NULL DEFAULT NULL COMMENT '',
  `data_pre_vencimento` DATE NULL DEFAULT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `data_visualizacao` DATE NULL DEFAULT NULL COMMENT '',
  `visualizado` TINYINT(4) NOT NULL COMMENT '',
  PRIMARY KEY (`id_alerta`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`anexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`anexo` (
  `id_anexo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  `descricao` TEXT NULL DEFAULT NULL COMMENT '',
  `arquivo` BLOB NOT NULL COMMENT '',
  PRIMARY KEY (`id_anexo`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`banco` (
  `id_banco` INT(11) NOT NULL COMMENT '',
  `nome_banco` VARCHAR(100) NOT NULL COMMENT '',
  PRIMARY KEY (`id_banco`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cartao_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cartao_credito` (
  `id_cartao_credito` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `n_parcelas` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `valor_parcela` DECIMAL(10,0) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cartao_credito`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`categoria_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`categoria_material` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_categoria`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cheque` (
  `id_cheque` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `numero` VARCHAR(45) NOT NULL COMMENT '',
  `data_desconto` DATE NULL DEFAULT NULL COMMENT '',
  `observacao` TEXT NULL DEFAULT NULL COMMENT '',
  `valor_cheque` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_cheque`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '		';


-- -----------------------------------------------------
-- Table `wms_db`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cidade` (
  `id_cidade` INT(11) NOT NULL COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cidade`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nomeRazaoSocial` VARCHAR(255) NOT NULL COMMENT '',
  `cpfCnpj` VARCHAR(20) NOT NULL COMMENT '',
  `nomeFantasia` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `telefone` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `rg` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `logradouro` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `observacao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idCliente`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_a_pagar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_a_pagar` (
  `id_conta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nota_fiscal` VARCHAR(45) NOT NULL COMMENT '',
  `valor_conta` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `data_pagamento` DATE NOT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `observacao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_conta`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_a_receber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_a_receber` (
  `id_conta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `numero_contrato` VARCHAR(45) NOT NULL COMMENT '',
  `valor_conta` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `data_pagamento` DATE NOT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `observacao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_conta`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_bancaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_bancaria` (
  `id_conta_bancaria` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `agencia` VARCHAR(10) NOT NULL COMMENT '',
  `conta_corrente` VARCHAR(10) NOT NULL COMMENT '',
  `titular` VARCHAR(255) NOT NULL COMMENT '',
  `operacao` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_conta_bancaria`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`despesa_geral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`despesa_geral` (
  `id_despesa_geral` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_despesa_geral`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`empresa_terceirizada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`empresa_terceirizada` (
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `razao_social` VARCHAR(255) NOT NULL COMMENT '',
  `nome_fantasia` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `cnpj` VARCHAR(20) NOT NULL COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `contato` VARCHAR(255) NOT NULL COMMENT '',
  `email` VARCHAR(100) NOT NULL COMMENT '',
  PRIMARY KEY (`id_empresa`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`estado` (
  `id_estado` INT(11) NOT NULL COMMENT '',
  `abreviacao` VARCHAR(2) NOT NULL COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id_estado`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fase` (
  `id_fase` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome_fase` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` VARCHAR(1000) NOT NULL COMMENT '',
  PRIMARY KEY (`id_fase`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fase_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fase_obra` (
  `id_fase` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `valor_previsto` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `valor_realizado` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `data_prevista_inicio` DATE NULL DEFAULT NULL COMMENT '',
  `data_inicio` DATE NULL DEFAULT NULL COMMENT '',
  `data_prevista_termino` DATE NULL DEFAULT NULL COMMENT '',
  `data_termino` DATE NULL DEFAULT NULL COMMENT '',
  `observacao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_fase`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fornecedor` (
  `id_fornecedor` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `contato` VARCHAR(100) NOT NULL COMMENT '',
  `email` VARCHAR(100) NOT NULL COMMENT '',
  `observacao` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_fornecedor`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`funcao` (
  `id_funcao` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_funcao`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


-- -----------------------------------------------------
-- Table `wms_db`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`funcionario` (
  `id_funcionario` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(200) NOT NULL COMMENT '',
  `cpf_cnpj` VARCHAR(20) NOT NULL COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `data_nasc` DATE NULL DEFAULT NULL COMMENT '',
  `rg` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `logradouro` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `carteira_trabalho` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `agencia` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `conta_corrente` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_funcionario`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`lancamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`lancamento` (
  `id_lancamento` INT(11) NOT NULL COMMENT '',
  `valor_lancamento` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_lancamento` DATE NOT NULL COMMENT '',
  `observacao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_lancamento`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`material` (
  `id_material` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_material`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`obra` (
  `id_obra` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `numero_contrato` INT(11) NOT NULL COMMENT '',
  `nome_obra` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `valor_previsto_venda` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `valor_realizado_venda` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `data_inicio` DATE NULL DEFAULT NULL COMMENT '',
  `data_prevista_termino` DATE NULL DEFAULT NULL COMMENT '',
  `data_venda` DATE NULL DEFAULT NULL COMMENT '',
  `data_entrega` DATE NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_obra`, `numero_contrato`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`tarefa` (
  `id_tarefa` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  `descricao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_tarefa`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`tarefa_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`tarefa_obra` (
  `id_tarefa_obra` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `progresso` DECIMAL(3,2) NOT NULL COMMENT '',
  `observacao` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_tarefa_obra`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`usuario` (
  `idUsuario` INT(11) NOT NULL COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `senha` VARCHAR(45) NOT NULL COMMENT '',
  `perfil` INT(11) NOT NULL DEFAULT '1' COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `dataNasc` DATE NULL DEFAULT NULL COMMENT '',
  `rg` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cpfCnpj` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `logradouro` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idUsuario`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
