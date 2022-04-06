SELECT s.name AS student_name,
       AVG(subs.duration) AS avg_completion_time
  FROM assignment_submissions AS subs
  JOIN students AS s ON s.id = subs.student_id
 WHERE s.end_date IS NULL
 GROUP BY student_name
 ORDER BY avg_completion_time DESC