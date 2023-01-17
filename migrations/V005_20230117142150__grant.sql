SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO

PRINT(N'Add 6 rows to [Person].[AddressType]')
SET IDENTITY_INSERT [Person].[AddressType] ON
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (1, N'Billing', 'b84f78b1-4efe-4a0e-8cb7-70e9f112f886', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (2, N'Home', '41bc2ff6-f0fc-475f-8eb9-cec0805aa0f2', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (3, N'Main Office', '8eeec28c-07a2-4fb9-ad0a-42d4a0bbc575', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (4, N'Primary', '24cb3088-4345-47c4-86c5-17b535133d1e', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (5, N'Shipping', 'b29da3f8-19a3-47da-9daa-15c84f4a83a5', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[AddressType] ([AddressTypeID], [Name], [rowguid], [ModifiedDate]) VALUES (6, N'Archive', 'a67f238a-5ba2-444b-966c-0467ed9c427f', '2008-04-30 00:00:00.000')
SET IDENTITY_INSERT [Person].[AddressType] OFF

PRINT(N'Add 20 rows to [Person].[ContactType]')
SET IDENTITY_INSERT [Person].[ContactType] ON
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (1, N'Accounting Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (2, N'Assistant Sales Agent', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (3, N'Assistant Sales Representative', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (4, N'Coordinator Foreign Markets', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (5, N'Export Administrator', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (6, N'International Marketing Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (7, N'Marketing Assistant', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (8, N'Marketing Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (9, N'Marketing Representative', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (10, N'Order Administrator', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (11, N'Owner', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (12, N'Owner/Marketing Assistant', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (13, N'Product Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (14, N'Purchasing Agent', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (15, N'Purchasing Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (16, N'Regional Account Representative', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (17, N'Sales Agent', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (18, N'Sales Associate', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (19, N'Sales Manager', '2008-04-30 00:00:00.000')
INSERT INTO [Person].[ContactType] ([ContactTypeID], [Name], [ModifiedDate]) VALUES (20, N'Sales Representative', '2008-04-30 00:00:00.000')
SET IDENTITY_INSERT [Person].[ContactType] OFF

