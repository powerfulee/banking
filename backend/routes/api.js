const express = require("express");
const router = express.Router();
const connection = require('../mysql');

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });

var jsonParser = bodyParser.json(); 
var qs = require('querystring');  

var app = express();
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json());

app.post('/product/list', function(req, res) {
	var start = req.body.page;
	var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id order by a.id desc limit ?,10';
	var sql_params = (start-1)*10;
		
	connection.query(sql,sql_params,function(error,result){
		connection.query('select count(*) from t_finance',function(error,countResult) {
			var totalCount = countResult[0]['count(*)'];
			var totalPage = parseInt(totalCount)/10;
			var pageStr = totalPage.toString();
			
			if (pageStr.indexOf('.') > 0) {
				totalPage = parseInt(pageStr.split('.')) + 1;
			}
			
			var data = {'success': true, 'totalPage': totalPage, 'totalNum': totalCount, 'data': result};
			res.header("Access-Control-Allow-Origin", "*");
			res.writeHead(200, {'Content-Type': 'application/json'});
			res.end(JSON.stringify(data));
			
		});
	});
});

app.post('/rotates/list', function(req, res) {
	var start = req.body.page;
	var sql = 'select id,name,pic_url,link_url from t_finance_banner limit ?,10';
	var sql_params = (start-1)*10;
	
	connection.query(sql,sql_params,function(error,result){
		connection.query('select count(*) from t_finance_banner',function(error,countResult) {
			var totalCount = countResult[0]['count(*)'];
			var totalPage = parseInt(totalCount)/10;
			var pageStr = totalPage.toString();
			
			if (pageStr.indexOf('.') > 0) {
				totalPage = parseInt(pageStr.split('.')) + 1;
			}
			
			var data = {'success': true, 'totalPage': totalPage, 'totalNum': totalCount, 'data': result};
			res.header("Access-Control-Allow-Origin", "*");
			res.writeHead(200, {'Content-Type': 'application/json'});
			res.end(JSON.stringify(data));
			
		});
	});
});

app.post('/product/category', function(req, res) {
	var category_id = req.body.id;
	var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id where a.category_id=? order by a.id desc';
	var sql_params = category_id;
	
	connection.query(sql,sql_params,function(error,result){
		var data = {'success': true, 'data': result};
		res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Credentials", "true");
        res.header("Access-Control-Allow-Methods", "*");
        res.header("Access-Control-Allow-Headers", "Content-Type,Access-Token");
        res.header("Access-Control-Expose-Headers", "*");
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(data));
	});
});

app.get('/product/detail/:id', function(req, res) {
    var id = req.params.id;
    var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id where a.id=?';
    var sql_params = id;
    
    connection.query(sql,sql_params,function(error,result){
		var data = {'success': true, 'data': result};
		res.header("Access-Control-Allow-Origin", "*");
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(data));
	});
});

app.get('/rotates/list', function(req, res) {
	var sql = 'select id,name,pic_url,link_url from t_finance_banner';
	
	connection.query(sql,function(error,result){
		var data = {'success': true, 'data': result};
		res.header("Access-Control-Allow-Origin", "*");
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(data));
	});
});

module.exports = app;