

CREATE TABLE departments
(
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE patients
(
    patient_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE patient_visits
(
    visit_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    department_id INTEGER NOT NULL,
    visit_date TIMESTAMP NOT NULL,
    visit_type VARCHAR(30) NOT NULL,
    visit_status VARCHAR(30) NOT NULL,
    diagnosis VARCHAR(500),

    CONSTRAINT fk_patient_visits_patients
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_patient_visits_departments
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);