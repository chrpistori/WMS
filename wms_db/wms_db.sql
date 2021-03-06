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
-- Table `wms_db`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta` (
  `id_conta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nota_fiscal` VARCHAR(45) NOT NULL COMMENT '',
  `valor_conta` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `data_pagamento` DATE NOT NULL COMMENT '',
  `tipo_pagamento` INT NOT NULL COMMENT '',
  `tipo_conta` INT NOT NULL COMMENT '',
  `observacao` VARCHAR(255) NULL COMMENT '',
  `n_parcelas` INT NULL COMMENT '',
  `status` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`id_conta`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`alerta_vencimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`alerta_vencimento` (
  `id_alerta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `data_pre_vencimento` DATE NULL DEFAULT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `data_visualizacao` DATE NULL DEFAULT NULL COMMENT '',
  `visualizado` TINYINT(4) NOT NULL COMMENT '',
  `id_conta` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_alerta`)  COMMENT '',
  INDEX `fk_alerta_vencimento_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_alerta_vencimento_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`banco` (
  `id_banco` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome_banco` VARCHAR(100) NOT NULL COMMENT '',
  PRIMARY KEY (`id_banco`)  COMMENT '')
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
-- Table `wms_db`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`funcionario` (
  `id_funcionario` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(200) NOT NULL COMMENT '',
  `cpf_cnpj` VARCHAR(20) NOT NULL COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `data_nasc` DATE NULL COMMENT '',
  `rg` VARCHAR(20) NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(100) NULL COMMENT '',
  `logradouro` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `carteira_trabalho` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `numero_contrato` INT(11) NOT NULL COMMENT '',
  `id_empresa` INT(11) NOT NULL COMMENT '',
  `id_funcao` INT(11) NOT NULL COMMENT '',
  `salario` DECIMAL(10,2) NULL COMMENT '',
  PRIMARY KEY (`id_funcionario`)  COMMENT '',
  INDEX `fk_funcionario_obra1_idx` (`numero_contrato` ASC)  COMMENT '',
  INDEX `fk_funcionario_funcao1_idx` (`id_funcao` ASC)  COMMENT '',
  INDEX `fk_funcionario_empresa_terceirizada1_idx` (`id_empresa` ASC)  COMMENT '',
  CONSTRAINT `fk_funcionario_obra1`
    FOREIGN KEY (`numero_contrato`)
    REFERENCES `wms_db`.`obra` (`numero_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_funcao1`
    FOREIGN KEY (`id_funcao`)
    REFERENCES `wms_db`.`funcao` (`id_funcao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_empresa_terceirizada1`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `wms_db`.`empresa_terceirizada` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_bancaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_bancaria` (
  `id_conta_bancaria` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `agencia` VARCHAR(10) NOT NULL COMMENT '',
  `n_conta_bancaria` VARCHAR(10) NOT NULL COMMENT '',
  `titular` VARCHAR(255) NOT NULL COMMENT '',
  `operacao` INT(11) NULL DEFAULT NULL COMMENT '',
  `id_banco` INT(11) NOT NULL COMMENT '',
  `id_funcionario` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_conta_bancaria`)  COMMENT '',
  INDEX `fk_conta_bancaria_banco1_idx` (`id_banco` ASC)  COMMENT '',
  INDEX `fk_conta_bancaria_funcionario1_idx` (`id_funcionario` ASC)  COMMENT '',
  CONSTRAINT `fk_conta_bancaria_banco1`
    FOREIGN KEY (`id_banco`)
    REFERENCES `wms_db`.`banco` (`id_banco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_bancaria_funcionario1`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `wms_db`.`funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nomeRazaoSocial` VARCHAR(100) NOT NULL COMMENT '',
  `cpfCnpj` VARCHAR(20) NOT NULL COMMENT '',
  `nomeFantasia` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `telefone` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `rg` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `logradouro` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `observacao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idCliente`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `senha` VARCHAR(45) NOT NULL COMMENT '',
  `perfil` INT(11) NOT NULL DEFAULT '1' COMMENT '',
  `telefone` VARCHAR(20) NOT NULL COMMENT '',
  `dataNasc` DATE NULL DEFAULT NULL COMMENT '',
  `rg` VARCHAR(20) NULL COMMENT '',
  `cpfCnpj` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `cep` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `bairro` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `logradouro` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `complemento` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idUsuario`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`obra` (
  `numero_contrato` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome_obra` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(1000) NULL COMMENT '',
  `valor_previsto_venda` DECIMAL(10,2) NULL COMMENT '',
  `valor_realizado_venda` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '',
  `data_inicio` DATE NULL DEFAULT NULL COMMENT '',
  `data_prevista_termino` DATE NULL DEFAULT NULL COMMENT '',
  `data_venda` DATE NULL DEFAULT NULL COMMENT '',
  `data_entrega` DATE NULL DEFAULT NULL COMMENT '',
  `id_conta_bancaria` INT(11) NOT NULL COMMENT '',
  `cliente_idCliente` INT(11) NOT NULL COMMENT '',
  `usuario_idUsuario` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`numero_contrato`)  COMMENT '',
  INDEX `fk_obra_conta_bancaria1_idx` (`id_conta_bancaria` ASC)  COMMENT '',
  INDEX `fk_obra_cliente1_idx` (`cliente_idCliente` ASC)  COMMENT '',
  INDEX `fk_obra_usuario1_idx` (`usuario_idUsuario` ASC)  COMMENT '',
  CONSTRAINT `fk_obra_conta_bancaria1`
    FOREIGN KEY (`id_conta_bancaria`)
    REFERENCES `wms_db`.`conta_bancaria` (`id_conta_bancaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_obra_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `wms_db`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_obra_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `wms_db`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `id_obra` INT(11) NOT NULL COMMENT '',
  `numero_contrato` INT(11) NOT NULL COMMENT '',
  `id_conta` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_anexo`)  COMMENT '',
  INDEX `fk_anexo_obra1_idx` (`numero_contrato` ASC)  COMMENT '',
  INDEX `fk_anexo_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_anexo_obra1`
    FOREIGN KEY (`numero_contrato`)
    REFERENCES `wms_db`.`obra` (`numero_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anexo_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`parcela_cartao_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`parcela_cartao_credito` (
  `id_parcela` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `n_parcela` DECIMAL(10,0) NOT NULL COMMENT '',
  `data_vencimento` DATE NOT NULL COMMENT '',
  `valor_parcela` DECIMAL(10,0) NOT NULL COMMENT '',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '',
  `parcela_cartao_credito` VARCHAR(45) NULL COMMENT '',
  `id_conta` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_parcela`)  COMMENT '',
  INDEX `fk_cartao_credito_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_cartao_credito_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`categoria_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`categoria_material` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_categoria`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cheque` (
  `id_cheque` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `numero` VARCHAR(45) NOT NULL COMMENT '',
  `data_desconto` DATE NOT NULL COMMENT '',
  `observacao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `valor_cheque` DECIMAL(10,2) NOT NULL COMMENT '',
  `id_conta` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cheque`)  COMMENT '',
  INDEX `fk_cheque_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_cheque_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '		';


-- -----------------------------------------------------
-- Table `wms_db`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`estado` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `abreviacao` VARCHAR(2) NOT NULL COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id_estado`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`cidade` (
  `id_cidade` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(255) NOT NULL COMMENT '',
  `id_estado` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cidade`)  COMMENT '',
  INDEX `fk_cidade_estado1_idx` (`id_estado` ASC)  COMMENT '',
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `wms_db`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`despesa_geral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`despesa_geral` (
  `id_despesa_geral` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_despesa_geral`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fase` (
  `id_fase` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome_fase` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id_fase`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fase_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fase_obra` (
  `id_fase_obra` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `valor_previsto` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `valor_realizado` DECIMAL(10,0) NULL DEFAULT NULL COMMENT '',
  `data_prevista_inicio` DATE NULL DEFAULT NULL COMMENT '',
  `data_inicio` DATE NULL COMMENT '',
  `data_prevista_termino` DATE NULL COMMENT '',
  `data_termino` DATE NULL COMMENT '',
  `observacao` VARCHAR(255) NULL COMMENT '',
  `status` INT(11) NOT NULL COMMENT '',
  `numero_contrato` INT(11) NOT NULL COMMENT '',
  `id_fase` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_fase_obra`)  COMMENT '',
  INDEX `fk_fase_obra_obra1_idx` (`numero_contrato` ASC)  COMMENT '',
  INDEX `fk_fase_obra_fase1_idx` (`id_fase` ASC)  COMMENT '',
  CONSTRAINT `fk_fase_obra_obra1`
    FOREIGN KEY (`numero_contrato`)
    REFERENCES `wms_db`.`obra` (`numero_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fase_obra_fase1`
    FOREIGN KEY (`id_fase`)
    REFERENCES `wms_db`.`fase` (`id_fase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `observacao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_fornecedor`)  COMMENT '')
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
  `id_conta` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_lancamento`)  COMMENT '',
  INDEX `fk_lancamento_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_lancamento_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`material` (
  `id_material` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(100) NOT NULL COMMENT '',
  `descricao` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `id_categoria` INT(11) NOT NULL COMMENT '',
  `marca` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id_material`)  COMMENT '',
  INDEX `fk_material_categoria_material1_idx` (`id_categoria` ASC)  COMMENT '',
  CONSTRAINT `fk_material_categoria_material1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `wms_db`.`categoria_material` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`tarefa` (
  `id_tarefa` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `descricao` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
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
  `id_fase` INT(11) NOT NULL COMMENT '',
  `id_tarefa` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_tarefa_obra`)  COMMENT '',
  INDEX `fk_tarefa_obra_fase_obra1_idx` (`id_fase` ASC)  COMMENT '',
  INDEX `fk_tarefa_obra_tarefa1_idx` (`id_tarefa` ASC)  COMMENT '',
  CONSTRAINT `fk_tarefa_obra_fase_obra1`
    FOREIGN KEY (`id_fase`)
    REFERENCES `wms_db`.`fase_obra` (`id_fase_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarefa_obra_tarefa1`
    FOREIGN KEY (`id_tarefa`)
    REFERENCES `wms_db`.`tarefa` (`id_tarefa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_has_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_has_material` (
  `id_conta` INT(11) NOT NULL COMMENT '',
  `id_material` INT(11) NOT NULL COMMENT '',
  `quantidade` INT NULL COMMENT '',
  INDEX `fk_conta_has_material_material1_idx` (`id_material` ASC)  COMMENT '',
  INDEX `fk_conta_has_material_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_conta_has_material_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_has_material_material1`
    FOREIGN KEY (`id_material`)
    REFERENCES `wms_db`.`material` (`id_material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`fornecedor_has_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`fornecedor_has_material` (
  `id_fornecedor` INT(11) NOT NULL COMMENT '',
  `id_material` INT(11) NOT NULL COMMENT '',
  `valor_unitario` DECIMAL NULL COMMENT '',
  INDEX `fk_fornecedor_has_material_material1_idx` (`id_material` ASC)  COMMENT '',
  INDEX `fk_fornecedor_has_material_fornecedor1_idx` (`id_fornecedor` ASC)  COMMENT '',
  CONSTRAINT `fk_fornecedor_has_material_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `wms_db`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_has_material_material1`
    FOREIGN KEY (`id_material`)
    REFERENCES `wms_db`.`material` (`id_material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_has_despesa_geral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_has_despesa_geral` (
  `id_conta` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `id_despesa_geral` INT(11) NOT NULL COMMENT '',
  INDEX `fk_conta_has_despesa_geral_despesa_geral1_idx` (`id_despesa_geral` ASC)  COMMENT '',
  INDEX `fk_conta_has_despesa_geral_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_conta_has_despesa_geral_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_has_despesa_geral_despesa_geral1`
    FOREIGN KEY (`id_despesa_geral`)
    REFERENCES `wms_db`.`despesa_geral` (`id_despesa_geral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wms_db`.`conta_has_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wms_db`.`conta_has_funcionario` (
  `id_funcionario` INT(11) NOT NULL COMMENT '',
  `id_conta` INT(11) NOT NULL COMMENT '',
  INDEX `fk_conta_has_funcionario_funcionario1_idx` (`id_funcionario` ASC)  COMMENT '',
  INDEX `fk_conta_has_funcionario_conta1_idx` (`id_conta` ASC)  COMMENT '',
  CONSTRAINT `fk_conta_has_funcionario_funcionario1`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `wms_db`.`funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_has_funcionario_conta1`
    FOREIGN KEY (`id_conta`)
    REFERENCES `wms_db`.`conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
