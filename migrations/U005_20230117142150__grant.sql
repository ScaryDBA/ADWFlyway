SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO

PRINT(N'Delete 20 rows from [Person].[ContactType]')
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 1
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 2
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 3
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 4
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 5
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 6
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 7
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 8
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 9
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 10
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 11
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 12
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 13
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 14
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 15
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 16
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 17
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 18
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 19
DELETE FROM [Person].[ContactType] WHERE [ContactTypeID] = 20

PRINT(N'Delete 6 rows from [Person].[AddressType]')
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 1
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 2
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 3
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 4
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 5
DELETE FROM [Person].[AddressType] WHERE [AddressTypeID] = 6

