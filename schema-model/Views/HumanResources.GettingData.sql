SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
