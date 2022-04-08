const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

console.log();
if (args.length) {
  console.table(args);
}

const cohort = process.argv[2];
const limit = process.argv[3];

pool.query(`
SELECT s.id,
       s.name,
       c.name AS cohort
  FROM students AS s
  JOIN cohorts AS c ON s.cohort_id = c.id
 WHERE c.name ILIKE '${cohort}%'  
 LIMIT ${limit || 5};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => {
    console.error('query error', err.stack);
  })
  .finally(() => {
    pool.end();
  });