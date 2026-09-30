INSERT INTO Departments
    (DepartmentName)
VALUES
    ('Cardiology'),
    ('Neurology'),
    ('General Medicine'),
    ('Emergency');


INSERT INTO Patients
    (PatientName, Gender, DateOfBirth)
VALUES
    ('John Smith', 'Male', '1990-05-15'),
    ('David Kumar', 'Male', '1985-08-20'),
    ('Sarah Williams', 'Female', '1995-02-10'),
    ('Priya Sharma', 'Female', '1992-11-25'),
    ('Robert Brown', 'Male', '1978-04-12');


INSERT INTO PatientVisits
(
    PatientID,
    DepartmentID,
    VisitDate,
    VisitType,
    VisitStatus,
    Diagnosis
)
VALUES

-- Cardiology
(1, 1, '2026-01-10 10:30:00',
 'OPD', 'Completed', 'Hypertension'),

(1, 1, '2026-02-15 11:00:00',
 'Follow-up', 'Completed', 'Hypertension'),

(2, 1, '2026-02-20 14:30:00',
 'OPD', 'Completed', 'Chest Pain'),

(5, 1, '2026-03-05 09:30:00',
 'Emergency', 'Completed', 'Chest Pain'),

-- Neurology
(2, 2, '2026-01-15 09:00:00',
 'OPD', 'Completed', 'Migraine'),

(3, 2, '2026-02-12 10:30:00',
 'Follow-up', 'Completed', 'Migraine'),

(3, 2, '2026-03-20 15:00:00',
 'OPD', 'Completed', 'Headache'),

-- General Medicine
(4, 3, '2026-01-18 11:00:00',
 'OPD', 'Completed', 'Fever'),

(4, 3, '2026-02-22 12:00:00',
 'Follow-up', 'Completed', 'Fever'),

(1, 3, '2026-03-10 13:00:00',
 'OPD', 'Completed', 'Viral Infection'),

-- Emergency
(5, 4, '2026-01-25 22:00:00',
 'Emergency', 'Completed', 'Accident'),

(2, 4, '2026-02-18 21:30:00',
 'Emergency', 'Completed', 'Injury');