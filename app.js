//app.js
//1:加载模块 express pool.js
const express = require("express");
const pool = require("./pool");
//2:创建服务器端对象
var app = express();
//3:监听 3000
app.listen(3000);
//4:指定静态目录  public 
app.use(express.static("public"));
// 5.加载跨域访问的模块
const cors = require("cors");
// 6.配置跨域访问的模块：哪个域名跨域允许访问----脚手架8080
// origin 允许卡与访问域名列表 credentials 跨域访问保存session id
app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))
//6.1:下载 express-session 并且配置
const session = require("express-session");
app.use(session({
  secret:"128位随机字符", //安全字符串
  resave:false,          //每次请求是否都更新数据
  saveUninitialized:true, //初始化时保存数据
  cookie:{
    maxAge:1000 * 60 * 60 * 8
  }
}));
//7:加载第三方模块 body-parser
//body-parser 针对post请求处理请求参数
//如果配置成功 req.body..
const bodyParser = require("body-parser");
//8:配置对特殊 json是否是自动转换 不转换
app.use(bodyParser.urlencoded({extended:false}))

// 功能一：新书推荐--热门浏览页面/分业
app.get("/Hotbook",(req,res)=>{
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 10;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM book LIMIT ?,?";
  var ps = parseInt(pageSize);
  var offset = (pno-1)*pageSize;
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  // 4. 返回
})

// 功能二首页轮播图页面渲染
app.get("/Index",(req,res)=>{
  // 3. 创建sql语句
  var sql = " SELECT * FROM newbook";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  // 4. 返回
})

// 功能三新书上架页面渲染
app.get("/Newbook",(req,res)=>{
  // 3. 创建sql语句
  var sql = " SELECT * FROM newbook";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 功能四用户登录
app.get("/Login",(req,res)=>{
  var uid = req.query.uid;
  var upwd = req.query.upwd
  var sql = "SELECT * FROM user WHERE uid = ? AND upwd = ?";
  pool.query(sql,[uid,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length == 0){
      res.send({code:-1,msg:"学号或密码有误"});
    }else{
       //将用户登录凭证保存在服务器端 session对象中
       var uid = result[0].uid;//获取当前用户id
       req.session.uid = uid; //保存session
       res.send({code:1,msg:"登录成功"});
    }
  })
})

// 功能四：点击某一本新书跳转到详情页面
app.get('/Bookdetail',(req,res)=>{
  var nid = req.query.nid;
  var sql = "SELECT * FROM newbook WHERE nid = ?"
  pool.query(sql,[nid],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send({code:1,data:result});
  })
});