CREATE TABLE Files
(
	ID INTEGER PRIMARY KEY,
	Name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE Permissions
(
	ID INTEGER PRIMARY KEY,
	Name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE FilePermissions
(
	PermissionID INTEGER,
	FileID INTEGER, 
	FOREIGN KEY(PermissionID) REFERENCES Permissions(ID) ON DELETE CASCADE,
	FOREIGN KEY(FileID) REFERENCES Files(ID) ON DELETE CASCADE,
	PRIMARY KEY(PermissionID, FileID)
);

CREATE TABLE Users
(
	ID INTEGER PRIMARY KEY,
	Name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE UserPermissions
(
	PermissionID INTEGER,
	UserID INTEGER,
	FOREIGN KEY(PermissionID) REFERENCES Permissions(ID) ON DELETE CASCADE,
	FOREIGN KEY(UserID) REFERENCES Users(ID) ON DELETE CASCADE,
	PRIMARY KEY(PermissionID, UserID)
);

CREATE TABLE Groups
(
	ID INTEGER PRIMARY KEY,
	Name varchar(255) NOT NULL UNIQUE
);

CREATE TABLE GroupPermissions
(
	PermissionID INTEGER,
	GroupID INTEGER,
	FOREIGN KEY(PermissionID) REFERENCES Permissions ON DELETE CASCADE,
	FOREIGN KEY(GroupID) REFERENCES Groups(ID) ON DELETE CASCADE,
	PRIMARY KEY(PermissionID, GroupID)
);

CREATE TABLE GroupMembers
(
	GroupID INTEGER,
	UserID INTEGER,
	FOREIGN KEY(GroupID) REFERENCES Groups(ID) ON DELETE CASCADE,
	FOREIGN KEY(UserID) REFERENCES Users(ID) ON DELETE CASCADE,
	PRIMARY KEY(GroupID, UserID)
);