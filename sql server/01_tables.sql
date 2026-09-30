CREATE TABLE Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1
);

CREATE TABLE Patients
(
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    IsActive BIT NOT NULL DEFAULT 1
);

CREATE TABLE PatientVisits
(
    VisitID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DepartmentID INT NOT NULL,
    VisitDate DATETIME NOT NULL,
    VisitType VARCHAR(30) NOT NULL,
    VisitStatus VARCHAR(30) NOT NULL,
    Diagnosis VARCHAR(500),

    CONSTRAINT FK_PatientVisits_Patients
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    CONSTRAINT FK_PatientVisits_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);