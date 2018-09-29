const express = require("express");
const router = express.Router();
const connection = require('../mysql');

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });

var formidable = require('formidable');
var fs = require("fs");

/*
router.get("/list", function(req, res){
    var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id order by a.id desc';
	
	var page = req.query.page;
	var limit = req.query.limit;
	var data = {currentPage:page,totalPages:0};
	
	connection.query(sql,function(error,result){
		//console.log(result);
		res.render('product/list', {
	        title: '产品列表',
	        list: result
    	});
	});
})
*/
router.get("/list", function(req, res){
    var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id order by a.id desc';
	
	var page = req.query.page ? parseInt(req.query.page) : 1;
	var data = {currentPage:page,totalPages:0};
	
	connection.query('select count(*) from t_finance',function(error,countResult)
	{
		if(countResult){
			var totalCount = countResult[0]['count(*)'];
			var totalPage = parseInt(totalCount)/10;
			var pageStr = totalPage.toString();
			
			if (pageStr.indexOf('.') > 0) {
				totalPage = parseInt(pageStr.split('.')) + 1;
			}
			
            data.totalPages = totalPage;
            console.log("获取总数：" + data.totalPages);  
        }
        
        connection.query("select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id order by a.id desc limit " + (page-1)*10 + ",10",function(error,result){
        	data.items = result;
        	console.log(data);
        	res.render('product/list', {
	        	title: '产品列表',
	        	list: data
    		});
        });
	});
})

router.get('/add', function(req, res) {
	var sql = 'select id,name from t_finance_category';
	
    connection.query(sql,function(error,result){
		if (error){
			console.log('[select error] -',error.message);
			return;
		}
		res.render('product/add', {
        	title: 'add',
        	content: 'Welcome to the add page.',
        	categories: result,
        	product: ['']
    	});
	});
});

router.get('/add/:id', function(req, res) {
    var id = req.params.id;
    var sql = 'select id,category_id,name,icon,description,status from t_finance where id=?';
    var sql_params = id;
    
    connection.query('select id,name from t_finance_category',function(error,categories){
    	
    	connection.query(sql,sql_params,function(error,product){
    		
	    	res.render('product/add', {
		        title: '类别详情',
		        content: 'Welcome to the add page.',
		        categories: categories,
		        product: product
	    	});
	    });
    });
});

router.get('/upload', function(req, res) {
	res.render('product/upload', {
        title: 'upload',
        content: 'Welcome to the add page.',
        filePath: ''
    });
});

router.post('/uploaded',  function(req, res) {
  	var date = new Date();
  	var currentDate = date.getFullYear() + '' + (date.getMonth()+1) + '' + date.getDate();
  	
  	var saveDir = 'd:/nodejs/bank/public/images/product/' + currentDate;
  	
	var form = new formidable.IncomingForm();
	form.encoding = 'utf-8'; //设置编辑
  	form.uploadDir = saveDir; //设置上传目录
  	form.keepExtensions = true; //保留后缀
  	form.maxFieldsSize = 2 * 1024 * 1024; //文件大小
  	form.type = true;
  	
  	if (!fs.existsSync(saveDir)){
  		fs.mkdirSync(saveDir);
  	}
  	
  	console.log(saveDir);
    
  	form.parse(req, function(err, fields, files) {
  		var filePath = '';
        //如果提交文件的form中将上传文件的input名设置为tmpFile，就从tmpFile中取上传文件。否则取for in循环第一个上传的文件。
        if(files.tmpFile){
            filePath = files.tmpFile.path;
        } else {
            for(var key in files){
                if( files[key].path && filePath==='' ){
                    filePath = files[key].path;
                    break;
                }
            }
        }
        var fileExt = filePath.substring(filePath.lastIndexOf('.'));
        
  		if (('.jpg.jpeg.png.gif').indexOf(fileExt.toLowerCase()) === -1) {
            var err = new Error('此文件类型不允许上传');
            res.json({code:-1, message:'此文件类型不允许上传'});
        } else {
	  		var avatarName = '/' + Date.now() + fileExt;
		    var newPath = form.uploadDir + avatarName;
      		
	  		fs.renameSync(filePath, newPath);
		  	res.render('product/upload', {
		  		title: 'upload',
        		content: 'Welcome to the add page.',
		        filePath: '/public/images/product/' + currentDate + avatarName
		    });
		}
	});
});

router.post('/insert', urlencodedParser, function(req, res) {
	var category_id = req.body.category_id;
	var product_id = req.body.product_id;
	var product_status = req.body.productStatus;
	var product_name = req.body.productName;
	var product_pic = req.body.productPic;
	var content = req.body.content;
	var product_id = req.body.product_id;
	var currentTime = new Date().getTime();
	
	if (product_id == null || product_id == ''){
		var sql = 'insert into t_finance (category_id,name,icon,description,status,create_date) values (?,?,?,?,?,?)';
		var sql_params = [category_id,product_name,product_pic,content,product_status,currentTime];
		console.log('insert');
	}else{
		var sql = 'update t_finance set category_id=?,name=?,icon=?,description=?,status=?,create_date=? where id=?';
		var sql_params = [category_id,product_name,product_pic,content,product_status,currentTime,product_id];
		console.log('update');
	}
	
	connection.query(sql,sql_params,function(error,result){
		if (error){
			console.log('[select error] -',error.message);
			return;
		}
		//console.log(result);
		res.redirect('/product/list');	
	});
});

router.get('/delete/:id', function(req, res) {
    var id = req.params.id;
    var sql = 'delete from t_finance where id=?';
    var sql_params = id;
    
    connection.query(sql,sql_params,function(error,result){
    	console.log(id);	
    	res.redirect('/product/list');	
    });
});

router.get('/jsons', function(req, res) {
	var sql = 'select a.id,b.name as category_name,a.name,a.icon,a.description,a.link_url,a.status,a.create_date from t_finance as a left join t_finance_category as b on a.category_id=b.id order by a.id desc';
	
	connection.query(sql,function(error,result){
		var data = {'success': true, 'data': result};
		res.header("Access-Control-Allow-Origin", "*");
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(data));
	});
});

module.exports = router;