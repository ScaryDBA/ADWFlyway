-- -====================================
-- Flyway Dry Run (2023-01-12 10:28:22)
-- -====================================

USE [ADWks]
GO
SET ANSI_NULLS ON
GO
USE [ADWks]
GO
SET ANSI_NULLS ON
GO
USE [ADWks]
GO
SET ANSI_NULLS ON
GO

-- Executing: validate (with callbacks)
-- ---------------------------------------------------------------------------------------
USE [ADWks]
GO
SET ANSI_NULLS ON
GO

-- Executing: migrate (with callbacks)
-- ---------------------------------------------------------------------------------------
USE [ADWks]
GO
SET ANSI_NULLS ON
GO

-- Executing: migrate -> v004.20230112155656 (with callbacks)
-- ---------------------------------------------------------------------------------------

-- Source: migrations\V004_20230112155656__grant.sql
-- --------------------------------------------------
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping [HumanResources].[GettingData]'
GO
DROP VIEW [HumanResources].[GettingData]
GO
INSERT INTO [ADWks].[dbo].[flyway_schema_history] ([installed_rank], [version], [description], [type], [script], [checksum], [installed_by], [execution_time], [success]) VALUES (10, '004.20230112155656', 'grant', 'SQL', 'V004_20230112155656__grant.sql', 328750041, 'sa', 10, 1)
GO
USE [ADWks]
GO
SET ANSI_NULLS ON
GO
