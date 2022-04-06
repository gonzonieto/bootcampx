-- TABLE ALIASES:
  -- ar = assistance_requests
  -- s = students
  -- c = cohorts

SELECT c.name AS cohort_name,
       AVG(completed_at - started_at) AS avg_assistance_time
  FROM assistance_requests AS ar
  JOIN students AS s ON ar.student_id = s.id
  JOIN cohorts AS c ON s.cohort_id = c.id
 GROUP BY cohort_name
 ORDER BY avg_assistance_time DESC
 LIMIT 1;