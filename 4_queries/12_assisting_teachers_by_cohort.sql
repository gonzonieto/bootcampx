SELECT t.name AS teacher, c.name AS cohort, COUNT(ar.*)
  FROM assistance_requests AS ar
  JOIN students AS s ON s.id = ar.student_id
  JOIN teachers AS t ON t.id = ar.teacher_id
  JOIN cohorts AS c ON c.id = s.cohort_id
 WHERE c.name = 'JUL02'
 GROUP BY cohort, teacher
 ORDER BY t.name;