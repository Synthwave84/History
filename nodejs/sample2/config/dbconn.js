var mysql = require('mysql2');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'nodejs',
    password: 'nodejs',
    database: 'study'
});
db.connect();

module.exports = db;