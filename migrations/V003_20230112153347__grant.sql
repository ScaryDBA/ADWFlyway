SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [HumanResources].[GettingData]'
GO
CREATE VIEW [HumanResources].[GettingData]
AS
SELECT BusinessEntityID,
       NationalIDNumber,
       LoginID,
       OrganizationNode,
       OrganizationLevel,
       JobTitle,
       BirthDate,
       MaritalStatus,
       Gender,
       HireDate,
       SalariedFlag,
       VacationHours,
       SickLeaveHours,
       CurrentFlag,
       rowguid,
       ModifiedDate FROM HumanResources.Employee;
GO

