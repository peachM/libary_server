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

// 功能一：新书页面
app.get("/newbook",(req,res)=>{
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 10;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM new_book LIMIT ?,?";
  var ps = parseInt(pageSize);
  var offset = (pno-1)*pageSize;
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  // 4. 返回
})


