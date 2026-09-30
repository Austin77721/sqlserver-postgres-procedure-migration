

CREATE OR REPLACE PROCEDURE get_department_visit_summary
(
    IN p_from_date DATE,
    IN p_to_date DATE,
    INOUT p_result REFCURSOR
)
LANGUAGE plpgsql
AS $$
/*
BEGIN;

CALL get_department_visit_summary
(
    DATE '2026-01-01',
    DATE '2026-03-31',
    'department_visit_cursor'
);

FETCH ALL FROM department_visit_cursor;

COMMIT;

*/
BEGIN

    OPEN p_result FOR

    SELECT
        d.department_name,

        COUNT(*) FILTER
        (
            WHERE pv.visit_type = 'OPD'
        ) AS opd,

        COUNT(*) FILTER
        (
            WHERE pv.visit_type = 'Emergency'
        ) AS emergency,

        COUNT(*) FILTER
        (
            WHERE pv.visit_type = 'Follow-up'
        ) AS follow_up,

        COUNT(*) FILTER
        (
            WHERE pv.visit_type = 'Inpatient'
        ) AS inpatient,

        COUNT(*) AS total_visits

    FROM patient_visits pv

    INNER JOIN departments d
        ON pv.department_id = d.department_id

    WHERE pv.visit_date >= p_from_date

      AND pv.visit_date < p_to_date + INTERVAL '1 day'

      AND pv.visit_status = 'Completed'

      AND d.is_active = TRUE

    GROUP BY
        d.department_name

    ORDER BY
        d.department_name;

END;
$$;