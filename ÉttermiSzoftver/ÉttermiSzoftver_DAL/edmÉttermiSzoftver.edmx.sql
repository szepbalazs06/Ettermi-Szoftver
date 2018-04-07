
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/07/2018 11:50:24
-- Generated from EDMX file: C:\Users\Hw6-LW\Source\Repos\Ettermi-Szoftver\ÉttermiSzoftver\ÉttermiSzoftver_DAL\edmÉttermiSzoftver.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ÉttermiSzoftver];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'enSzemelyek'
CREATE TABLE [dbo].[enSzemelyek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [Pozicio] nvarchar(max)  NOT NULL,
    [Jelszo] nvarchar(max)  NOT NULL,
    [SzulDatum] datetime  NOT NULL
);
GO

-- Creating table 'enEtelek'
CREATE TABLE [dbo].[enEtelek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nev] nvarchar(max)  NOT NULL,
    [Ar] nvarchar(max)  NOT NULL,
    [Leiras] nvarchar(max)  NOT NULL,
    [Tipus] nvarchar(max)  NOT NULL,
    [KepURL] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'enMenuk'
CREATE TABLE [dbo].[enMenuk] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Datum] datetime  NOT NULL
);
GO

-- Creating table 'enRendelesek'
CREATE TABLE [dbo].[enRendelesek] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Asztal] nvarchar(max)  NOT NULL,
    [Allapot] tinyint  NOT NULL,
    [Megjegyzes] nvarchar(max)  NOT NULL,
    [Ido] datetime  NOT NULL,
    [Szamlaszam] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'enSzemelyenRendeles'
CREATE TABLE [dbo].[enSzemelyenRendeles] (
    [enSzemelyek_Id] int  NOT NULL,
    [enRendelesek_Id] int  NOT NULL
);
GO

-- Creating table 'enRendelesenEtel'
CREATE TABLE [dbo].[enRendelesenEtel] (
    [enRendelesek_Id] int  NOT NULL,
    [enEtelek_Id] int  NOT NULL
);
GO

-- Creating table 'enEtelenMenu'
CREATE TABLE [dbo].[enEtelenMenu] (
    [enEtelek_Id] int  NOT NULL,
    [enMenuk_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'enSzemelyek'
ALTER TABLE [dbo].[enSzemelyek]
ADD CONSTRAINT [PK_enSzemelyek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enEtelek'
ALTER TABLE [dbo].[enEtelek]
ADD CONSTRAINT [PK_enEtelek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enMenuk'
ALTER TABLE [dbo].[enMenuk]
ADD CONSTRAINT [PK_enMenuk]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enRendelesek'
ALTER TABLE [dbo].[enRendelesek]
ADD CONSTRAINT [PK_enRendelesek]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [enSzemelyek_Id], [enRendelesek_Id] in table 'enSzemelyenRendeles'
ALTER TABLE [dbo].[enSzemelyenRendeles]
ADD CONSTRAINT [PK_enSzemelyenRendeles]
    PRIMARY KEY CLUSTERED ([enSzemelyek_Id], [enRendelesek_Id] ASC);
GO

-- Creating primary key on [enRendelesek_Id], [enEtelek_Id] in table 'enRendelesenEtel'
ALTER TABLE [dbo].[enRendelesenEtel]
ADD CONSTRAINT [PK_enRendelesenEtel]
    PRIMARY KEY CLUSTERED ([enRendelesek_Id], [enEtelek_Id] ASC);
GO

-- Creating primary key on [enEtelek_Id], [enMenuk_Id] in table 'enEtelenMenu'
ALTER TABLE [dbo].[enEtelenMenu]
ADD CONSTRAINT [PK_enEtelenMenu]
    PRIMARY KEY CLUSTERED ([enEtelek_Id], [enMenuk_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [enSzemelyek_Id] in table 'enSzemelyenRendeles'
ALTER TABLE [dbo].[enSzemelyenRendeles]
ADD CONSTRAINT [FK_enSzemelyenRendeles_enSzemely]
    FOREIGN KEY ([enSzemelyek_Id])
    REFERENCES [dbo].[enSzemelyek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enRendelesek_Id] in table 'enSzemelyenRendeles'
ALTER TABLE [dbo].[enSzemelyenRendeles]
ADD CONSTRAINT [FK_enSzemelyenRendeles_enRendeles]
    FOREIGN KEY ([enRendelesek_Id])
    REFERENCES [dbo].[enRendelesek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enSzemelyenRendeles_enRendeles'
CREATE INDEX [IX_FK_enSzemelyenRendeles_enRendeles]
ON [dbo].[enSzemelyenRendeles]
    ([enRendelesek_Id]);
GO

-- Creating foreign key on [enRendelesek_Id] in table 'enRendelesenEtel'
ALTER TABLE [dbo].[enRendelesenEtel]
ADD CONSTRAINT [FK_enRendelesenEtel_enRendeles]
    FOREIGN KEY ([enRendelesek_Id])
    REFERENCES [dbo].[enRendelesek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enEtelek_Id] in table 'enRendelesenEtel'
ALTER TABLE [dbo].[enRendelesenEtel]
ADD CONSTRAINT [FK_enRendelesenEtel_enEtel]
    FOREIGN KEY ([enEtelek_Id])
    REFERENCES [dbo].[enEtelek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enRendelesenEtel_enEtel'
CREATE INDEX [IX_FK_enRendelesenEtel_enEtel]
ON [dbo].[enRendelesenEtel]
    ([enEtelek_Id]);
GO

-- Creating foreign key on [enEtelek_Id] in table 'enEtelenMenu'
ALTER TABLE [dbo].[enEtelenMenu]
ADD CONSTRAINT [FK_enEtelenMenu_enEtel]
    FOREIGN KEY ([enEtelek_Id])
    REFERENCES [dbo].[enEtelek]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enMenuk_Id] in table 'enEtelenMenu'
ALTER TABLE [dbo].[enEtelenMenu]
ADD CONSTRAINT [FK_enEtelenMenu_enMenu]
    FOREIGN KEY ([enMenuk_Id])
    REFERENCES [dbo].[enMenuk]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enEtelenMenu_enMenu'
CREATE INDEX [IX_FK_enEtelenMenu_enMenu]
ON [dbo].[enEtelenMenu]
    ([enMenuk_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------