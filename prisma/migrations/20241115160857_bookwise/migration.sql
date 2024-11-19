-- CreateTable
CREATE TABLE `agendamento` (
    `CodAge` INTEGER NOT NULL,
    `DatHor` DATETIME(0) NOT NULL,
    `Status` VARCHAR(45) NULL,
    `Cliente_CodCli` INTEGER NOT NULL,
    `Atendentes_CodAte` INTEGER NOT NULL,
    `Servicos_CodSer` INTEGER NOT NULL,

    INDEX `fk_Agendamento_Atendentes1_idx`(`Atendentes_CodAte`),
    INDEX `fk_Agendamento_Cliente1_idx`(`Cliente_CodCli`),
    INDEX `fk_Agendamento_Servicos1_idx`(`Servicos_CodSer`),
    PRIMARY KEY (`CodAge`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `apontamento` (
    `CodApo` INTEGER NOT NULL,
    `DatApo` DATETIME(0) NOT NULL,
    `Observacoes` VARCHAR(45) NULL,
    `Agendamento_CodAge` INTEGER NOT NULL,

    INDEX `fk_Apontamento_Agendamento1_idx`(`Agendamento_CodAge`),
    PRIMARY KEY (`CodApo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `atendentes` (
    `CodAte` INTEGER NOT NULL,
    `NomAte` VARCHAR(45) NOT NULL,
    `EmaAte` VARCHAR(45) NULL,
    `TelAte` VARCHAR(15) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Atendentes_Empresa1_idx`(`Empresa_CodEmp`),
    PRIMARY KEY (`CodAte`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cliente` (
    `CodCli` INTEGER NOT NULL,
    `NomCli` VARCHAR(100) NOT NULL,
    `EmaCli` VARCHAR(45) NULL,
    `TelCli` VARCHAR(15) NULL,
    `DatCad` DATETIME(0) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,
    `LogEnd` VARCHAR(100) NULL,
    `NumEnd` INTEGER NULL,
    `BaiEnd` VARCHAR(45) NULL,
    `CidEnd` VARCHAR(45) NULL,
    `EstEnd` VARCHAR(2) NULL,
    `Endereco_CodCep` INTEGER NOT NULL,

    INDEX `fk_Cliente_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Cliente_Endereco1_idx`(`Endereco_CodCep`),
    PRIMARY KEY (`CodCli`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `configuracao_empresa` (
    `CodCon` INTEGER NOT NULL,
    `cod_fus` VARCHAR(45) NOT NULL,
    `MaxAge` VARCHAR(45) NOT NULL,
    `DiaUte` VARCHAR(45) NULL,
    `HorIni` DATETIME(0) NULL,
    `HorFim` DATETIME(0) NULL,
    `EnvNot` VARCHAR(45) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,
    `RelApo` VARCHAR(45) NOT NULL,

    INDEX `fk_Configuracao_empresa_Empresa1_idx`(`Empresa_CodEmp`),
    PRIMARY KEY (`CodCon`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `empresa` (
    `CodEmp` INTEGER NOT NULL AUTO_INCREMENT,
    `NomEmp` VARCHAR(100) NOT NULL,
    `NomRam` VARCHAR(100) NULL,
    `CpfCnp` VARCHAR(14) NOT NULL,
    `LogEnd` VARCHAR(100) NULL,
    `NumEnd` INTEGER NULL,
    `BaiEnd` VARCHAR(45) NULL,
    `CidEnd` VARCHAR(45) NULL,
    `EstEnd` VARCHAR(2) NULL,
    `TelEmp` VARCHAR(15) NOT NULL,
    `AdmEmp` VARCHAR(45) NOT NULL,
    `TelAdm` VARCHAR(15) NULL,
    `Endereco_CodCep` INTEGER NOT NULL,
    `TipEmp` VARCHAR(1) NULL,

    UNIQUE INDEX `empresa_CodEmp_key`(`CodEmp`),
    UNIQUE INDEX `empresa_CpfCnp_key`(`CpfCnp`),
    INDEX `fk_Empresa_Endereco1_idx`(`Endereco_CodCep`),
    PRIMARY KEY (`CodEmp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `endereco` (
    `CodCep` INTEGER NOT NULL,
    `LogEnd` VARCHAR(100) NULL,
    `BaiEnd` VARCHAR(45) NULL,
    `CidEnd` VARCHAR(45) NULL,
    `EstEnd` VARCHAR(2) NULL,
    `PaiEnd` VARCHAR(45) NULL,

    PRIMARY KEY (`CodCep`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `estoque` (
    `CodEst` INTEGER NOT NULL,
    `QtdEst` DECIMAL(5, 2) NULL,
    `LocEst` VARCHAR(45) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,
    `Produtos_CodPro` INTEGER NOT NULL,

    INDEX `fk_Estoque_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Estoque_Produtos1_idx`(`Produtos_CodPro`),
    PRIMARY KEY (`CodEst`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fornecedor` (
    `CodFor` INTEGER NOT NULL,
    `NomFor` VARCHAR(100) NOT NULL,
    `TelFor` VARCHAR(15) NULL,
    `EmaFor` VARCHAR(100) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,
    `LogEnd` VARCHAR(100) NULL,
    `NumEnd` INTEGER NULL,
    `BaiEnd` VARCHAR(45) NULL,
    `CidEnd` VARCHAR(45) NULL,
    `EstEnd` VARCHAR(2) NULL,
    `Endereco_CodCep` INTEGER NOT NULL,

    INDEX `fk_Fornecedor_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Fornecedor_Endereco1_idx`(`Endereco_CodCep`),
    PRIMARY KEY (`CodFor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `grupo_usuario` (
    `CodGru` INTEGER NOT NULL AUTO_INCREMENT,
    `NomGru` VARCHAR(45) NOT NULL,
    `DesGru` VARCHAR(45) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Grupo_usuario_Empresa1_idx`(`Empresa_CodEmp`),
    PRIMARY KEY (`CodGru`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_pedido_fornecedor` (
    `CodIpf` INTEGER NOT NULL,
    `QtdIpf` INTEGER NULL,
    `PreUni` DECIMAL(10, 2) NULL,
    `Produtos_CodPro` INTEGER NOT NULL,
    `Pedido_Fornecedor_CodPef` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Item_Pedido_Fornecedor_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Item_Pedido_Fornecedor_Pedido_Fornecedor1_idx`(`Pedido_Fornecedor_CodPef`),
    INDEX `fk_Item_Pedido_Fornecedor_Produtos1_idx`(`Produtos_CodPro`),
    PRIMARY KEY (`CodIpf`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lista_espera` (
    `CodEsp` INTEGER NOT NULL,
    `DatEsp` DATETIME(0) NULL,
    `Servicos_CodSer` INTEGER NOT NULL,
    `Atendentes_CodAte` INTEGER NOT NULL,

    INDEX `fk_Lista_Espera_Atendentes1_idx`(`Atendentes_CodAte`),
    INDEX `fk_Lista_Espera_Servicos1_idx`(`Servicos_CodSer`),
    PRIMARY KEY (`CodEsp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `movimentacao_estoque` (
    `CodMov` INTEGER NOT NULL,
    `TipMov` VARCHAR(1) NULL,
    `QtdMov` DECIMAL(5, 2) NULL,
    `DatMov` DATETIME(0) NULL,
    `ObsMov` VARCHAR(45) NULL,
    `Estoque_CodEst` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Movimentacao_Estoque_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Movimentacao_Estoque_Estoque1_idx`(`Estoque_CodEst`),
    PRIMARY KEY (`CodMov`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notificacao` (
    `CodNot` INTEGER NOT NULL,
    `DatNot` DATETIME(0) NOT NULL,
    `StaNot` VARCHAR(1) NOT NULL,
    `MenNot` VARCHAR(200) NULL,
    `Agendamento_CodAge` INTEGER NOT NULL,
    `SeqNot` INTEGER NOT NULL,

    INDEX `fk_Notificacao_Agendamento1_idx`(`Agendamento_CodAge`),
    PRIMARY KEY (`CodNot`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pedido_fornecedor` (
    `CodPef` INTEGER NOT NULL,
    `DatPed` DATETIME(0) NOT NULL,
    `Status` VARCHAR(45) NOT NULL,
    `Fornecedor_CodFor` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Pedido-Fornecedor_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Pedido-Fornecedor_Fornecedor1_idx`(`Fornecedor_CodFor`),
    PRIMARY KEY (`CodPef`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissao` (
    `CodPer` INTEGER NOT NULL,
    `DesPer` VARCHAR(45) NOT NULL,
    `Grupo_usuario_CodGru` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Permissao_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Permissao_Grupo_usuario_idx`(`Grupo_usuario_CodGru`),
    PRIMARY KEY (`CodPer`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produtos` (
    `CodPro` INTEGER NOT NULL,
    `NomPro` VARCHAR(45) NOT NULL,
    `DesPro` VARCHAR(45) NULL,
    `PreUni` DECIMAL(10, 2) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Produtos_Empresa1_idx`(`Empresa_CodEmp`),
    PRIMARY KEY (`CodPro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `servicos` (
    `CodSer` INTEGER NOT NULL,
    `NomSer` VARCHAR(45) NOT NULL,
    `DesSer` VARCHAR(45) NULL,
    `Preuni` DECIMAL(10, 2) NULL,
    `Tipo_Servicos_Codtip` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Servicos_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Servicos_Tipo_Servicos1_idx`(`Tipo_Servicos_Codtip`),
    PRIMARY KEY (`CodSer`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipo_servicos` (
    `Codtip` INTEGER NOT NULL,
    `NomTip` VARCHAR(45) NOT NULL,
    `DesTip` VARCHAR(45) NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Tipo_Servicos_Empresa1_idx`(`Empresa_CodEmp`),
    PRIMARY KEY (`Codtip`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuarios` (
    `Codusu` INTEGER NOT NULL AUTO_INCREMENT,
    `Nomusu` VARCHAR(100) NOT NULL,
    `DesEma` VARCHAR(100) NULL,
    `CodSen` VARCHAR(45) NOT NULL,
    `Grupo_usuario_CodGru` INTEGER NOT NULL,
    `Empresa_CodEmp` INTEGER NOT NULL,

    INDEX `fk_Usuarios_Empresa1_idx`(`Empresa_CodEmp`),
    INDEX `fk_Usuarios_Grupo_usuario1_idx`(`Grupo_usuario_CodGru`),
    PRIMARY KEY (`Codusu`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `fk_Agendamento_Atendentes1` FOREIGN KEY (`Atendentes_CodAte`) REFERENCES `atendentes`(`CodAte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `fk_Agendamento_Cliente1` FOREIGN KEY (`Cliente_CodCli`) REFERENCES `cliente`(`CodCli`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `agendamento` ADD CONSTRAINT `fk_Agendamento_Servicos1` FOREIGN KEY (`Servicos_CodSer`) REFERENCES `servicos`(`CodSer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `apontamento` ADD CONSTRAINT `fk_Apontamento_Agendamento1` FOREIGN KEY (`Agendamento_CodAge`) REFERENCES `agendamento`(`CodAge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `atendentes` ADD CONSTRAINT `fk_Atendentes_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `fk_Cliente_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cliente` ADD CONSTRAINT `fk_Cliente_Endereco1` FOREIGN KEY (`Endereco_CodCep`) REFERENCES `endereco`(`CodCep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `configuracao_empresa` ADD CONSTRAINT `fk_Configuracao_empresa_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `empresa` ADD CONSTRAINT `fk_Empresa_Endereco1` FOREIGN KEY (`Endereco_CodCep`) REFERENCES `endereco`(`CodCep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `estoque` ADD CONSTRAINT `fk_Estoque_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `estoque` ADD CONSTRAINT `fk_Estoque_Produtos1` FOREIGN KEY (`Produtos_CodPro`) REFERENCES `produtos`(`CodPro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fornecedor` ADD CONSTRAINT `fk_Fornecedor_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fornecedor` ADD CONSTRAINT `fk_Fornecedor_Endereco1` FOREIGN KEY (`Endereco_CodCep`) REFERENCES `endereco`(`CodCep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `grupo_usuario` ADD CONSTRAINT `fk_Grupo_usuario_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `item_pedido_fornecedor` ADD CONSTRAINT `fk_Item_Pedido_Fornecedor_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `item_pedido_fornecedor` ADD CONSTRAINT `fk_Item_Pedido_Fornecedor_Pedido_Fornecedor1` FOREIGN KEY (`Pedido_Fornecedor_CodPef`) REFERENCES `pedido_fornecedor`(`CodPef`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `item_pedido_fornecedor` ADD CONSTRAINT `fk_Item_Pedido_Fornecedor_Produtos1` FOREIGN KEY (`Produtos_CodPro`) REFERENCES `produtos`(`CodPro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `lista_espera` ADD CONSTRAINT `fk_Lista_Espera_Atendentes1` FOREIGN KEY (`Atendentes_CodAte`) REFERENCES `atendentes`(`CodAte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `lista_espera` ADD CONSTRAINT `fk_Lista_Espera_Servicos1` FOREIGN KEY (`Servicos_CodSer`) REFERENCES `servicos`(`CodSer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `movimentacao_estoque` ADD CONSTRAINT `fk_Movimentacao_Estoque_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `movimentacao_estoque` ADD CONSTRAINT `fk_Movimentacao_Estoque_Estoque1` FOREIGN KEY (`Estoque_CodEst`) REFERENCES `estoque`(`CodEst`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `notificacao` ADD CONSTRAINT `fk_Notificacao_Agendamento1` FOREIGN KEY (`Agendamento_CodAge`) REFERENCES `agendamento`(`CodAge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pedido_fornecedor` ADD CONSTRAINT `fk_Pedido-Fornecedor_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `pedido_fornecedor` ADD CONSTRAINT `fk_Pedido-Fornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_CodFor`) REFERENCES `fornecedor`(`CodFor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permissao` ADD CONSTRAINT `fk_Permissao_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permissao` ADD CONSTRAINT `fk_Permissao_Grupo_usuario` FOREIGN KEY (`Grupo_usuario_CodGru`) REFERENCES `grupo_usuario`(`CodGru`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `produtos` ADD CONSTRAINT `fk_Produtos_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `servicos` ADD CONSTRAINT `fk_Servicos_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `servicos` ADD CONSTRAINT `fk_Servicos_Tipo_Servicos1` FOREIGN KEY (`Tipo_Servicos_Codtip`) REFERENCES `tipo_servicos`(`Codtip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tipo_servicos` ADD CONSTRAINT `fk_Tipo_Servicos_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `fk_Usuarios_Empresa1` FOREIGN KEY (`Empresa_CodEmp`) REFERENCES `empresa`(`CodEmp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `fk_Usuarios_Grupo_usuario1` FOREIGN KEY (`Grupo_usuario_CodGru`) REFERENCES `grupo_usuario`(`CodGru`) ON DELETE NO ACTION ON UPDATE NO ACTION;
