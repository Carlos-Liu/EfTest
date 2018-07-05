-- init Roles 
INSERT INTO dbo.Roles(Id,AzureRoleId,Name) VALUES(1,'76f938d6-b970-497d-a500-72277bc75011','Administrator'),(2,'5c6a8000-3497-4bd3-983a-ad4f5d8ceefe','User')
GO

-- init Users

-- init UserRoles
-- Add fake users and roles information
INSERT INTO dbo.Users(Id, AzureAdId, Email, FirstName, LastName, DisplayName, CreateTimeUtc, IsRetired) 
              VALUES (N'user-id-1', N'azure-id-001', N'user1@test.com', N'First1', N'Last1', N'Display Name 1', '2018-05-10 00:00:01', 0);
INSERT INTO dbo.Users(Id, AzureAdId, Email, FirstName, LastName, DisplayName, CreateTimeUtc, IsRetired) 
              VALUES (N'user-id-2', N'azure-id-002', N'user2@test.com', N'First2', NULL, N'Display Name 2','2018-05-10 00:00:02', 0);
INSERT INTO dbo.Users(Id, AzureAdId, Email, FirstName, LastName, DisplayName, CreateTimeUtc, IsRetired) 
              VALUES (N'user-id-3', N'azure-id-003', N'user3@test.com', N'First3', N'Last3', N'Display Name 3','2018-05-10 00:00:03', 0);

INSERT INTO dbo.Roles (Id, AzureRoleId, Name) VALUES (100, N'azure-role-1', N'Admin');
INSERT INTO dbo.Roles (Id, AzureRoleId, Name) VALUES (200, N'azure-role-2', N'User');

INSERT INTO dbo.UserRoles (UserId, RoleId, AzureRltnId) VALUES (N'user-id-1', 100, '001');
INSERT INTO dbo.UserRoles (UserId, RoleId, AzureRltnId) VALUES (N'user-id-2', 200, '002');
INSERT INTO dbo.UserRoles (UserId, RoleId, AzureRltnId) VALUES (N'user-id-3', 200, '003');
