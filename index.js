const express = require('express')
const path = require('path')
const PORT = process.env.PORT || 5000
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: true
});

express()
  .use(express.static(path.join(__dirname, 'public')))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => res.render('pages/index'))
  .get('/members', (req, res) => res.render('pages/members'))
  .get('/admin', (req, res) => res.render('pages/add'))
  .post('/addmember', async (req, res) => {
    var name = req.body.name;
    var Class = req.body.class;
    var rank = req.body.rank;
    var date = req.body.date;
    
    var insertP = 'INSERT INTO members (name, Class, rank, date) VALUES(default,$1,$2,$3,$4,true)';
    const client = await pool.connect()
  })
  .listen(PORT, () => console.log(`Listening on ${ PORT }`))
