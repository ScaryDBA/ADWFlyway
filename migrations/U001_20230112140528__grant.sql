SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping full text indexing from column [Resume] on [HumanResources].[JobCandidate]'
GO
ALTER FULLTEXT INDEX ON [HumanResources].[JobCandidate] DROP ([Resume])
GO
PRINT N'Dropping full text indexing from column [DocumentSummary] on [Production].[Document]'
GO
ALTER FULLTEXT INDEX ON [Production].[Document] DROP ([DocumentSummary])
GO
PRINT N'Dropping full text indexing from column [Document] on [Production].[Document]'
GO
ALTER FULLTEXT INDEX ON [Production].[Document] DROP ([Document])
GO
PRINT N'Dropping full text indexing from column [Comments] on [Production].[ProductReview]'
GO
ALTER FULLTEXT INDEX ON [Production].[ProductReview] DROP ([Comments])
GO
PRINT N'Dropping full text indexing from [HumanResources].[JobCandidate]'
GO
DROP FULLTEXT INDEX ON [HumanResources].[JobCandidate]
GO
PRINT N'Dropping full text indexing from [Production].[Document]'
GO
DROP FULLTEXT INDEX ON [Production].[Document]
GO
PRINT N'Dropping full text indexing from [Production].[ProductReview]'
GO
DROP FULLTEXT INDEX ON [Production].[ProductReview]
GO
PRINT N'Dropping full text catalog AW2016FullTextCatalog'
GO
DROP FULLTEXT CATALOG [AW2016FullTextCatalog]
GO
PRINT N'Removing schema binding from [Production].[vProductAndDescription]'
GO

ALTER VIEW [Production].[vProductAndDescription] 
AS 
-- View (indexed or standard) to display products and product descriptions by language.
SELECT 
    p.[ProductID] 
    ,p.[Name] 
    ,pm.[Name] AS [ProductModel] 
    ,pmx.[CultureID] 
    ,pd.[Description] 
FROM [Production].[Product] p 
    INNER JOIN [Production].[ProductModel] pm 
    ON p.[ProductModelID] = pm.[ProductModelID] 
    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 
    ON pm.[ProductModelID] = pmx.[ProductModelID] 
    INNER JOIN [Production].[ProductDescription] pd 
    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];
GO
PRINT N'Removing schema binding from [Person].[vStateProvinceCountryRegion]'
GO

ALTER VIEW [Person].[vStateProvinceCountryRegion] 
AS 
SELECT 
    sp.[StateProvinceID] 
    ,sp.[StateProvinceCode] 
    ,sp.[IsOnlyStateProvinceFlag] 
    ,sp.[Name] AS [StateProvinceName] 
    ,sp.[TerritoryID] 
    ,cr.[CountryRegionCode] 
    ,cr.[Name] AS [CountryRegionName]
FROM [Person].[StateProvince] sp 
    INNER JOIN [Person].[CountryRegion] cr 
    ON sp.[CountryRegionCode] = cr.[CountryRegionCode];
GO
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_Description', NULL, NULL, NULL, NULL, NULL, NULL
GO
PRINT N'Dropping foreign keys from [HumanResources].[EmployeeDepartmentHistory]'
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]
GO
PRINT N'Dropping foreign keys from [HumanResources].[EmployeePayHistory]'
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] DROP CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [HumanResources].[JobCandidate]'
GO
ALTER TABLE [HumanResources].[JobCandidate] DROP CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [FK_Document_Employee_Owner]
GO
PRINT N'Dropping foreign keys from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping foreign keys from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [FK_Employee_Person_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Person].[BusinessEntityAddress]'
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID]
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID]
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping foreign keys from [Person].[Address]'
GO
ALTER TABLE [Person].[Address] DROP CONSTRAINT [FK_Address_StateProvince_StateProvinceID]
GO
PRINT N'Dropping foreign keys from [Person].[BusinessEntityContact]'
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [FK_BusinessEntityContact_Person_PersonID]
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID]
GO
PRINT N'Dropping foreign keys from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Sales].[Store]'
GO
ALTER TABLE [Sales].[Store] DROP CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID]
GO
ALTER TABLE [Sales].[Store] DROP CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]
GO
PRINT N'Dropping foreign keys from [Person].[StateProvince]'
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping foreign keys from [Sales].[CountryRegionCurrency]'
GO
ALTER TABLE [Sales].[CountryRegionCurrency] DROP CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
GO
ALTER TABLE [Sales].[CountryRegionCurrency] DROP CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode]
GO
PRINT N'Dropping foreign keys from [Person].[EmailAddress]'
GO
ALTER TABLE [Person].[EmailAddress] DROP CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Person].[Password]'
GO
ALTER TABLE [Person].[Password] DROP CONSTRAINT [FK_Password_Person_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Person].[PersonPhone]'
GO
ALTER TABLE [Person].[PersonPhone] DROP CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]
GO
ALTER TABLE [Person].[PersonPhone] DROP CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]
GO
PRINT N'Dropping foreign keys from [Sales].[Customer]'
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [FK_Customer_Person_PersonID]
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [FK_Customer_Store_StoreID]
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping foreign keys from [Sales].[PersonCreditCard]'
GO
ALTER TABLE [Sales].[PersonCreditCard] DROP CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID]
GO
ALTER TABLE [Sales].[PersonCreditCard] DROP CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]
GO
PRINT N'Dropping foreign keys from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
GO
PRINT N'Dropping foreign keys from [Production].[ProductModelProductDescriptionCulture]'
GO
ALTER TABLE [Production].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID]
GO
ALTER TABLE [Production].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
GO
ALTER TABLE [Production].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductDocument]'
GO
ALTER TABLE [Production].[ProductDocument] DROP CONSTRAINT [FK_ProductDocument_Document_DocumentNode]
GO
ALTER TABLE [Production].[ProductDocument] DROP CONSTRAINT [FK_ProductDocument_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductModelIllustration]'
GO
ALTER TABLE [Production].[ProductModelIllustration] DROP CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID]
GO
ALTER TABLE [Production].[ProductModelIllustration] DROP CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [FK_ProductInventory_Location_LocationID]
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [FK_ProductInventory_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductSubcategory]'
GO
ALTER TABLE [Production].[ProductSubcategory] DROP CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductCostHistory]'
GO
ALTER TABLE [Production].[ProductCostHistory] DROP CONSTRAINT [FK_ProductCostHistory_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductListPriceHistory]'
GO
ALTER TABLE [Production].[ProductListPriceHistory] DROP CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID]
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]
GO
PRINT N'Dropping foreign keys from [Production].[ProductProductPhoto]'
GO
ALTER TABLE [Production].[ProductProductPhoto] DROP CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
GO
ALTER TABLE [Production].[ProductProductPhoto] DROP CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[ProductReview]'
GO
ALTER TABLE [Production].[ProductReview] DROP CONSTRAINT [FK_ProductReview_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [FK_TransactionHistory_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_Product_ProductID]
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID]
GO
PRINT N'Dropping foreign keys from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_Product_ProductID]
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]
GO
PRINT N'Dropping foreign keys from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]
GO
PRINT N'Dropping foreign keys from [Sales].[SpecialOfferProduct]'
GO
ALTER TABLE [Sales].[SpecialOfferProduct] DROP CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]
GO
ALTER TABLE [Sales].[SpecialOfferProduct] DROP CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
GO
PRINT N'Dropping foreign keys from [Sales].[CurrencyRate]'
GO
ALTER TABLE [Sales].[CurrencyRate] DROP CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
GO
ALTER TABLE [Sales].[CurrencyRate] DROP CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesOrderHeaderSalesReason]'
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesPersonQuotaHistory]'
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] DROP CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]
GO
PRINT N'Dropping foreign keys from [Sales].[SalesTerritoryHistory]'
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping XML index [XMLPATH_Person_Demographics] from [Person].[Person]'
GO
DROP INDEX [XMLPATH_Person_Demographics] ON [Person].[Person]
GO
PRINT N'Dropping XML index [XMLPROPERTY_Person_Demographics] from [Person].[Person]'
GO
DROP INDEX [XMLPROPERTY_Person_Demographics] ON [Person].[Person]
GO
PRINT N'Dropping XML index [XMLVALUE_Person_Demographics] from [Person].[Person]'
GO
DROP INDEX [XMLVALUE_Person_Demographics] ON [Person].[Person]
GO
PRINT N'Dropping XML index [PXML_Person_AddContact] from [Person].[Person]'
GO
DROP INDEX [PXML_Person_AddContact] ON [Person].[Person]
GO
PRINT N'Dropping XML index [PXML_Person_Demographics] from [Person].[Person]'
GO
DROP INDEX [PXML_Person_Demographics] ON [Person].[Person]
GO
PRINT N'Dropping XML index [PXML_ProductModel_Instructions] from [Production].[ProductModel]'
GO
DROP INDEX [PXML_ProductModel_Instructions] ON [Production].[ProductModel]
GO
PRINT N'Dropping XML index [PXML_ProductModel_CatalogDescription] from [Production].[ProductModel]'
GO
DROP INDEX [PXML_ProductModel_CatalogDescription] ON [Production].[ProductModel]
GO
PRINT N'Dropping XML index [PXML_Store_Demographics] from [Sales].[Store]'
GO
DROP INDEX [PXML_Store_Demographics] ON [Sales].[Store]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeeDepartmentHistory]'
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeePayHistory]'
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] DROP CONSTRAINT [CK_EmployeePayHistory_Rate]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeePayHistory]'
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] DROP CONSTRAINT [CK_EmployeePayHistory_PayFrequency]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_MaritalStatus]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_Gender]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_VacationHours]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_SickLeaveHours]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_BirthDate]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [CK_Employee_HireDate]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [CK_Person_PersonType]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [CK_Person_EmailPromotion]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [CK_BillOfMaterials_BOMLevel]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [CK_BillOfMaterials_EndDate]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [CK_Document_Status]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [CK_Location_CostRate]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [CK_Location_Availability]
GO
PRINT N'Dropping constraints from [Production].[ProductCostHistory]'
GO
ALTER TABLE [Production].[ProductCostHistory] DROP CONSTRAINT [CK_ProductCostHistory_StandardCost]
GO
PRINT N'Dropping constraints from [Production].[ProductCostHistory]'
GO
ALTER TABLE [Production].[ProductCostHistory] DROP CONSTRAINT [CK_ProductCostHistory_EndDate]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [CK_ProductInventory_Shelf]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [CK_ProductInventory_Bin]
GO
PRINT N'Dropping constraints from [Production].[ProductListPriceHistory]'
GO
ALTER TABLE [Production].[ProductListPriceHistory] DROP CONSTRAINT [CK_ProductListPriceHistory_ListPrice]
GO
PRINT N'Dropping constraints from [Production].[ProductListPriceHistory]'
GO
ALTER TABLE [Production].[ProductListPriceHistory] DROP CONSTRAINT [CK_ProductListPriceHistory_EndDate]
GO
PRINT N'Dropping constraints from [Production].[ProductReview]'
GO
ALTER TABLE [Production].[ProductReview] DROP CONSTRAINT [CK_ProductReview_Rating]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_SafetyStockLevel]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_ReorderPoint]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_StandardCost]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_ListPrice]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_Weight]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_DaysToManufacture]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_ProductLine]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_Class]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_Style]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [CK_Product_SellEndDate]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistoryArchive]'
GO
ALTER TABLE [Production].[TransactionHistoryArchive] DROP CONSTRAINT [CK_TransactionHistoryArchive_TransactionType]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [CK_TransactionHistory_TransactionType]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [CK_WorkOrderRouting_PlannedCost]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [CK_WorkOrderRouting_ActualCost]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [CK_WorkOrderRouting_ActualEndDate]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate]
GO
PRINT N'Dropping constraints from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [CK_WorkOrder_OrderQty]
GO
PRINT N'Dropping constraints from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [CK_WorkOrder_ScrappedQty]
GO
PRINT N'Dropping constraints from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [CK_WorkOrder_EndDate]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_AverageLeadTime]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_StandardPrice]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_LastReceiptCost]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_MinOrderQty]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_MaxOrderQty]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [CK_ProductVendor_OnOrderQty]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [CK_PurchaseOrderDetail_OrderQty]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [CK_PurchaseOrderDetail_UnitPrice]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [CK_PurchaseOrderDetail_ReceivedQty]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [CK_PurchaseOrderDetail_RejectedQty]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [CK_PurchaseOrderHeader_Status]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [CK_PurchaseOrderHeader_SubTotal]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [CK_PurchaseOrderHeader_TaxAmt]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [CK_PurchaseOrderHeader_Freight]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [CK_PurchaseOrderHeader_ShipDate]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [CK_ShipMethod_ShipBase]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [CK_ShipMethod_ShipRate]
GO
PRINT N'Dropping constraints from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [CK_Vendor_CreditRating]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [CK_SalesOrderDetail_OrderQty]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [CK_SalesOrderDetail_UnitPrice]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [CK_SalesOrderDetail_UnitPriceDiscount]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_Status]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_SubTotal]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_TaxAmt]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_Freight]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_DueDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [CK_SalesOrderHeader_ShipDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesPersonQuotaHistory]'
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] DROP CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [CK_SalesPerson_SalesQuota]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [CK_SalesPerson_Bonus]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [CK_SalesPerson_CommissionPct]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [CK_SalesPerson_SalesYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [CK_SalesPerson_SalesLastYear]
GO
PRINT N'Dropping constraints from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [CK_SalesTaxRate_TaxType]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritoryHistory]'
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [CK_SalesTerritoryHistory_EndDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [CK_SalesTerritory_SalesYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [CK_SalesTerritory_SalesLastYear]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [CK_SalesTerritory_CostYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [CK_SalesTerritory_CostLastYear]
GO
PRINT N'Dropping constraints from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [CK_ShoppingCartItem_Quantity]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [CK_SpecialOffer_DiscountPct]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [CK_SpecialOffer_MinQty]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [CK_SpecialOffer_MaxQty]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [CK_SpecialOffer_EndDate]
GO
PRINT N'Dropping constraints from [HumanResources].[Department]'
GO
ALTER TABLE [HumanResources].[Department] DROP CONSTRAINT [PK_Department_DepartmentID]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeeDepartmentHistory]'
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeePayHistory]'
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] DROP CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [PK_Employee_BusinessEntityID]
GO
PRINT N'Dropping constraints from [HumanResources].[JobCandidate]'
GO
ALTER TABLE [HumanResources].[JobCandidate] DROP CONSTRAINT [PK_JobCandidate_JobCandidateID]
GO
PRINT N'Dropping constraints from [HumanResources].[Shift]'
GO
ALTER TABLE [HumanResources].[Shift] DROP CONSTRAINT [PK_Shift_ShiftID]
GO
PRINT N'Dropping constraints from [Person].[AddressType]'
GO
ALTER TABLE [Person].[AddressType] DROP CONSTRAINT [PK_AddressType_AddressTypeID]
GO
PRINT N'Dropping constraints from [Person].[Address]'
GO
ALTER TABLE [Person].[Address] DROP CONSTRAINT [PK_Address_AddressID]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityAddress]'
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityContact]'
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntity]'
GO
ALTER TABLE [Person].[BusinessEntity] DROP CONSTRAINT [PK_BusinessEntity_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Person].[ContactType]'
GO
ALTER TABLE [Person].[ContactType] DROP CONSTRAINT [PK_ContactType_ContactTypeID]
GO
PRINT N'Dropping constraints from [Person].[CountryRegion]'
GO
ALTER TABLE [Person].[CountryRegion] DROP CONSTRAINT [PK_CountryRegion_CountryRegionCode]
GO
PRINT N'Dropping constraints from [Person].[EmailAddress]'
GO
ALTER TABLE [Person].[EmailAddress] DROP CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID]
GO
PRINT N'Dropping constraints from [Person].[Password]'
GO
ALTER TABLE [Person].[Password] DROP CONSTRAINT [PK_Password_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Person].[PersonPhone]'
GO
ALTER TABLE [Person].[PersonPhone] DROP CONSTRAINT [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [PK_Person_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Person].[PhoneNumberType]'
GO
ALTER TABLE [Person].[PhoneNumberType] DROP CONSTRAINT [PK_PhoneNumberType_PhoneNumberTypeID]
GO
PRINT N'Dropping constraints from [Person].[StateProvince]'
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [PK_StateProvince_StateProvinceID]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID]
GO
PRINT N'Dropping constraints from [Production].[Culture]'
GO
ALTER TABLE [Production].[Culture] DROP CONSTRAINT [PK_Culture_CultureID]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [PK_Document_DocumentNode]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [UQ__Document__F73921F7C5112C2E]
GO
PRINT N'Dropping constraints from [Production].[Illustration]'
GO
ALTER TABLE [Production].[Illustration] DROP CONSTRAINT [PK_Illustration_IllustrationID]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [PK_Location_LocationID]
GO
PRINT N'Dropping constraints from [Production].[ProductCategory]'
GO
ALTER TABLE [Production].[ProductCategory] DROP CONSTRAINT [PK_ProductCategory_ProductCategoryID]
GO
PRINT N'Dropping constraints from [Production].[ProductCostHistory]'
GO
ALTER TABLE [Production].[ProductCostHistory] DROP CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate]
GO
PRINT N'Dropping constraints from [Production].[ProductDescription]'
GO
ALTER TABLE [Production].[ProductDescription] DROP CONSTRAINT [PK_ProductDescription_ProductDescriptionID]
GO
PRINT N'Dropping constraints from [Production].[ProductDocument]'
GO
ALTER TABLE [Production].[ProductDocument] DROP CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [PK_ProductInventory_ProductID_LocationID]
GO
PRINT N'Dropping constraints from [Production].[ProductListPriceHistory]'
GO
ALTER TABLE [Production].[ProductListPriceHistory] DROP CONSTRAINT [PK_ProductListPriceHistory_ProductID_StartDate]
GO
PRINT N'Dropping constraints from [Production].[ProductModelIllustration]'
GO
ALTER TABLE [Production].[ProductModelIllustration] DROP CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID]
GO
PRINT N'Dropping constraints from [Production].[ProductModelProductDescriptionCulture]'
GO
ALTER TABLE [Production].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID]
GO
PRINT N'Dropping constraints from [Production].[ProductModel]'
GO
ALTER TABLE [Production].[ProductModel] DROP CONSTRAINT [PK_ProductModel_ProductModelID]
GO
PRINT N'Dropping constraints from [Production].[ProductPhoto]'
GO
ALTER TABLE [Production].[ProductPhoto] DROP CONSTRAINT [PK_ProductPhoto_ProductPhotoID]
GO
PRINT N'Dropping constraints from [Production].[ProductProductPhoto]'
GO
ALTER TABLE [Production].[ProductProductPhoto] DROP CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID]
GO
PRINT N'Dropping constraints from [Production].[ProductReview]'
GO
ALTER TABLE [Production].[ProductReview] DROP CONSTRAINT [PK_ProductReview_ProductReviewID]
GO
PRINT N'Dropping constraints from [Production].[ProductSubcategory]'
GO
ALTER TABLE [Production].[ProductSubcategory] DROP CONSTRAINT [PK_ProductSubcategory_ProductSubcategoryID]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [PK_Product_ProductID]
GO
PRINT N'Dropping constraints from [Production].[ScrapReason]'
GO
ALTER TABLE [Production].[ScrapReason] DROP CONSTRAINT [PK_ScrapReason_ScrapReasonID]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistoryArchive]'
GO
ALTER TABLE [Production].[TransactionHistoryArchive] DROP CONSTRAINT [PK_TransactionHistoryArchive_TransactionID]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [PK_TransactionHistory_TransactionID]
GO
PRINT N'Dropping constraints from [Production].[UnitMeasure]'
GO
ALTER TABLE [Production].[UnitMeasure] DROP CONSTRAINT [PK_UnitMeasure_UnitMeasureCode]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence]
GO
PRINT N'Dropping constraints from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [PK_WorkOrder_WorkOrderID]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [PK_PurchaseOrderHeader_PurchaseOrderID]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [PK_ShipMethod_ShipMethodID]
GO
PRINT N'Dropping constraints from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [PK_Vendor_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Sales].[CountryRegionCurrency]'
GO
ALTER TABLE [Sales].[CountryRegionCurrency] DROP CONSTRAINT [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode]
GO
PRINT N'Dropping constraints from [Sales].[CreditCard]'
GO
ALTER TABLE [Sales].[CreditCard] DROP CONSTRAINT [PK_CreditCard_CreditCardID]
GO
PRINT N'Dropping constraints from [Sales].[CurrencyRate]'
GO
ALTER TABLE [Sales].[CurrencyRate] DROP CONSTRAINT [PK_CurrencyRate_CurrencyRateID]
GO
PRINT N'Dropping constraints from [Sales].[Currency]'
GO
ALTER TABLE [Sales].[Currency] DROP CONSTRAINT [PK_Currency_CurrencyCode]
GO
PRINT N'Dropping constraints from [Sales].[Customer]'
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [PK_Customer_CustomerID]
GO
PRINT N'Dropping constraints from [Sales].[PersonCreditCard]'
GO
ALTER TABLE [Sales].[PersonCreditCard] DROP CONSTRAINT [PK_PersonCreditCard_BusinessEntityID_CreditCardID]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeaderSalesReason]'
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [PK_SalesOrderHeader_SalesOrderID]
GO
PRINT N'Dropping constraints from [Sales].[SalesPersonQuotaHistory]'
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] DROP CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [PK_SalesPerson_BusinessEntityID]
GO
PRINT N'Dropping constraints from [Sales].[SalesReason]'
GO
ALTER TABLE [Sales].[SalesReason] DROP CONSTRAINT [PK_SalesReason_SalesReasonID]
GO
PRINT N'Dropping constraints from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [PK_SalesTaxRate_SalesTaxRateID]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritoryHistory]'
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [PK_SalesTerritory_TerritoryID]
GO
PRINT N'Dropping constraints from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOfferProduct]'
GO
ALTER TABLE [Sales].[SpecialOfferProduct] DROP CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [PK_SpecialOffer_SpecialOfferID]
GO
PRINT N'Dropping constraints from [Sales].[Store]'
GO
ALTER TABLE [Sales].[Store] DROP CONSTRAINT [PK_Store_BusinessEntityID]
GO
PRINT N'Dropping constraints from [dbo].[AWBuildVersion]'
GO
ALTER TABLE [dbo].[AWBuildVersion] DROP CONSTRAINT [PK_AWBuildVersion_SystemInformationID]
GO
PRINT N'Dropping constraints from [dbo].[DatabaseLog]'
GO
ALTER TABLE [dbo].[DatabaseLog] DROP CONSTRAINT [PK_DatabaseLog_DatabaseLogID]
GO
PRINT N'Dropping constraints from [dbo].[ErrorLog]'
GO
ALTER TABLE [dbo].[ErrorLog] DROP CONSTRAINT [PK_ErrorLog_ErrorLogID]
GO
PRINT N'Dropping constraints from [HumanResources].[Department]'
GO
ALTER TABLE [HumanResources].[Department] DROP CONSTRAINT [DF_Department_ModifiedDate]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeeDepartmentHistory]'
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] DROP CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [HumanResources].[EmployeePayHistory]'
GO
ALTER TABLE [HumanResources].[EmployeePayHistory] DROP CONSTRAINT [DF_EmployeePayHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_SalariedFlag]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_CurrentFlag]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_VacationHours]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_SickLeaveHours]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_rowguid]
GO
PRINT N'Dropping constraints from [HumanResources].[Employee]'
GO
ALTER TABLE [HumanResources].[Employee] DROP CONSTRAINT [DF_Employee_ModifiedDate]
GO
PRINT N'Dropping constraints from [HumanResources].[JobCandidate]'
GO
ALTER TABLE [HumanResources].[JobCandidate] DROP CONSTRAINT [DF_JobCandidate_ModifiedDate]
GO
PRINT N'Dropping constraints from [HumanResources].[Shift]'
GO
ALTER TABLE [HumanResources].[Shift] DROP CONSTRAINT [DF_Shift_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[AddressType]'
GO
ALTER TABLE [Person].[AddressType] DROP CONSTRAINT [DF_AddressType_rowguid]
GO
PRINT N'Dropping constraints from [Person].[AddressType]'
GO
ALTER TABLE [Person].[AddressType] DROP CONSTRAINT [DF_AddressType_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[Address]'
GO
ALTER TABLE [Person].[Address] DROP CONSTRAINT [DF_Address_rowguid]
GO
PRINT N'Dropping constraints from [Person].[Address]'
GO
ALTER TABLE [Person].[Address] DROP CONSTRAINT [DF_Address_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityAddress]'
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [DF_BusinessEntityAddress_rowguid]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityAddress]'
GO
ALTER TABLE [Person].[BusinessEntityAddress] DROP CONSTRAINT [DF_BusinessEntityAddress_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityContact]'
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [DF_BusinessEntityContact_rowguid]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntityContact]'
GO
ALTER TABLE [Person].[BusinessEntityContact] DROP CONSTRAINT [DF_BusinessEntityContact_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntity]'
GO
ALTER TABLE [Person].[BusinessEntity] DROP CONSTRAINT [DF_BusinessEntity_rowguid]
GO
PRINT N'Dropping constraints from [Person].[BusinessEntity]'
GO
ALTER TABLE [Person].[BusinessEntity] DROP CONSTRAINT [DF_BusinessEntity_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[ContactType]'
GO
ALTER TABLE [Person].[ContactType] DROP CONSTRAINT [DF_ContactType_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[CountryRegion]'
GO
ALTER TABLE [Person].[CountryRegion] DROP CONSTRAINT [DF_CountryRegion_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[EmailAddress]'
GO
ALTER TABLE [Person].[EmailAddress] DROP CONSTRAINT [DF_EmailAddress_rowguid]
GO
PRINT N'Dropping constraints from [Person].[EmailAddress]'
GO
ALTER TABLE [Person].[EmailAddress] DROP CONSTRAINT [DF_EmailAddress_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[Password]'
GO
ALTER TABLE [Person].[Password] DROP CONSTRAINT [DF_Password_rowguid]
GO
PRINT N'Dropping constraints from [Person].[Password]'
GO
ALTER TABLE [Person].[Password] DROP CONSTRAINT [DF_Password_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[PersonPhone]'
GO
ALTER TABLE [Person].[PersonPhone] DROP CONSTRAINT [DF_PersonPhone_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [DF_Person_NameStyle]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [DF_Person_EmailPromotion]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [DF_Person_rowguid]
GO
PRINT N'Dropping constraints from [Person].[Person]'
GO
ALTER TABLE [Person].[Person] DROP CONSTRAINT [DF_Person_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[PhoneNumberType]'
GO
ALTER TABLE [Person].[PhoneNumberType] DROP CONSTRAINT [DF_PhoneNumberType_ModifiedDate]
GO
PRINT N'Dropping constraints from [Person].[StateProvince]'
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag]
GO
PRINT N'Dropping constraints from [Person].[StateProvince]'
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [DF_StateProvince_rowguid]
GO
PRINT N'Dropping constraints from [Person].[StateProvince]'
GO
ALTER TABLE [Person].[StateProvince] DROP CONSTRAINT [DF_StateProvince_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [DF_BillOfMaterials_StartDate]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [DF_BillOfMaterials_PerAssemblyQty]
GO
PRINT N'Dropping constraints from [Production].[BillOfMaterials]'
GO
ALTER TABLE [Production].[BillOfMaterials] DROP CONSTRAINT [DF_BillOfMaterials_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[Culture]'
GO
ALTER TABLE [Production].[Culture] DROP CONSTRAINT [DF_Culture_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [DF_Document_FolderFlag]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [DF_Document_ChangeNumber]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [DF_Document_rowguid]
GO
PRINT N'Dropping constraints from [Production].[Document]'
GO
ALTER TABLE [Production].[Document] DROP CONSTRAINT [DF_Document_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[Illustration]'
GO
ALTER TABLE [Production].[Illustration] DROP CONSTRAINT [DF_Illustration_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [DF_Location_CostRate]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [DF_Location_Availability]
GO
PRINT N'Dropping constraints from [Production].[Location]'
GO
ALTER TABLE [Production].[Location] DROP CONSTRAINT [DF_Location_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductCategory]'
GO
ALTER TABLE [Production].[ProductCategory] DROP CONSTRAINT [DF_ProductCategory_rowguid]
GO
PRINT N'Dropping constraints from [Production].[ProductCategory]'
GO
ALTER TABLE [Production].[ProductCategory] DROP CONSTRAINT [DF_ProductCategory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductCostHistory]'
GO
ALTER TABLE [Production].[ProductCostHistory] DROP CONSTRAINT [DF_ProductCostHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductDescription]'
GO
ALTER TABLE [Production].[ProductDescription] DROP CONSTRAINT [DF_ProductDescription_rowguid]
GO
PRINT N'Dropping constraints from [Production].[ProductDescription]'
GO
ALTER TABLE [Production].[ProductDescription] DROP CONSTRAINT [DF_ProductDescription_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductDocument]'
GO
ALTER TABLE [Production].[ProductDocument] DROP CONSTRAINT [DF_ProductDocument_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [DF_ProductInventory_Quantity]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [DF_ProductInventory_rowguid]
GO
PRINT N'Dropping constraints from [Production].[ProductInventory]'
GO
ALTER TABLE [Production].[ProductInventory] DROP CONSTRAINT [DF_ProductInventory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductListPriceHistory]'
GO
ALTER TABLE [Production].[ProductListPriceHistory] DROP CONSTRAINT [DF_ProductListPriceHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductModelIllustration]'
GO
ALTER TABLE [Production].[ProductModelIllustration] DROP CONSTRAINT [DF_ProductModelIllustration_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductModelProductDescriptionCulture]'
GO
ALTER TABLE [Production].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [DF_ProductModelProductDescriptionCulture_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductModel]'
GO
ALTER TABLE [Production].[ProductModel] DROP CONSTRAINT [DF_ProductModel_rowguid]
GO
PRINT N'Dropping constraints from [Production].[ProductModel]'
GO
ALTER TABLE [Production].[ProductModel] DROP CONSTRAINT [DF_ProductModel_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductPhoto]'
GO
ALTER TABLE [Production].[ProductPhoto] DROP CONSTRAINT [DF_ProductPhoto_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductProductPhoto]'
GO
ALTER TABLE [Production].[ProductProductPhoto] DROP CONSTRAINT [DF_ProductProductPhoto_Primary]
GO
PRINT N'Dropping constraints from [Production].[ProductProductPhoto]'
GO
ALTER TABLE [Production].[ProductProductPhoto] DROP CONSTRAINT [DF_ProductProductPhoto_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductReview]'
GO
ALTER TABLE [Production].[ProductReview] DROP CONSTRAINT [DF_ProductReview_ReviewDate]
GO
PRINT N'Dropping constraints from [Production].[ProductReview]'
GO
ALTER TABLE [Production].[ProductReview] DROP CONSTRAINT [DF_ProductReview_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ProductSubcategory]'
GO
ALTER TABLE [Production].[ProductSubcategory] DROP CONSTRAINT [DF_ProductSubcategory_rowguid]
GO
PRINT N'Dropping constraints from [Production].[ProductSubcategory]'
GO
ALTER TABLE [Production].[ProductSubcategory] DROP CONSTRAINT [DF_ProductSubcategory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [DF_Product_MakeFlag]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [DF_Product_FinishedGoodsFlag]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [DF_Product_rowguid]
GO
PRINT N'Dropping constraints from [Production].[Product]'
GO
ALTER TABLE [Production].[Product] DROP CONSTRAINT [DF_Product_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[ScrapReason]'
GO
ALTER TABLE [Production].[ScrapReason] DROP CONSTRAINT [DF_ScrapReason_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistoryArchive]'
GO
ALTER TABLE [Production].[TransactionHistoryArchive] DROP CONSTRAINT [DF_TransactionHistoryArchive_ReferenceOrderLineID]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistoryArchive]'
GO
ALTER TABLE [Production].[TransactionHistoryArchive] DROP CONSTRAINT [DF_TransactionHistoryArchive_TransactionDate]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistoryArchive]'
GO
ALTER TABLE [Production].[TransactionHistoryArchive] DROP CONSTRAINT [DF_TransactionHistoryArchive_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [DF_TransactionHistory_ReferenceOrderLineID]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [DF_TransactionHistory_TransactionDate]
GO
PRINT N'Dropping constraints from [Production].[TransactionHistory]'
GO
ALTER TABLE [Production].[TransactionHistory] DROP CONSTRAINT [DF_TransactionHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[UnitMeasure]'
GO
ALTER TABLE [Production].[UnitMeasure] DROP CONSTRAINT [DF_UnitMeasure_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[WorkOrderRouting]'
GO
ALTER TABLE [Production].[WorkOrderRouting] DROP CONSTRAINT [DF_WorkOrderRouting_ModifiedDate]
GO
PRINT N'Dropping constraints from [Production].[WorkOrder]'
GO
ALTER TABLE [Production].[WorkOrder] DROP CONSTRAINT [DF_WorkOrder_ModifiedDate]
GO
PRINT N'Dropping constraints from [Purchasing].[ProductVendor]'
GO
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [DF_ProductVendor_ModifiedDate]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderDetail]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderDetail] DROP CONSTRAINT [DF_PurchaseOrderDetail_ModifiedDate]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_RevisionNumber]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_Status]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_OrderDate]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_SubTotal]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_TaxAmt]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_Freight]
GO
PRINT N'Dropping constraints from [Purchasing].[PurchaseOrderHeader]'
GO
ALTER TABLE [Purchasing].[PurchaseOrderHeader] DROP CONSTRAINT [DF_PurchaseOrderHeader_ModifiedDate]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [DF_ShipMethod_ShipBase]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [DF_ShipMethod_ShipRate]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [DF_ShipMethod_rowguid]
GO
PRINT N'Dropping constraints from [Purchasing].[ShipMethod]'
GO
ALTER TABLE [Purchasing].[ShipMethod] DROP CONSTRAINT [DF_ShipMethod_ModifiedDate]
GO
PRINT N'Dropping constraints from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [DF_Vendor_PreferredVendorStatus]
GO
PRINT N'Dropping constraints from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [DF_Vendor_ActiveFlag]
GO
PRINT N'Dropping constraints from [Purchasing].[Vendor]'
GO
ALTER TABLE [Purchasing].[Vendor] DROP CONSTRAINT [DF_Vendor_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[CountryRegionCurrency]'
GO
ALTER TABLE [Sales].[CountryRegionCurrency] DROP CONSTRAINT [DF_CountryRegionCurrency_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[CreditCard]'
GO
ALTER TABLE [Sales].[CreditCard] DROP CONSTRAINT [DF_CreditCard_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[CurrencyRate]'
GO
ALTER TABLE [Sales].[CurrencyRate] DROP CONSTRAINT [DF_CurrencyRate_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[Currency]'
GO
ALTER TABLE [Sales].[Currency] DROP CONSTRAINT [DF_Currency_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[Customer]'
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [DF_Customer_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[Customer]'
GO
ALTER TABLE [Sales].[Customer] DROP CONSTRAINT [DF_Customer_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[PersonCreditCard]'
GO
ALTER TABLE [Sales].[PersonCreditCard] DROP CONSTRAINT [DF_PersonCreditCard_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [DF_SalesOrderDetail_UnitPriceDiscount]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [DF_SalesOrderDetail_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderDetail]'
GO
ALTER TABLE [Sales].[SalesOrderDetail] DROP CONSTRAINT [DF_SalesOrderDetail_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeaderSalesReason]'
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [DF_SalesOrderHeaderSalesReason_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_RevisionNumber]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_OrderDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_Status]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_SubTotal]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_TaxAmt]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_Freight]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesOrderHeader]'
GO
ALTER TABLE [Sales].[SalesOrderHeader] DROP CONSTRAINT [DF_SalesOrderHeader_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesPersonQuotaHistory]'
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] DROP CONSTRAINT [DF_SalesPersonQuotaHistory_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesPersonQuotaHistory]'
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] DROP CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_Bonus]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_CommissionPct]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_SalesYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_SalesLastYear]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesPerson]'
GO
ALTER TABLE [Sales].[SalesPerson] DROP CONSTRAINT [DF_SalesPerson_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesReason]'
GO
ALTER TABLE [Sales].[SalesReason] DROP CONSTRAINT [DF_SalesReason_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [DF_SalesTaxRate_TaxRate]
GO
PRINT N'Dropping constraints from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [DF_SalesTaxRate_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesTaxRate]'
GO
ALTER TABLE [Sales].[SalesTaxRate] DROP CONSTRAINT [DF_SalesTaxRate_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritoryHistory]'
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [DF_SalesTerritoryHistory_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritoryHistory]'
GO
ALTER TABLE [Sales].[SalesTerritoryHistory] DROP CONSTRAINT [DF_SalesTerritoryHistory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_SalesYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_SalesLastYear]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_CostYTD]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_CostLastYear]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SalesTerritory]'
GO
ALTER TABLE [Sales].[SalesTerritory] DROP CONSTRAINT [DF_SalesTerritory_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [DF_ShoppingCartItem_Quantity]
GO
PRINT N'Dropping constraints from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [DF_ShoppingCartItem_DateCreated]
GO
PRINT N'Dropping constraints from [Sales].[ShoppingCartItem]'
GO
ALTER TABLE [Sales].[ShoppingCartItem] DROP CONSTRAINT [DF_ShoppingCartItem_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOfferProduct]'
GO
ALTER TABLE [Sales].[SpecialOfferProduct] DROP CONSTRAINT [DF_SpecialOfferProduct_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOfferProduct]'
GO
ALTER TABLE [Sales].[SpecialOfferProduct] DROP CONSTRAINT [DF_SpecialOfferProduct_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [DF_SpecialOffer_DiscountPct]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [DF_SpecialOffer_MinQty]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [DF_SpecialOffer_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[SpecialOffer]'
GO
ALTER TABLE [Sales].[SpecialOffer] DROP CONSTRAINT [DF_SpecialOffer_ModifiedDate]
GO
PRINT N'Dropping constraints from [Sales].[Store]'
GO
ALTER TABLE [Sales].[Store] DROP CONSTRAINT [DF_Store_rowguid]
GO
PRINT N'Dropping constraints from [Sales].[Store]'
GO
ALTER TABLE [Sales].[Store] DROP CONSTRAINT [DF_Store_ModifiedDate]
GO
PRINT N'Dropping constraints from [dbo].[AWBuildVersion]'
GO
ALTER TABLE [dbo].[AWBuildVersion] DROP CONSTRAINT [DF_AWBuildVersion_ModifiedDate]
GO
PRINT N'Dropping constraints from [dbo].[ErrorLog]'
GO
ALTER TABLE [dbo].[ErrorLog] DROP CONSTRAINT [DF_ErrorLog_ErrorTime]
GO
PRINT N'Dropping index [AK_Department_Name] from [HumanResources].[Department]'
GO
DROP INDEX [AK_Department_Name] ON [HumanResources].[Department]
GO
PRINT N'Dropping index [IX_EmployeeDepartmentHistory_DepartmentID] from [HumanResources].[EmployeeDepartmentHistory]'
GO
DROP INDEX [IX_EmployeeDepartmentHistory_DepartmentID] ON [HumanResources].[EmployeeDepartmentHistory]
GO
PRINT N'Dropping index [IX_EmployeeDepartmentHistory_ShiftID] from [HumanResources].[EmployeeDepartmentHistory]'
GO
DROP INDEX [IX_EmployeeDepartmentHistory_ShiftID] ON [HumanResources].[EmployeeDepartmentHistory]
GO
PRINT N'Dropping index [AK_Employee_NationalIDNumber] from [HumanResources].[Employee]'
GO
DROP INDEX [AK_Employee_NationalIDNumber] ON [HumanResources].[Employee]
GO
PRINT N'Dropping index [AK_Employee_LoginID] from [HumanResources].[Employee]'
GO
DROP INDEX [AK_Employee_LoginID] ON [HumanResources].[Employee]
GO
PRINT N'Dropping index [IX_Employee_OrganizationLevel_OrganizationNode] from [HumanResources].[Employee]'
GO
DROP INDEX [IX_Employee_OrganizationLevel_OrganizationNode] ON [HumanResources].[Employee]
GO
PRINT N'Dropping index [IX_Employee_OrganizationNode] from [HumanResources].[Employee]'
GO
DROP INDEX [IX_Employee_OrganizationNode] ON [HumanResources].[Employee]
GO
PRINT N'Dropping index [AK_Employee_rowguid] from [HumanResources].[Employee]'
GO
DROP INDEX [AK_Employee_rowguid] ON [HumanResources].[Employee]
GO
PRINT N'Dropping index [IX_JobCandidate_BusinessEntityID] from [HumanResources].[JobCandidate]'
GO
DROP INDEX [IX_JobCandidate_BusinessEntityID] ON [HumanResources].[JobCandidate]
GO
PRINT N'Dropping index [AK_Shift_Name] from [HumanResources].[Shift]'
GO
DROP INDEX [AK_Shift_Name] ON [HumanResources].[Shift]
GO
PRINT N'Dropping index [AK_Shift_StartTime_EndTime] from [HumanResources].[Shift]'
GO
DROP INDEX [AK_Shift_StartTime_EndTime] ON [HumanResources].[Shift]
GO
PRINT N'Dropping index [AK_AddressType_Name] from [Person].[AddressType]'
GO
DROP INDEX [AK_AddressType_Name] ON [Person].[AddressType]
GO
PRINT N'Dropping index [AK_AddressType_rowguid] from [Person].[AddressType]'
GO
DROP INDEX [AK_AddressType_rowguid] ON [Person].[AddressType]
GO
PRINT N'Dropping index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] from [Person].[Address]'
GO
DROP INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] ON [Person].[Address]
GO
PRINT N'Dropping index [IX_Address_StateProvinceID] from [Person].[Address]'
GO
DROP INDEX [IX_Address_StateProvinceID] ON [Person].[Address]
GO
PRINT N'Dropping index [AK_Address_rowguid] from [Person].[Address]'
GO
DROP INDEX [AK_Address_rowguid] ON [Person].[Address]
GO
PRINT N'Dropping index [IX_BusinessEntityAddress_AddressID] from [Person].[BusinessEntityAddress]'
GO
DROP INDEX [IX_BusinessEntityAddress_AddressID] ON [Person].[BusinessEntityAddress]
GO
PRINT N'Dropping index [IX_BusinessEntityAddress_AddressTypeID] from [Person].[BusinessEntityAddress]'
GO
DROP INDEX [IX_BusinessEntityAddress_AddressTypeID] ON [Person].[BusinessEntityAddress]
GO
PRINT N'Dropping index [AK_BusinessEntityAddress_rowguid] from [Person].[BusinessEntityAddress]'
GO
DROP INDEX [AK_BusinessEntityAddress_rowguid] ON [Person].[BusinessEntityAddress]
GO
PRINT N'Dropping index [IX_BusinessEntityContact_PersonID] from [Person].[BusinessEntityContact]'
GO
DROP INDEX [IX_BusinessEntityContact_PersonID] ON [Person].[BusinessEntityContact]
GO
PRINT N'Dropping index [IX_BusinessEntityContact_ContactTypeID] from [Person].[BusinessEntityContact]'
GO
DROP INDEX [IX_BusinessEntityContact_ContactTypeID] ON [Person].[BusinessEntityContact]
GO
PRINT N'Dropping index [AK_BusinessEntityContact_rowguid] from [Person].[BusinessEntityContact]'
GO
DROP INDEX [AK_BusinessEntityContact_rowguid] ON [Person].[BusinessEntityContact]
GO
PRINT N'Dropping index [AK_BusinessEntity_rowguid] from [Person].[BusinessEntity]'
GO
DROP INDEX [AK_BusinessEntity_rowguid] ON [Person].[BusinessEntity]
GO
PRINT N'Dropping index [AK_ContactType_Name] from [Person].[ContactType]'
GO
DROP INDEX [AK_ContactType_Name] ON [Person].[ContactType]
GO
PRINT N'Dropping index [AK_CountryRegion_Name] from [Person].[CountryRegion]'
GO
DROP INDEX [AK_CountryRegion_Name] ON [Person].[CountryRegion]
GO
PRINT N'Dropping index [IX_EmailAddress_EmailAddress] from [Person].[EmailAddress]'
GO
DROP INDEX [IX_EmailAddress_EmailAddress] ON [Person].[EmailAddress]
GO
PRINT N'Dropping index [IX_PersonPhone_PhoneNumber] from [Person].[PersonPhone]'
GO
DROP INDEX [IX_PersonPhone_PhoneNumber] ON [Person].[PersonPhone]
GO
PRINT N'Dropping index [IX_Person_LastName_FirstName_MiddleName] from [Person].[Person]'
GO
DROP INDEX [IX_Person_LastName_FirstName_MiddleName] ON [Person].[Person]
GO
PRINT N'Dropping index [AK_Person_rowguid] from [Person].[Person]'
GO
DROP INDEX [AK_Person_rowguid] ON [Person].[Person]
GO
PRINT N'Dropping index [AK_StateProvince_StateProvinceCode_CountryRegionCode] from [Person].[StateProvince]'
GO
DROP INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode] ON [Person].[StateProvince]
GO
PRINT N'Dropping index [AK_StateProvince_Name] from [Person].[StateProvince]'
GO
DROP INDEX [AK_StateProvince_Name] ON [Person].[StateProvince]
GO
PRINT N'Dropping index [AK_StateProvince_rowguid] from [Person].[StateProvince]'
GO
DROP INDEX [AK_StateProvince_rowguid] ON [Person].[StateProvince]
GO
PRINT N'Dropping index [IX_BillOfMaterials_UnitMeasureCode] from [Production].[BillOfMaterials]'
GO
DROP INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials]
GO
PRINT N'Dropping index [AK_Culture_Name] from [Production].[Culture]'
GO
DROP INDEX [AK_Culture_Name] ON [Production].[Culture]
GO
PRINT N'Dropping index [AK_Document_DocumentLevel_DocumentNode] from [Production].[Document]'
GO
DROP INDEX [AK_Document_DocumentLevel_DocumentNode] ON [Production].[Document]
GO
PRINT N'Dropping index [IX_Document_FileName_Revision] from [Production].[Document]'
GO
DROP INDEX [IX_Document_FileName_Revision] ON [Production].[Document]
GO
PRINT N'Dropping index [AK_Document_rowguid] from [Production].[Document]'
GO
DROP INDEX [AK_Document_rowguid] ON [Production].[Document]
GO
PRINT N'Dropping index [AK_Location_Name] from [Production].[Location]'
GO
DROP INDEX [AK_Location_Name] ON [Production].[Location]
GO
PRINT N'Dropping index [AK_ProductCategory_Name] from [Production].[ProductCategory]'
GO
DROP INDEX [AK_ProductCategory_Name] ON [Production].[ProductCategory]
GO
PRINT N'Dropping index [AK_ProductCategory_rowguid] from [Production].[ProductCategory]'
GO
DROP INDEX [AK_ProductCategory_rowguid] ON [Production].[ProductCategory]
GO
PRINT N'Dropping index [AK_ProductDescription_rowguid] from [Production].[ProductDescription]'
GO
DROP INDEX [AK_ProductDescription_rowguid] ON [Production].[ProductDescription]
GO
PRINT N'Dropping index [AK_ProductModel_Name] from [Production].[ProductModel]'
GO
DROP INDEX [AK_ProductModel_Name] ON [Production].[ProductModel]
GO
PRINT N'Dropping index [AK_ProductModel_rowguid] from [Production].[ProductModel]'
GO
DROP INDEX [AK_ProductModel_rowguid] ON [Production].[ProductModel]
GO
PRINT N'Dropping index [IX_ProductReview_ProductID_Name] from [Production].[ProductReview]'
GO
DROP INDEX [IX_ProductReview_ProductID_Name] ON [Production].[ProductReview]
GO
PRINT N'Dropping index [AK_ProductSubcategory_Name] from [Production].[ProductSubcategory]'
GO
DROP INDEX [AK_ProductSubcategory_Name] ON [Production].[ProductSubcategory]
GO
PRINT N'Dropping index [AK_ProductSubcategory_rowguid] from [Production].[ProductSubcategory]'
GO
DROP INDEX [AK_ProductSubcategory_rowguid] ON [Production].[ProductSubcategory]
GO
PRINT N'Dropping index [AK_Product_Name] from [Production].[Product]'
GO
DROP INDEX [AK_Product_Name] ON [Production].[Product]
GO
PRINT N'Dropping index [AK_Product_ProductNumber] from [Production].[Product]'
GO
DROP INDEX [AK_Product_ProductNumber] ON [Production].[Product]
GO
PRINT N'Dropping index [AK_Product_rowguid] from [Production].[Product]'
GO
DROP INDEX [AK_Product_rowguid] ON [Production].[Product]
GO
PRINT N'Dropping index [AK_ScrapReason_Name] from [Production].[ScrapReason]'
GO
DROP INDEX [AK_ScrapReason_Name] ON [Production].[ScrapReason]
GO
PRINT N'Dropping index [IX_TransactionHistoryArchive_ProductID] from [Production].[TransactionHistoryArchive]'
GO
DROP INDEX [IX_TransactionHistoryArchive_ProductID] ON [Production].[TransactionHistoryArchive]
GO
PRINT N'Dropping index [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] from [Production].[TransactionHistoryArchive]'
GO
DROP INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistoryArchive]
GO
PRINT N'Dropping index [IX_TransactionHistory_ProductID] from [Production].[TransactionHistory]'
GO
DROP INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory]
GO
PRINT N'Dropping index [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] from [Production].[TransactionHistory]'
GO
DROP INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistory]
GO
PRINT N'Dropping index [AK_UnitMeasure_Name] from [Production].[UnitMeasure]'
GO
DROP INDEX [AK_UnitMeasure_Name] ON [Production].[UnitMeasure]
GO
PRINT N'Dropping index [IX_WorkOrderRouting_ProductID] from [Production].[WorkOrderRouting]'
GO
DROP INDEX [IX_WorkOrderRouting_ProductID] ON [Production].[WorkOrderRouting]
GO
PRINT N'Dropping index [IX_WorkOrder_ProductID] from [Production].[WorkOrder]'
GO
DROP INDEX [IX_WorkOrder_ProductID] ON [Production].[WorkOrder]
GO
PRINT N'Dropping index [IX_WorkOrder_ScrapReasonID] from [Production].[WorkOrder]'
GO
DROP INDEX [IX_WorkOrder_ScrapReasonID] ON [Production].[WorkOrder]
GO
PRINT N'Dropping index [IX_ProductVendor_BusinessEntityID] from [Purchasing].[ProductVendor]'
GO
DROP INDEX [IX_ProductVendor_BusinessEntityID] ON [Purchasing].[ProductVendor]
GO
PRINT N'Dropping index [IX_ProductVendor_UnitMeasureCode] from [Purchasing].[ProductVendor]'
GO
DROP INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor]
GO
PRINT N'Dropping index [IX_PurchaseOrderDetail_ProductID] from [Purchasing].[PurchaseOrderDetail]'
GO
DROP INDEX [IX_PurchaseOrderDetail_ProductID] ON [Purchasing].[PurchaseOrderDetail]
GO
PRINT N'Dropping index [IX_PurchaseOrderHeader_EmployeeID] from [Purchasing].[PurchaseOrderHeader]'
GO
DROP INDEX [IX_PurchaseOrderHeader_EmployeeID] ON [Purchasing].[PurchaseOrderHeader]
GO
PRINT N'Dropping index [IX_PurchaseOrderHeader_VendorID] from [Purchasing].[PurchaseOrderHeader]'
GO
DROP INDEX [IX_PurchaseOrderHeader_VendorID] ON [Purchasing].[PurchaseOrderHeader]
GO
PRINT N'Dropping index [AK_ShipMethod_Name] from [Purchasing].[ShipMethod]'
GO
DROP INDEX [AK_ShipMethod_Name] ON [Purchasing].[ShipMethod]
GO
PRINT N'Dropping index [AK_ShipMethod_rowguid] from [Purchasing].[ShipMethod]'
GO
DROP INDEX [AK_ShipMethod_rowguid] ON [Purchasing].[ShipMethod]
GO
PRINT N'Dropping index [AK_Vendor_AccountNumber] from [Purchasing].[Vendor]'
GO
DROP INDEX [AK_Vendor_AccountNumber] ON [Purchasing].[Vendor]
GO
PRINT N'Dropping index [IX_CountryRegionCurrency_CurrencyCode] from [Sales].[CountryRegionCurrency]'
GO
DROP INDEX [IX_CountryRegionCurrency_CurrencyCode] ON [Sales].[CountryRegionCurrency]
GO
PRINT N'Dropping index [AK_CreditCard_CardNumber] from [Sales].[CreditCard]'
GO
DROP INDEX [AK_CreditCard_CardNumber] ON [Sales].[CreditCard]
GO
PRINT N'Dropping index [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] from [Sales].[CurrencyRate]'
GO
DROP INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] ON [Sales].[CurrencyRate]
GO
PRINT N'Dropping index [AK_Currency_Name] from [Sales].[Currency]'
GO
DROP INDEX [AK_Currency_Name] ON [Sales].[Currency]
GO
PRINT N'Dropping index [IX_Customer_TerritoryID] from [Sales].[Customer]'
GO
DROP INDEX [IX_Customer_TerritoryID] ON [Sales].[Customer]
GO
PRINT N'Dropping index [AK_Customer_AccountNumber] from [Sales].[Customer]'
GO
DROP INDEX [AK_Customer_AccountNumber] ON [Sales].[Customer]
GO
PRINT N'Dropping index [AK_Customer_rowguid] from [Sales].[Customer]'
GO
DROP INDEX [AK_Customer_rowguid] ON [Sales].[Customer]
GO
PRINT N'Dropping index [IX_SalesOrderDetail_ProductID] from [Sales].[SalesOrderDetail]'
GO
DROP INDEX [IX_SalesOrderDetail_ProductID] ON [Sales].[SalesOrderDetail]
GO
PRINT N'Dropping index [AK_SalesOrderDetail_rowguid] from [Sales].[SalesOrderDetail]'
GO
DROP INDEX [AK_SalesOrderDetail_rowguid] ON [Sales].[SalesOrderDetail]
GO
PRINT N'Dropping index [AK_SalesOrderHeader_SalesOrderNumber] from [Sales].[SalesOrderHeader]'
GO
DROP INDEX [AK_SalesOrderHeader_SalesOrderNumber] ON [Sales].[SalesOrderHeader]
GO
PRINT N'Dropping index [IX_SalesOrderHeader_CustomerID] from [Sales].[SalesOrderHeader]'
GO
DROP INDEX [IX_SalesOrderHeader_CustomerID] ON [Sales].[SalesOrderHeader]
GO
PRINT N'Dropping index [IX_SalesOrderHeader_SalesPersonID] from [Sales].[SalesOrderHeader]'
GO
DROP INDEX [IX_SalesOrderHeader_SalesPersonID] ON [Sales].[SalesOrderHeader]
GO
PRINT N'Dropping index [AK_SalesOrderHeader_rowguid] from [Sales].[SalesOrderHeader]'
GO
DROP INDEX [AK_SalesOrderHeader_rowguid] ON [Sales].[SalesOrderHeader]
GO
PRINT N'Dropping index [AK_SalesPersonQuotaHistory_rowguid] from [Sales].[SalesPersonQuotaHistory]'
GO
DROP INDEX [AK_SalesPersonQuotaHistory_rowguid] ON [Sales].[SalesPersonQuotaHistory]
GO
PRINT N'Dropping index [AK_SalesPerson_rowguid] from [Sales].[SalesPerson]'
GO
DROP INDEX [AK_SalesPerson_rowguid] ON [Sales].[SalesPerson]
GO
PRINT N'Dropping index [AK_SalesTaxRate_StateProvinceID_TaxType] from [Sales].[SalesTaxRate]'
GO
DROP INDEX [AK_SalesTaxRate_StateProvinceID_TaxType] ON [Sales].[SalesTaxRate]
GO
PRINT N'Dropping index [AK_SalesTaxRate_rowguid] from [Sales].[SalesTaxRate]'
GO
DROP INDEX [AK_SalesTaxRate_rowguid] ON [Sales].[SalesTaxRate]
GO
PRINT N'Dropping index [AK_SalesTerritoryHistory_rowguid] from [Sales].[SalesTerritoryHistory]'
GO
DROP INDEX [AK_SalesTerritoryHistory_rowguid] ON [Sales].[SalesTerritoryHistory]
GO
PRINT N'Dropping index [AK_SalesTerritory_Name] from [Sales].[SalesTerritory]'
GO
DROP INDEX [AK_SalesTerritory_Name] ON [Sales].[SalesTerritory]
GO
PRINT N'Dropping index [AK_SalesTerritory_rowguid] from [Sales].[SalesTerritory]'
GO
DROP INDEX [AK_SalesTerritory_rowguid] ON [Sales].[SalesTerritory]
GO
PRINT N'Dropping index [IX_ShoppingCartItem_ShoppingCartID_ProductID] from [Sales].[ShoppingCartItem]'
GO
DROP INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem]
GO
PRINT N'Dropping index [IX_SpecialOfferProduct_ProductID] from [Sales].[SpecialOfferProduct]'
GO
DROP INDEX [IX_SpecialOfferProduct_ProductID] ON [Sales].[SpecialOfferProduct]
GO
PRINT N'Dropping index [AK_SpecialOfferProduct_rowguid] from [Sales].[SpecialOfferProduct]'
GO
DROP INDEX [AK_SpecialOfferProduct_rowguid] ON [Sales].[SpecialOfferProduct]
GO
PRINT N'Dropping index [AK_SpecialOffer_rowguid] from [Sales].[SpecialOffer]'
GO
DROP INDEX [AK_SpecialOffer_rowguid] ON [Sales].[SpecialOffer]
GO
PRINT N'Dropping index [IX_Store_SalesPersonID] from [Sales].[Store]'
GO
DROP INDEX [IX_Store_SalesPersonID] ON [Sales].[Store]
GO
PRINT N'Dropping index [AK_Store_rowguid] from [Sales].[Store]'
GO
DROP INDEX [AK_Store_rowguid] ON [Sales].[Store]
GO
PRINT N'Dropping index [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate] from [Production].[BillOfMaterials]'
GO
DROP INDEX [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate] ON [Production].[BillOfMaterials]
GO
PRINT N'Dropping trigger [HumanResources].[dEmployee] from [HumanResources].[Employee]'
GO
DROP TRIGGER [HumanResources].[dEmployee]
GO
PRINT N'Dropping trigger [Person].[iuPerson] from [Person].[Person]'
GO
DROP TRIGGER [Person].[iuPerson]
GO
PRINT N'Dropping trigger [Production].[iWorkOrder] from [Production].[WorkOrder]'
GO
DROP TRIGGER [Production].[iWorkOrder]
GO
PRINT N'Dropping trigger [Production].[uWorkOrder] from [Production].[WorkOrder]'
GO
DROP TRIGGER [Production].[uWorkOrder]
GO
PRINT N'Dropping trigger [Purchasing].[iPurchaseOrderDetail] from [Purchasing].[PurchaseOrderDetail]'
GO
DROP TRIGGER [Purchasing].[iPurchaseOrderDetail]
GO
PRINT N'Dropping trigger [Purchasing].[uPurchaseOrderDetail] from [Purchasing].[PurchaseOrderDetail]'
GO
DROP TRIGGER [Purchasing].[uPurchaseOrderDetail]
GO
PRINT N'Dropping trigger [Purchasing].[uPurchaseOrderHeader] from [Purchasing].[PurchaseOrderHeader]'
GO
DROP TRIGGER [Purchasing].[uPurchaseOrderHeader]
GO
PRINT N'Dropping trigger [Purchasing].[dVendor] from [Purchasing].[Vendor]'
GO
DROP TRIGGER [Purchasing].[dVendor]
GO
PRINT N'Dropping trigger [Sales].[iduSalesOrderDetail] from [Sales].[SalesOrderDetail]'
GO
DROP TRIGGER [Sales].[iduSalesOrderDetail]
GO
PRINT N'Dropping trigger [Sales].[uSalesOrderHeader] from [Sales].[SalesOrderHeader]'
GO
DROP TRIGGER [Sales].[uSalesOrderHeader]
GO
PRINT N'Dropping computed columns'
GO
ALTER TABLE [Sales].[Customer] DROP COLUMN [AccountNumber]
GO
PRINT N'Unbinding types from columns'
GO
ALTER TABLE [HumanResources].[Department] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [HumanResources].[Department] ALTER COLUMN [GroupName] nvarchar (50) NOT NULL
GO
ALTER TABLE [HumanResources].[Employee] ALTER COLUMN [SalariedFlag] bit NOT NULL
GO
ALTER TABLE [HumanResources].[Employee] ALTER COLUMN [CurrentFlag] bit NOT NULL
GO
ALTER TABLE [HumanResources].[Shift] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[AddressType] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[ContactType] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[CountryRegion] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[PersonPhone] ALTER COLUMN [PhoneNumber] nvarchar (25) NOT NULL
GO
ALTER TABLE [Person].[Person] ALTER COLUMN [NameStyle] bit NOT NULL
GO
ALTER TABLE [Person].[Person] ALTER COLUMN [FirstName] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[Person] ALTER COLUMN [MiddleName] nvarchar (50) NULL
GO
ALTER TABLE [Person].[Person] ALTER COLUMN [LastName] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[PhoneNumberType] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Person].[StateProvince] ALTER COLUMN [IsOnlyStateProvinceFlag] bit NOT NULL
GO
ALTER TABLE [Person].[StateProvince] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[Culture] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[Location] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[ProductCategory] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[ProductModel] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[ProductProductPhoto] ALTER COLUMN [Primary] bit NOT NULL
GO
ALTER TABLE [Production].[ProductReview] ALTER COLUMN [ReviewerName] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[ProductSubcategory] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[Product] ALTER COLUMN [MakeFlag] bit NOT NULL
GO
ALTER TABLE [Production].[Product] ALTER COLUMN [FinishedGoodsFlag] bit NOT NULL
GO
ALTER TABLE [Production].[Product] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[ScrapReason] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Production].[UnitMeasure] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Purchasing].[ShipMethod] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Purchasing].[Vendor] ALTER COLUMN [AccountNumber] nvarchar (15) NOT NULL
GO
ALTER TABLE [Purchasing].[Vendor] ALTER COLUMN [PreferredVendorStatus] bit NOT NULL
GO
ALTER TABLE [Purchasing].[Vendor] ALTER COLUMN [ActiveFlag] bit NOT NULL
GO
ALTER TABLE [Purchasing].[Vendor] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[Currency] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[SalesOrderHeader] ALTER COLUMN [AccountNumber] nvarchar (15) NULL
GO
ALTER TABLE [Sales].[SalesOrderHeader] ALTER COLUMN [OnlineOrderFlag] bit NOT NULL
GO
ALTER TABLE [Sales].[SalesOrderHeader] ALTER COLUMN [PurchaseOrderNumber] nvarchar (25) NULL
GO
ALTER TABLE [Sales].[SalesReason] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[SalesReason] ALTER COLUMN [ReasonType] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[SalesTaxRate] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[SalesTerritory] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
ALTER TABLE [Sales].[Store] ALTER COLUMN [Name] nvarchar (50) NOT NULL
GO
PRINT N'Dropping DDL triggers'
GO
DROP TRIGGER [ddlDatabaseTriggerLog] ON DATABASE
GO
PRINT N'Dropping [dbo].[DatabaseLog]'
GO
DROP TABLE [dbo].[DatabaseLog]
GO
PRINT N'Dropping [dbo].[ufnGetSalesOrderStatusText]'
GO
DROP FUNCTION [dbo].[ufnGetSalesOrderStatusText]
GO
PRINT N'Dropping [dbo].[ufnGetPurchaseOrderStatusText]'
GO
DROP FUNCTION [dbo].[ufnGetPurchaseOrderStatusText]
GO
PRINT N'Dropping [dbo].[ufnGetDocumentStatusText]'
GO
DROP FUNCTION [dbo].[ufnGetDocumentStatusText]
GO
PRINT N'Dropping [Sales].[vStoreWithDemographics]'
GO
DROP VIEW [Sales].[vStoreWithDemographics]
GO
PRINT N'Dropping [Sales].[vStoreWithContacts]'
GO
DROP VIEW [Sales].[vStoreWithContacts]
GO
PRINT N'Dropping [Sales].[vStoreWithAddresses]'
GO
DROP VIEW [Sales].[vStoreWithAddresses]
GO
PRINT N'Dropping [Sales].[vSalesPersonSalesByFiscalYears]'
GO
DROP VIEW [Sales].[vSalesPersonSalesByFiscalYears]
GO
PRINT N'Dropping [Sales].[vSalesPerson]'
GO
DROP VIEW [Sales].[vSalesPerson]
GO
PRINT N'Dropping [Sales].[vPersonDemographics]'
GO
DROP VIEW [Sales].[vPersonDemographics]
GO
PRINT N'Dropping [Sales].[vIndividualCustomer]'
GO
DROP VIEW [Sales].[vIndividualCustomer]
GO
PRINT N'Dropping [Purchasing].[vVendorWithContacts]'
GO
DROP VIEW [Purchasing].[vVendorWithContacts]
GO
PRINT N'Dropping [Purchasing].[vVendorWithAddresses]'
GO
DROP VIEW [Purchasing].[vVendorWithAddresses]
GO
PRINT N'Dropping [Production].[vProductModelInstructions]'
GO
DROP VIEW [Production].[vProductModelInstructions]
GO
PRINT N'Dropping [Production].[vProductModelCatalogDescription]'
GO
DROP VIEW [Production].[vProductModelCatalogDescription]
GO
PRINT N'Dropping [Production].[vProductAndDescription]'
GO
DROP VIEW [Production].[vProductAndDescription]
GO
PRINT N'Dropping [Person].[vStateProvinceCountryRegion]'
GO
DROP VIEW [Person].[vStateProvinceCountryRegion]
GO
PRINT N'Dropping [Person].[vAdditionalContactInfo]'
GO
DROP VIEW [Person].[vAdditionalContactInfo]
GO
PRINT N'Dropping [HumanResources].[vJobCandidateEmployment]'
GO
DROP VIEW [HumanResources].[vJobCandidateEmployment]
GO
PRINT N'Dropping [HumanResources].[vJobCandidateEducation]'
GO
DROP VIEW [HumanResources].[vJobCandidateEducation]
GO
PRINT N'Dropping [HumanResources].[vJobCandidate]'
GO
DROP VIEW [HumanResources].[vJobCandidate]
GO
PRINT N'Dropping [HumanResources].[vEmployeeDepartmentHistory]'
GO
DROP VIEW [HumanResources].[vEmployeeDepartmentHistory]
GO
PRINT N'Dropping [HumanResources].[vEmployeeDepartment]'
GO
DROP VIEW [HumanResources].[vEmployeeDepartment]
GO
PRINT N'Dropping [HumanResources].[vEmployee]'
GO
DROP VIEW [HumanResources].[vEmployee]
GO
PRINT N'Dropping [HumanResources].[uspUpdateEmployeePersonalInfo]'
GO
DROP PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]
GO
PRINT N'Dropping [HumanResources].[uspUpdateEmployeeLogin]'
GO
DROP PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
GO
PRINT N'Dropping [HumanResources].[uspUpdateEmployeeHireInfo]'
GO
DROP PROCEDURE [HumanResources].[uspUpdateEmployeeHireInfo]
GO
PRINT N'Dropping [dbo].[uspSearchCandidateResumes]'
GO
DROP PROCEDURE [dbo].[uspSearchCandidateResumes]
GO
PRINT N'Dropping [dbo].[uspGetWhereUsedProductID]'
GO
DROP PROCEDURE [dbo].[uspGetWhereUsedProductID]
GO
PRINT N'Dropping [dbo].[uspGetManagerEmployees]'
GO
DROP PROCEDURE [dbo].[uspGetManagerEmployees]
GO
PRINT N'Dropping [dbo].[uspGetEmployeeManagers]'
GO
DROP PROCEDURE [dbo].[uspGetEmployeeManagers]
GO
PRINT N'Dropping [dbo].[uspGetBillOfMaterials]'
GO
DROP PROCEDURE [dbo].[uspGetBillOfMaterials]
GO
PRINT N'Dropping [dbo].[ProductTransactionHistoryByReference]'
GO
DROP PROCEDURE [dbo].[ProductTransactionHistoryByReference]
GO
PRINT N'Dropping [dbo].[ufnGetStock]'
GO
DROP FUNCTION [dbo].[ufnGetStock]
GO
PRINT N'Dropping [dbo].[ufnGetProductStandardCost]'
GO
DROP FUNCTION [dbo].[ufnGetProductStandardCost]
GO
PRINT N'Dropping [dbo].[ufnGetProductListPrice]'
GO
DROP FUNCTION [dbo].[ufnGetProductListPrice]
GO
PRINT N'Dropping [dbo].[ufnGetProductDealerPrice]'
GO
DROP FUNCTION [dbo].[ufnGetProductDealerPrice]
GO
PRINT N'Dropping [dbo].[ufnGetContactInformation]'
GO
DROP FUNCTION [dbo].[ufnGetContactInformation]
GO
PRINT N'Dropping [dbo].[ufnGetAccountingStartDate]'
GO
DROP FUNCTION [dbo].[ufnGetAccountingStartDate]
GO
PRINT N'Dropping [dbo].[ufnGetAccountingEndDate]'
GO
DROP FUNCTION [dbo].[ufnGetAccountingEndDate]
GO
PRINT N'Dropping [dbo].[uspLogError]'
GO
DROP PROCEDURE [dbo].[uspLogError]
GO
PRINT N'Dropping [dbo].[uspPrintError]'
GO
DROP PROCEDURE [dbo].[uspPrintError]
GO
PRINT N'Dropping [Sales].[Store]'
GO
DROP TABLE [Sales].[Store]
GO
PRINT N'Dropping [Sales].[SpecialOfferProduct]'
GO
DROP TABLE [Sales].[SpecialOfferProduct]
GO
PRINT N'Dropping [Sales].[SpecialOffer]'
GO
DROP TABLE [Sales].[SpecialOffer]
GO
PRINT N'Dropping [Sales].[ShoppingCartItem]'
GO
DROP TABLE [Sales].[ShoppingCartItem]
GO
PRINT N'Dropping [Sales].[SalesTerritoryHistory]'
GO
DROP TABLE [Sales].[SalesTerritoryHistory]
GO
PRINT N'Dropping [Sales].[SalesTerritory]'
GO
DROP TABLE [Sales].[SalesTerritory]
GO
PRINT N'Dropping [Sales].[SalesTaxRate]'
GO
DROP TABLE [Sales].[SalesTaxRate]
GO
PRINT N'Dropping [Sales].[SalesReason]'
GO
DROP TABLE [Sales].[SalesReason]
GO
PRINT N'Dropping [Sales].[SalesPersonQuotaHistory]'
GO
DROP TABLE [Sales].[SalesPersonQuotaHistory]
GO
PRINT N'Dropping [Sales].[SalesPerson]'
GO
DROP TABLE [Sales].[SalesPerson]
GO
PRINT N'Dropping [Sales].[SalesOrderHeaderSalesReason]'
GO
DROP TABLE [Sales].[SalesOrderHeaderSalesReason]
GO
PRINT N'Dropping [Sales].[SalesOrderHeader]'
GO
DROP TABLE [Sales].[SalesOrderHeader]
GO
PRINT N'Dropping [Sales].[SalesOrderDetail]'
GO
DROP TABLE [Sales].[SalesOrderDetail]
GO
PRINT N'Dropping [Sales].[PersonCreditCard]'
GO
DROP TABLE [Sales].[PersonCreditCard]
GO
PRINT N'Dropping [Sales].[Customer]'
GO
DROP TABLE [Sales].[Customer]
GO
PRINT N'Dropping [dbo].[ufnLeadingZeros]'
GO
DROP FUNCTION [dbo].[ufnLeadingZeros]
GO
PRINT N'Dropping [Sales].[CurrencyRate]'
GO
DROP TABLE [Sales].[CurrencyRate]
GO
PRINT N'Dropping [Sales].[Currency]'
GO
DROP TABLE [Sales].[Currency]
GO
PRINT N'Dropping [Sales].[CreditCard]'
GO
DROP TABLE [Sales].[CreditCard]
GO
PRINT N'Dropping [Sales].[CountryRegionCurrency]'
GO
DROP TABLE [Sales].[CountryRegionCurrency]
GO
PRINT N'Dropping [Purchasing].[Vendor]'
GO
DROP TABLE [Purchasing].[Vendor]
GO
PRINT N'Dropping [Purchasing].[ShipMethod]'
GO
DROP TABLE [Purchasing].[ShipMethod]
GO
PRINT N'Dropping [Purchasing].[PurchaseOrderHeader]'
GO
DROP TABLE [Purchasing].[PurchaseOrderHeader]
GO
PRINT N'Dropping [Purchasing].[PurchaseOrderDetail]'
GO
DROP TABLE [Purchasing].[PurchaseOrderDetail]
GO
PRINT N'Dropping [Purchasing].[ProductVendor]'
GO
DROP TABLE [Purchasing].[ProductVendor]
GO
PRINT N'Dropping [Production].[WorkOrderRouting]'
GO
DROP TABLE [Production].[WorkOrderRouting]
GO
PRINT N'Dropping [Production].[WorkOrder]'
GO
DROP TABLE [Production].[WorkOrder]
GO
PRINT N'Dropping [Production].[UnitMeasure]'
GO
DROP TABLE [Production].[UnitMeasure]
GO
PRINT N'Dropping [Production].[TransactionHistoryArchive]'
GO
DROP TABLE [Production].[TransactionHistoryArchive]
GO
PRINT N'Dropping [Production].[TransactionHistory]'
GO
DROP TABLE [Production].[TransactionHistory]
GO
PRINT N'Dropping [Production].[ScrapReason]'
GO
DROP TABLE [Production].[ScrapReason]
GO
PRINT N'Dropping [Production].[ProductSubcategory]'
GO
DROP TABLE [Production].[ProductSubcategory]
GO
PRINT N'Dropping [Production].[ProductReview]'
GO
DROP TABLE [Production].[ProductReview]
GO
PRINT N'Dropping [Production].[ProductProductPhoto]'
GO
DROP TABLE [Production].[ProductProductPhoto]
GO
PRINT N'Dropping [Production].[ProductPhoto]'
GO
DROP TABLE [Production].[ProductPhoto]
GO
PRINT N'Dropping [Production].[ProductModelProductDescriptionCulture]'
GO
DROP TABLE [Production].[ProductModelProductDescriptionCulture]
GO
PRINT N'Dropping [Production].[ProductModelIllustration]'
GO
DROP TABLE [Production].[ProductModelIllustration]
GO
PRINT N'Dropping [Production].[ProductModel]'
GO
DROP TABLE [Production].[ProductModel]
GO
PRINT N'Dropping [Production].[ProductListPriceHistory]'
GO
DROP TABLE [Production].[ProductListPriceHistory]
GO
PRINT N'Dropping [Production].[ProductInventory]'
GO
DROP TABLE [Production].[ProductInventory]
GO
PRINT N'Dropping [Production].[ProductDocument]'
GO
DROP TABLE [Production].[ProductDocument]
GO
PRINT N'Dropping [Production].[ProductDescription]'
GO
DROP TABLE [Production].[ProductDescription]
GO
PRINT N'Dropping [Production].[ProductCostHistory]'
GO
DROP TABLE [Production].[ProductCostHistory]
GO
PRINT N'Dropping [Production].[ProductCategory]'
GO
DROP TABLE [Production].[ProductCategory]
GO
PRINT N'Dropping [Production].[Product]'
GO
DROP TABLE [Production].[Product]
GO
PRINT N'Dropping [Production].[Location]'
GO
DROP TABLE [Production].[Location]
GO
PRINT N'Dropping [Production].[Illustration]'
GO
DROP TABLE [Production].[Illustration]
GO
PRINT N'Dropping [Production].[Document]'
GO
DROP TABLE [Production].[Document]
GO
PRINT N'Dropping [Production].[Culture]'
GO
DROP TABLE [Production].[Culture]
GO
PRINT N'Dropping [Production].[BillOfMaterials]'
GO
DROP TABLE [Production].[BillOfMaterials]
GO
PRINT N'Dropping [Person].[StateProvince]'
GO
DROP TABLE [Person].[StateProvince]
GO
PRINT N'Dropping [Person].[PhoneNumberType]'
GO
DROP TABLE [Person].[PhoneNumberType]
GO
PRINT N'Dropping [Person].[PersonPhone]'
GO
DROP TABLE [Person].[PersonPhone]
GO
PRINT N'Dropping [Person].[Person]'
GO
DROP TABLE [Person].[Person]
GO
PRINT N'Dropping [Person].[Password]'
GO
DROP TABLE [Person].[Password]
GO
PRINT N'Dropping [Person].[EmailAddress]'
GO
DROP TABLE [Person].[EmailAddress]
GO
PRINT N'Dropping [Person].[CountryRegion]'
GO
DROP TABLE [Person].[CountryRegion]
GO
PRINT N'Dropping [Person].[ContactType]'
GO
DROP TABLE [Person].[ContactType]
GO
PRINT N'Dropping [Person].[BusinessEntityContact]'
GO
DROP TABLE [Person].[BusinessEntityContact]
GO
PRINT N'Dropping [Person].[BusinessEntityAddress]'
GO
DROP TABLE [Person].[BusinessEntityAddress]
GO
PRINT N'Dropping [Person].[BusinessEntity]'
GO
DROP TABLE [Person].[BusinessEntity]
GO
PRINT N'Dropping [Person].[AddressType]'
GO
DROP TABLE [Person].[AddressType]
GO
PRINT N'Dropping [Person].[Address]'
GO
DROP TABLE [Person].[Address]
GO
PRINT N'Dropping [HumanResources].[Shift]'
GO
DROP TABLE [HumanResources].[Shift]
GO
PRINT N'Dropping [HumanResources].[JobCandidate]'
GO
DROP TABLE [HumanResources].[JobCandidate]
GO
PRINT N'Dropping [HumanResources].[EmployeePayHistory]'
GO
DROP TABLE [HumanResources].[EmployeePayHistory]
GO
PRINT N'Dropping [HumanResources].[EmployeeDepartmentHistory]'
GO
DROP TABLE [HumanResources].[EmployeeDepartmentHistory]
GO
PRINT N'Dropping [HumanResources].[Employee]'
GO
DROP TABLE [HumanResources].[Employee]
GO
PRINT N'Dropping [HumanResources].[Department]'
GO
DROP TABLE [HumanResources].[Department]
GO
PRINT N'Dropping [dbo].[ErrorLog]'
GO
DROP TABLE [dbo].[ErrorLog]
GO
PRINT N'Dropping [dbo].[AWBuildVersion]'
GO
DROP TABLE [dbo].[AWBuildVersion]
GO
PRINT N'Dropping types'
GO
DROP TYPE [dbo].[Flag]
GO
DROP TYPE [dbo].[AccountNumber]
GO
DROP TYPE [dbo].[NameStyle]
GO
DROP TYPE [dbo].[Name]
GO
DROP TYPE [dbo].[OrderNumber]
GO
DROP TYPE [dbo].[Phone]
GO
PRINT N'Dropping XML schema collections'
GO
DROP XML SCHEMA COLLECTION [HumanResources].[HRResumeSchemaCollection]
GO
DROP XML SCHEMA COLLECTION [Person].[AdditionalContactInfoSchemaCollection]
GO
DROP XML SCHEMA COLLECTION [Person].[IndividualSurveySchemaCollection]
GO
DROP XML SCHEMA COLLECTION [Production].[ManuInstructionsSchemaCollection]
GO
DROP XML SCHEMA COLLECTION [Production].[ProductDescriptionSchemaCollection]
GO
DROP XML SCHEMA COLLECTION [Sales].[StoreSurveySchemaCollection]
GO
PRINT N'Dropping schemas'
GO
IF SCHEMA_ID(N'HumanResources') IS NOT NULL
DROP SCHEMA [HumanResources]
GO
IF SCHEMA_ID(N'Person') IS NOT NULL
DROP SCHEMA [Person]
GO
IF SCHEMA_ID(N'Production') IS NOT NULL
DROP SCHEMA [Production]
GO
IF SCHEMA_ID(N'Purchasing') IS NOT NULL
DROP SCHEMA [Purchasing]
GO
IF SCHEMA_ID(N'Sales') IS NOT NULL
DROP SCHEMA [Sales]
GO

