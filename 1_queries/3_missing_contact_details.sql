SELECT name, id, cohort_id, email, phone
  FROM students
 WHERE email IS NULL OR phone IS NULL;