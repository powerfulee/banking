const express = require("express");
const router = express.Router();
const connection = require('../mysql');

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });

router.get('/list', function(req, res) {
    var sql = 'select id,navigation,name,status,create_date from t_finance_category order by navigation desc';
	
	connection.query(sql,function(error,result){
		console.log(result);
		res.render('category/list', {
	        title: '类别列表',
	        content: 'Welcome to the list page.',
	        list: result
    	});
	});
});

router.get('/add/:id', function(req, res) {
    var id = req.params.id;
    var sql = 'select id,name,navigation,status from t_finance_category where id=?';
    var sql_params = id;
    
    connection.query(sql,sql_params,function(error,result){
    	console.log(result);	
    	
    	res.render('category/add', {
	        title: '类别详情',
	        category: result
    	});	
    });
});

router.get('/add', function(req, res) {
	var category = '';
    res.render('category/add', {
        title: 'add',
        category: [ '' ]
    });
});

router.post('/insert', urlencodedParser, function(req, res) {
    var category_name = req.body.category_name;
	var category_status = req.body.category_status;
	var navigation = req.body.navigation;
	var category_id = req.body.category_id;
	var date = new Date();
	
	if (category_id == null || category_id == ''){
		var sql = 'insert into t_finance_category (name,status,navigation,create_date) values (?,?,?,?)';
		var sql_params = [category_name,category_status,navigation,date.getTime()];
	}else{
		var sql = 'update t_finance_category set name=?,navigation=?,status=?,create_date=? where id=?';
		var sql_params = [category_name,navigation,category_status,date.getTime(),category_id];
	}
	
	connection.query(sql,sql_params,function(error,result){
		if (error){
			console.log('[select error] -',error.message);
			return;
		}
		console.log(result);
		res.redirect('/category/list');	
	});
});

router.get('/delete/:id', function(req, res) {
    var id = req.params.id;
    var sql = 'delete from t_finance_category where id=?';
    var sql_params = id;
    
    connection.query(sql,sql_params,function(error,result){
    	console.log(id);	
    	res.redirect('/category/list');	
    });
});

router.post('/update', urlencodedParser, function(req, res) {
	var category_id = req.body.category_id;
    var category_name = req.body.category_name;
	var category_status = req.body.category_status;
	
	var sql = 'update category set category_name=?,status=? where id=?';
	var sql_params = [category_name,category_status,category_id];
	
	connection.query(sql,sql_params,function(error,result){
		if (error){
			console.log('[select error] -',error.message);
			return;
		}
		console.log(result);
		res.redirect('/category/list');	
	});
});

router.get('/jsons', function(req, res) {
	var sql = 'select id,navigation,name,status,create_date from t_finance_category order by navigation desc';
	
	connection.query(sql,function(error,result){
		var data = {'success': true, 'data': result};
		res.header("Access-Control-Allow-Origin", "*");
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(data));
	});
});

module.exports = router;