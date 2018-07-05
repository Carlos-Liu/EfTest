/*************************************************************
Description: create schema level security for Connect project
History:
    * Add from v1.0
*************************************************************/

--create user login
IF  EXISTS (SELECT name FROM master.sys.server_principals WHERE name = 'CTS_Prod')
DROP LOGIN CTS_Prod;  
GO

-- create LOGIN under "master" DB
CREATE LOGIN CTS_Prod WITH PASSWORD = N'connectp@55w0rd'
GO


--create user in BeckmanConnect database "CTS_DEV"
CREATE USER CTS_Prod FOR LOGIN CTS_Prod WITH DEFAULT_SCHEMA = CTS
GO

--create role
CREATE ROLE CTS_Role AUTHORIZATION dbo
GO

--create schema
CREATE SCHEMA CTS AUTHORIZATION dbo
GO

--apply permissions to schema
GRANT 
	INSERT,
	DELETE,
	UPDATE,
	SELECT 
ON SCHEMA::CTS TO CTS_Role
GO

--ensure role membership is correct
EXEC sp_addrolemember N'CTS_Role ', N'CTS_Prod'
GO

--allow user to connect to database
GRANT CONNECT TO CTS_Prod
GO
