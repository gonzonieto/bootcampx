SELECT COUNT(ar) AS total_assistances,
       t.name AS teacher
  FROM teachers AS t
  JOIN assistance_requests AS ar ON t.id = ar.teacher_id
 WHERE t.name = 'Waylon Boehm'
 GROUP BY teacher