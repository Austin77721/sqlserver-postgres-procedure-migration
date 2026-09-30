

CREATE OR ALTER PROCEDURE dbo.GetDepartmentVisitSummary
(
    @FromDate DATE,
    @ToDate DATE
)
AS
BEGIN

    SET NOCOUNT ON;

    /*
        Business Logic:

        Generate department-wise patient visit summary.

        Only Completed visits are included.

        Visit types are converted from rows into columns:

        OPD
        Emergency
        Follow-up
        Inpatient
    */

    SELECT
        DepartmentName,
        ISNULL([OPD], 0) AS OPD,
        ISNULL([Emergency], 0) AS Emergency,
        ISNULL([Follow-up], 0) AS FollowUp,
        ISNULL([Inpatient], 0) AS Inpatient,

        ISNULL([OPD], 0)
        + ISNULL([Emergency], 0)
        + ISNULL([Follow-up], 0)
        + ISNULL([Inpatient], 0)
        AS TotalVisits

    FROM
    (
        SELECT
            d.DepartmentName,
            pv.VisitType,
            pv.VisitID

        FROM PatientVisits pv

        INNER JOIN Departments d
            ON pv.DepartmentID = d.DepartmentID

        WHERE pv.VisitDate >= @FromDate
          AND pv.VisitDate < DATEADD(DAY, 1, @ToDate)

          AND pv.VisitStatus = 'Completed'

          AND d.IsActive = 1
    ) AS SourceData

    PIVOT
    (
        COUNT(VisitID)

        FOR VisitType IN
        (
            [OPD],
            [Emergency],
            [Follow-up],
            [Inpatient]
        )
    ) AS PivotData

    ORDER BY DepartmentName;

END;
GO