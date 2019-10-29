const express = require('express')
//const bodyParser = require('body-parser');
const path = require('path')
const PORT = process.env.PORT || 5000
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  //ssl: true
});

pool.on('connect', () => console.log('connected to db'));

express()
  .use(express.static(path.join(__dirname, 'public')))
  .use(express.urlencoded())
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => res.render('pages/index'))
  .get('/members', (req, res) => res.render('pages/members'))
  .get('/admin', (req, res) => res.render('pages/add'))
  .post('/addmember', async (req, res) => {
    var pName = req.body.pName;
    var pClass = req.body.pClass;
    var rank = req.body.rank;
    var joinDate = req.body.joinDate;
    
    var insert = 'INSERT INTO members (name, class, rank, joined) VALUES($1,$2,$3,$4)';
    const client = await pool.connect()
    client.query(insert, [pName, pClass, rank, joinDate]);/*, function(err, result){
      if (!result){
        console.log("Error");
      } else {
        console.log("Success");
        client.release();
      }
    });*/
    client.release();
  })
  .post('/addraid', async (req, res) => {
    var rName = req.body.rName;
    var rDate = req.body.rDate;
    
    var insert = 'INSERT INTO raids (raid_name,date) VALUES($1,$2)';
    const client = await pool.connect()
    client.query(insert, [rName,rDate]);/*, function(err, result){
      if (!result){
        console.log("Error");
      } else {
        console.log("Success");
        client.release();
      }
    });*/
    client.release();
  })
  .listen(PORT, () => console.log(`Listening on ${ PORT }`))
