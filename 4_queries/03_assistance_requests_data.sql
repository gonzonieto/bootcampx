SELECT t.name AS teacher,
       s.name AS student,
       a.name AS assignment_name,
       (ar.completed_at - ar.started_at) AS duration
  FROM assistance_requests AS ar
  JOIN students AS s ON s.id = ar.student_id
  JOIN teachers AS t ON t.id = ar.teacher_id
  JOIN assignments AS a ON a.id = ar.assignment_id
 ORDER BY duration