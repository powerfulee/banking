银行理财产品app
===
### 技术栈
~~~
后端backend使用node.js+express+ejs
~~~
![image](https://github.com/powerfulee/banking/raw/master/public/images/demo/backend.jpg)
~~~
前端frontend使用vue+mint-ui
~~~
![image](https://github.com/powerfulee/banking/raw/master/public/images/demo/frontend.jpg)
### 开发环境
~~~
node.js v6.10.1
vue v2.9.6
mysql v5.6
~~~
### 项目配置
~~~
后端数据库配置：backend/mysql.js，填写mysql服务器ip、用户名、密码、数据库名
前端接口配置：frontend/src/config/Global.js，如果使用手机真机访问，请将localhost改为ip地址
~~~
### 项目启动步骤
~~~
1、新建banking数据库，执行script目录中banking.sql脚本导入数据。
2、进入backend目录，执行npm install或cnpm install安装依赖模块，修改backend/mysql.js本机mysql地址、用户名、密码，然后执行node ./bin/www启动后端项目，浏览器访问http://localhost:3000
3、进入frontend目录，执行npm install或cnpm install安装依赖模块，修改frontend/src/config/Global.js后端api地址，然后cnpm run dev启动前端项目，浏览器访问http://localhost:8080，为获得更好体验效果，建议使用chrome浏览器并设为手机模式，或者使用手机真机访问。
~~~
