
var mysql = require('mysql');
var connection = mysql.createConnection({
	host : '192.168.3.40',
	user : 'sycf',
	password : '000000',
	database : 'homestead',
	port : '3306',
	charset : 'UTF8_GENERAL_CI'
})

module.exports = connection