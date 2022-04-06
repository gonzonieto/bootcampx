SELECT s.name AS student,
       AVG(subs.duration) AS avg_completion_time,
       AVG(a.duration) AS avg_suggested_completion_time
  FROM assignment_submissions AS subs
  JOIN students AS s ON subs.student_id = s.id
  JOIN assignments AS a ON subs.assignment_id = a.id
 WHERE s.end_date IS NULL
 GROUP BY student
HAVING AVG(subs.duration) < AVG(a.duration)
 ORDER BY avg_completion_time