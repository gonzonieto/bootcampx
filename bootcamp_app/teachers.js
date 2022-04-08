const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Log command-line args to console, if there were any
if (process.argv.length > 2) {
  console.log();
  console.table(process.argv.slice(2));
}

console.log();

const cohort = process.argv[2] || 'JUL02';

const query = {
  name: 'students-in-cohort',
  text: `SELECT t.name AS teacher, c.name AS cohort, COUNT(ar.*)
           FROM assistance_requests AS ar
           JOIN students AS s ON s.id = ar.student_id
           JOIN teachers AS t ON t.id = ar.teacher_id
           JOIN cohorts AS c ON c.id = s.cohort_id
          WHERE c.name = $1
          GROUP BY cohort, teacher
          ORDER BY t.name;`,
  values: [`${cohort}`],
};

pool.query(query)
  .then(res => {
    console.log(res.rows);
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => pool.end());