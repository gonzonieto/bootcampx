-- c.name AS cohort_name,
-- s.cohort_id AS cohort_id,
-- s.name AS student_name,
-- a.assignment_id AS assignment_id,
-- a.duration AS duration
SELECT SUM(a.duration) AS total_duration
  FROM students AS s
  JOIN assignment_submissions AS a ON s.id = a.student_id
  JOIN cohorts AS c ON cohort_id = c.id
 WHERE c.name = 'FEB12'