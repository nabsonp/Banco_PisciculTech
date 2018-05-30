-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema piscicultech
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema piscicultech
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `piscicultech` DEFAULT CHARACTER SET utf8 ;
USE `piscicultech` ;

-- -----------------------------------------------------
-- Table `piscicultech`.`Tanque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Tanque` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `dtCriacao` DATE NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  `piscicultura` VARCHAR(25) NOT NULL,
  `situacao` TINYINT(1) NULL,
  `revestimento` VARCHAR(25) NOT NULL,
  `material` VARCHAR(25) NOT NULL,
  `diaPeixam` TINYINT NOT NULL,
  `mesPeixam` TINYINT NOT NULL,
  `anoPeixam` TINYINT NOT NULL,
  `capacidade` DOUBLE NOT NULL,
  `vazao` DOUBLE NOT NULL,
  `profund` DOUBLE NOT NULL,
  `largura` DOUBLE NOT NULL,
  `comp` DOUBLE NOT NULL,
  `nitritoMin` FLOAT NULL,
  `nitritoMax` FLOAT NULL,
  `nitratoMin` FLOAT NULL,
  `nitratoMax` FLOAT NULL,
  `alcalinidadeMin` FLOAT NULL,
  `alcalinidadeMax` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Quimicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Quimicos` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `pesoTotal` FLOAT NOT NULL,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`TanQuim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`TanQuim` (
  `idTanque` TINYINT NOT NULL,
  `codQuimico` INT NOT NULL,
  `dtInsercao` DATE NOT NULL,
  `horaInsercao` TIME NOT NULL,
  `peso` FLOAT NOT NULL,
  PRIMARY KEY (`idTanque`, `codQuimico`, `dtInsercao`, `horaInsercao`),
  INDEX `e_idx` (`codQuimico` ASC),
  CONSTRAINT `RelTanqQuim`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RelQuimTanq`
    FOREIGN KEY (`codQuimico`)
    REFERENCES `piscicultech`.`Quimicos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Especie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `nomeCient` VARCHAR(50) NOT NULL,
  `imagem` VARCHAR(250) NOT NULL,
  `racaoDia` FLOAT NOT NULL,
  `tamMin` FLOAT NULL,
  `tamMax` FLOAT NULL,
  `pesoMin` FLOAT NULL,
  `pesoMax` FLOAT NULL,
  `freqAlimMin` TINYINT NULL,
  `freqAlimMax` TINYINT NULL,
  `temperaturaMin` FLOAT NULL,
  `temperaturaMax` FLOAT NULL,
  `oxigenioMin` FLOAT NULL,
  `oxigenioMax` FLOAT NULL,
  `phMin` FLOAT NULL,
  `phMax` FLOAT NULL,
  `amoniaMin` FLOAT NULL,
  `amoniaMax` FLOAT NULL,
  `gasCarbonicoMin` FLOAT NULL,
  `gasCarbonicoMax` FLOAT NULL,
  `nitritoMin` FLOAT NULL,
  `nitritoMax` FLOAT NULL,
  `nitratoMin` FLOAT NULL,
  `nitratoMax` FLOAT NULL,
  `alcalMin` FLOAT NULL,
  `alcalMax` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`TanqEsp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`TanqEsp` (
  `idTanque` TINYINT NOT NULL,
  `idEspecie` INT NOT NULL,
  `dtPeixam` DATE NOT NULL,
  `qtd` INT NOT NULL,
  `situacao` VARCHAR(25) NOT NULL,
  `biomassa` FLOAT NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTanque`, `idEspecie`, `dtPeixam`),
  INDEX `RelEspTanq_idx` (`idEspecie` ASC),
  CONSTRAINT `RelTanqEsp`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RelEspTanq`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Funcionario` (
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(8) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `imagem` VARCHAR(250) NOT NULL,
  `sexo` CHAR NOT NULL,
  `dtNascimento` DATE NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(32) NOT NULL,
  `inicioTrab` DATE NOT NULL,
  `fimTrab` DATE NULL,
  `ultimaSessao` VARCHAR(100) NULL,
  `numEnd` INT NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Verificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Verificacao` (
  `idTanque` TINYINT NOT NULL,
  `cpfFunc` VARCHAR(11) NOT NULL,
  `hora` TIME NOT NULL,
  `dtVerif` DATE NOT NULL,
  `nome` VARCHAR(15) NOT NULL,
  `valor` FLOAT NOT NULL,
  `situacao` TINYINT(1) NOT NULL,
  `obs` VARCHAR(100) NULL,
  PRIMARY KEY (`idTanque`, `cpfFunc`, `hora`, `dtVerif`, `nome`),
  INDEX `FuncTanq_idx` (`cpfFunc` ASC),
  CONSTRAINT `TanqFunc`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FuncTanq`
    FOREIGN KEY (`cpfFunc`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FoneFunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FoneFunc` (
  `cpfFunc` VARCHAR(11) NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cpfFunc`, `numero`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC),
  CONSTRAINT `FoneFunc`
    FOREIGN KEY (`cpfFunc`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Racao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Racao` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `marca` VARCHAR(25) NOT NULL,
  `pesoTotal` DOUBLE NOT NULL,
  `tamPaleteMin` FLOAT NULL,
  `tamPaleteMax` FLOAT NULL,
  `umidadeMax` FLOAT NULL,
  `proteinaMin` FLOAT NULL,
  `extratoEtereoMin` FLOAT NULL,
  `materiaFibrosaMax` FLOAT NULL,
  `materiaMineralMin` FLOAT NULL,
  `calcioMin` FLOAT NULL,
  `calcioMax` FLOAT NULL,
  `fosforoMin` FLOAT NULL,
  `vitaminaCMin` FLOAT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Arracoamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Arracoamento` (
  `idTanque` TINYINT NOT NULL,
  `codRacao` INT NOT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NOT NULL,
  `hora` TIME NOT NULL,
  `peso` FLOAT NOT NULL,
  PRIMARY KEY (`idTanque`, `codRacao`, `hora`, `dia`, `mes`, `ano`),
  INDEX `RacaoTanq_idx` (`codRacao` ASC),
  CONSTRAINT `TanqRacao`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RacaoTanq`
    FOREIGN KEY (`codRacao`)
    REFERENCES `piscicultech`.`Racao` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Alimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Alimentacao` (
  `idEsp` INT NOT NULL,
  `codRacao` INT NOT NULL,
  `faseDeVida` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idEsp`, `codRacao`),
  INDEX `RacEsp_idx` (`codRacao` ASC),
  CONSTRAINT `RacEsp`
    FOREIGN KEY (`codRacao`)
    REFERENCES `piscicultech`.`Racao` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EspRac`
    FOREIGN KEY (`idEsp`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Fornecedor` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `numEnd` INT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairroEnd` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`VendaQuimico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`VendaQuimico` (
  `codQuim` INT NOT NULL,
  `codForn` INT NOT NULL,
  `dia` DATE NOT NULL,
  `qtd` TINYINT NOT NULL,
  `valorUni` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `pesoUni` FLOAT NULL,
  PRIMARY KEY (`codQuim`, `codForn`, `dia`),
  UNIQUE INDEX `dia_UNIQUE` (`dia` ASC),
  INDEX `FornVenda_idx` (`codForn` ASC),
  CONSTRAINT `FornVendaQuim`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `QuimVenda`
    FOREIGN KEY (`codQuim`)
    REFERENCES `piscicultech`.`Quimicos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`VendaRacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`VendaRacao` (
  `codRacao` INT NOT NULL,
  `codForn` INT NOT NULL,
  `dt` DATE NOT NULL,
  `qtd` TINYINT NOT NULL,
  `valorUni` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `pesoUni` FLOAT NOT NULL,
  INDEX `RacaoVenda_idx` (`codRacao` ASC),
  INDEX `FornVendaRacao_idx` (`codForn` ASC),
  PRIMARY KEY (`codRacao`, `codForn`, `dt`),
  CONSTRAINT `RacaoVenda`
    FOREIGN KEY (`codRacao`)
    REFERENCES `piscicultech`.`Racao` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FornVendaRacao`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`VendaEspecie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`VendaEspecie` (
  `idEspecie` INT NOT NULL,
  `codForn` INT NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  `dtVenda` DATE NOT NULL,
  `qtd` TINYINT NOT NULL,
  `valorUni` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `biomassa` FLOAT NOT NULL,
  `pesoMedio` FLOAT NOT NULL,
  `tamanhoMedio` FLOAT NOT NULL,
  INDEX `EspecieVenda_idx` (`idEspecie` ASC),
  INDEX `FornVendaEspecie_idx` (`codForn` ASC),
  PRIMARY KEY (`idEspecie`, `codForn`, `tipo`, `dtVenda`),
  CONSTRAINT `EspecieVenda`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FornVendaEspecie`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FoneFornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FoneFornecedor` (
  `codForn` INT NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codForn`, `numero`),
  CONSTRAINT `FoneForn`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Relatorio` (
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NOT NULL,
  `endPlanilha` VARCHAR(250) NULL,
  `diaExped` TINYINT NOT NULL,
  `mesExped` TINYINT NOT NULL,
  `anoExped` TINYINT NOT NULL,
  `qtdPeixeInicial` INT NOT NULL,
  `qtdPeixeAtual` INT NOT NULL,
  `qtdPeixeMortos` INT NOT NULL,
  `qtdPeixeManejados` INT NOT NULL,
  `crescimMeta` FLOAT NOT NULL,
  `crescimAlcance` FLOAT NOT NULL,
  `crescmMesAnt` FLOAT NULL,
  `arracoamInseridas` FLOAT NOT NULL,
  `arracoamIngeridas` FLOAT NOT NULL,
  `arracoamDesperdicadas` FLOAT NULL,
  `taxaCrescimento` DOUBLE NOT NULL,
  `taxaNatal` DOUBLE NOT NULL,
  `taxaMort` DOUBLE NOT NULL,
  `taxaManejo` DOUBLE NOT NULL,
  `vendaMeta` DOUBLE NOT NULL,
  `vendaAlcance` DOUBLE NOT NULL,
  `vendaMesAnt` DOUBLE NULL,
  PRIMARY KEY (`mes`, `ano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`RelInvestimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`RelInvestimento` (
  `mesRel` TINYINT NOT NULL,
  `anoRel` TINYINT NOT NULL,
  `lucroEsperado` DOUBLE NOT NULL,
  `lucroAlcance` DOUBLE NOT NULL,
  `descricao` VARCHAR(50) NULL,
  PRIMARY KEY (`mesRel`, `anoRel`),
  CONSTRAINT `RelInvest`
    FOREIGN KEY (`mesRel` , `anoRel`)
    REFERENCES `piscicultech`.`Relatorio` (`mes` , `ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`RelVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`RelVenda` (
  `mesRel` TINYINT NOT NULL,
  `anoRel` TINYINT NOT NULL,
  `valorUni` DOUBLE NOT NULL,
  `lucro` DOUBLE NOT NULL,
  `meta` DOUBLE NOT NULL,
  `despesas` DOUBLE NOT NULL,
  `qtdAnt` INT NULL,
  `qtd` INT NOT NULL,
  `especie` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`mesRel`, `anoRel`),
  CONSTRAINT `relVenda`
    FOREIGN KEY (`mesRel` , `anoRel`)
    REFERENCES `piscicultech`.`Relatorio` (`mes` , `ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`RelTanqEspecie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`RelTanqEspecie` (
  `idEspecie` INT NOT NULL,
  `mesRel` TINYINT NOT NULL,
  `anoRel` TINYINT NOT NULL,
  `idTanque` TINYINT NOT NULL,
  PRIMARY KEY (`idEspecie`, `idTanque`, `anoRel`, `mesRel`),
  INDEX `RelTernario_idx` (`mesRel` ASC, `anoRel` ASC),
  INDEX `TanqTernario_idx` (`idTanque` ASC),
  CONSTRAINT `RelTernario`
    FOREIGN KEY (`mesRel` , `anoRel`)
    REFERENCES `piscicultech`.`Relatorio` (`mes` , `ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TanqTernario`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EspTernario`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`RelAgua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`RelAgua` (
  `mesRel` TINYINT NOT NULL,
  `anoRel` TINYINT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `normal` FLOAT NOT NULL,
  `atual` FLOAT NOT NULL,
  `mesAnt` FLOAT NULL,
  PRIMARY KEY (`mesRel`, `anoRel`),
  CONSTRAINT `RelAgua`
    FOREIGN KEY (`mesRel` , `anoRel`)
    REFERENCES `piscicultech`.`Relatorio` (`mes` , `ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Despesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Despesa` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FornDesp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FornDesp` (
  `codDesp` INT NOT NULL,
  `codForn` INT NOT NULL,
  `precoUni` DOUBLE NULL,
  `total` DOUBLE NOT NULL,
  `qtd` INT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NOT NULL,
  PRIMARY KEY (`codDesp`, `codForn`),
  INDEX `FornDesp_idx` (`codForn` ASC),
  CONSTRAINT `FornDesp`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DespForn`
    FOREIGN KEY (`codDesp`)
    REFERENCES `piscicultech`.`Despesa` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Equipamento` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  `qtd` INT NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Conserto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Conserto` (
  `codForn` INT NOT NULL,
  `codEquip` INT NOT NULL,
  `inicio` DATE NOT NULL,
  `fim` DATE NULL,
  `hora` TIME NOT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NULL,
  `previsaoFim` DATE NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`codForn`, `codEquip`),
  INDEX `ConsertoEquip_idx` (`codEquip` ASC),
  CONSTRAINT `ConsertoFornec`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ConsertoEquip`
    FOREIGN KEY (`codEquip`)
    REFERENCES `piscicultech`.`Equipamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`VendaEquipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`VendaEquipamento` (
  `codEquip` INT NOT NULL,
  `codForn` INT NOT NULL,
  `dtVenda` DATE NOT NULL,
  `qtd` TINYINT NOT NULL,
  `valorUni` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  PRIMARY KEY (`codEquip`, `codForn`, `dtVenda`),
  INDEX `VendaEquipForn_idx` (`codForn` ASC),
  CONSTRAINT `VendaEquipForn`
    FOREIGN KEY (`codForn`)
    REFERENCES `piscicultech`.`Fornecedor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VendaEquipamento`
    FOREIGN KEY (`codEquip`)
    REFERENCES `piscicultech`.`Equipamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Empresa` (
  `cnpj` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `dtCriacao` DATE NOT NULL,
  `fundoInvestimento` DOUBLE NOT NULL,
  `numEnd` INT NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cep` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Comprador` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `numEnd` INT NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Negocio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Negocio` (
  `idEspecie` INT NOT NULL,
  `codComp` INT NOT NULL,
  `cnpjEmp` VARCHAR(14) NOT NULL,
  `qtd` TINYINT NOT NULL,
  `valorUni` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `biomassa` FLOAT NOT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NOT NULL,
  PRIMARY KEY (`idEspecie`, `codComp`, `cnpjEmp`),
  INDEX `NegocioEmpresa_idx` (`cnpjEmp` ASC),
  INDEX `NegocioComprador_idx` (`codComp` ASC),
  CONSTRAINT `NegocioEmpresa`
    FOREIGN KEY (`cnpjEmp`)
    REFERENCES `piscicultech`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NegocioComprador`
    FOREIGN KEY (`codComp`)
    REFERENCES `piscicultech`.`Comprador` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `NegocioEspecie`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FoneComp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FoneComp` (
  `codComp` INT NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codComp`),
  CONSTRAINT `FoneComprador`
    FOREIGN KEY (`codComp`)
    REFERENCES `piscicultech`.`Comprador` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FoneEmp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FoneEmp` (
  `cnpjEmp` VARCHAR(14) NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cnpjEmp`, `numero`),
  CONSTRAINT `FoneEmpresa`
    FOREIGN KEY (`cnpjEmp`)
    REFERENCES `piscicultech`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Proprietario` (
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(8) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `sexo` CHAR NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `imagem` VARCHAR(250) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `numEnd` INT NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cep` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`FoneProp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`FoneProp` (
  `cpfProp` VARCHAR(11) NOT NULL,
  `numero` VARCHAR(13) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cpfProp`, `numero`),
  CONSTRAINT `FoneProprietario`
    FOREIGN KEY (`cpfProp`)
    REFERENCES `piscicultech`.`Proprietario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Administracao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Administracao` (
  `cpfProprietario` VARCHAR(11) NOT NULL,
  `cnpjEmp` VARCHAR(14) NOT NULL,
  `inicio` DATE NOT NULL,
  `fim` DATE NULL,
  PRIMARY KEY (`cpfProprietario`, `cnpjEmp`),
  INDEX `AdminEmp_idx` (`cnpjEmp` ASC),
  CONSTRAINT `AdminProp`
    FOREIGN KEY (`cpfProprietario`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AdminEmp`
    FOREIGN KEY (`cnpjEmp`)
    REFERENCES `piscicultech`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`ImpTaxAlu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`ImpTaxAlu` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `valor` DOUBLE NOT NULL,
  `descricao` VARCHAR(50) NULL,
  `cobrador` VARCHAR(50) NOT NULL,
  `vencimento` DATE NOT NULL,
  `situacao` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`PagamentoImpTaxALu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`PagamentoImpTaxALu` (
  `codITA` INT NOT NULL,
  `cnpjEmp` VARCHAR(14) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `dia` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `ano` TINYINT NOT NULL,
  PRIMARY KEY (`codITA`, `cnpjEmp`),
  INDEX `PagamentoITAEmp_idx` (`cnpjEmp` ASC),
  CONSTRAINT `PagamentoITA`
    FOREIGN KEY (`codITA`)
    REFERENCES `piscicultech`.`ImpTaxAlu` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PagamentoITAEmp`
    FOREIGN KEY (`cnpjEmp`)
    REFERENCES `piscicultech`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`PagamentoFunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`PagamentoFunc` (
  `cpfFunc` VARCHAR(11) NOT NULL,
  `cnpjEmp` VARCHAR(14) NOT NULL,
  `dtPag` DATE NOT NULL,
  `vlrPago` DOUBLE NOT NULL,
  PRIMARY KEY (`cpfFunc`, `cnpjEmp`, `dtPag`),
  INDEX `PagEmp_idx` (`cnpjEmp` ASC),
  CONSTRAINT `PagFun`
    FOREIGN KEY (`cpfFunc`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PagEmp`
    FOREIGN KEY (`cnpjEmp`)
    REFERENCES `piscicultech`.`Empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Cargo` (
  `codigo` TINYINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `formaPag` VARCHAR(25) NOT NULL,
  `pagamento` DOUBLE NOT NULL,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Exercao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Exercao` (
  `cpfFunc` VARCHAR(11) NOT NULL,
  `codCargo` TINYINT NOT NULL,
  `inicio` DATE NOT NULL,
  `fim` DATE NULL,
  PRIMARY KEY (`cpfFunc`, `codCargo`, `inicio`),
  INDEX `CargoFunc_idx` (`codCargo` ASC),
  CONSTRAINT `FuncCargo`
    FOREIGN KEY (`cpfFunc`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CargoFunc`
    FOREIGN KEY (`codCargo`)
    REFERENCES `piscicultech`.`Cargo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`Tanque_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`Tanque_copy1` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NOT NULL,
  `situacao` TINYINT(1) NOT NULL,
  `revestimento` VARCHAR(25) NOT NULL,
  `material` VARCHAR(25) NOT NULL,
  `diaPeixam` TINYINT NOT NULL,
  `mesPeixam` TINYINT NOT NULL,
  `anoPeixam` TINYINT NOT NULL,
  `capacidade` DOUBLE NOT NULL,
  `vazao` DOUBLE NOT NULL,
  `profund` DOUBLE NOT NULL,
  `largura` DOUBLE NOT NULL,
  `comp` DOUBLE NOT NULL,
  `nitritoMin` FLOAT NULL,
  `nitritoMax` FLOAT NULL,
  `nitratoMin` FLOAT NULL,
  `nitratoMax` FLOAT NULL,
  `alcalinidadeMin` FLOAT NULL,
  `alcalinidadeMax` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `piscicultech`.`VerificacaoEsp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `piscicultech`.`VerificacaoEsp` (
  `idTanque` TINYINT NOT NULL,
  `cpfFunc` VARCHAR(11) NOT NULL,
  `idEspecie` INT NOT NULL,
  `hora` TIME NOT NULL,
  `dtVerif` DATE NOT NULL,
  `tamanhoMedio` FLOAT NOT NULL,
  `peso` FLOAT NOT NULL,
  `qtd` INT NOT NULL,
  `mortos` INT NOT NULL,
  `nascidos` INT NOT NULL,
  INDEX `EspecieAvaliada_idx` (`idEspecie` ASC),
  INDEX `TanqueAvaliadoEsp_idx` (`idTanque` ASC),
  INDEX `Avaliador_idx` (`cpfFunc` ASC),
  PRIMARY KEY (`idTanque`, `cpfFunc`, `idEspecie`, `hora`, `dtVerif`),
  CONSTRAINT `EspecieAvaliada`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `piscicultech`.`Especie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TanqueAvaliadoEsp`
    FOREIGN KEY (`idTanque`)
    REFERENCES `piscicultech`.`Tanque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Avaliador`
    FOREIGN KEY (`cpfFunc`)
    REFERENCES `piscicultech`.`Funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
