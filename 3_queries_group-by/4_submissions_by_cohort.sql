SELECT cohorts.name AS cohort_name,
      --  Count how many assignment entries ...
       COUNT(assignment_submissions.id) AS sub_count
  FROM cohorts
  JOIN students ON students.cohort_id = cohorts.id
  JOIN assignment_submissions ON students.id = assignment_submissions.student_id
  -- ... there are for each cohort
 GROUP BY cohort_name
 ORDER BY sub_count DESC