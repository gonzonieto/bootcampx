-- TABLE ALIASES
  -- ar = assistance_requests
  -- s = students
  -- c = cohorts

SELECT AVG(assistance_time_by_cohort.total_duration) AS avg_total_duration
  FROM (
    SELECT c.name AS cohort,
           SUM(completed_at - started_at) AS total_duration
      FROM assistance_requests AS ar
      JOIN students AS s ON ar.student_id = s.id
      JOIN cohorts AS c ON s.cohort_id = c.id
     GROUP BY cohort
     ORDER BY total_duration
  ) AS assistance_time_by_cohort;