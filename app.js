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
  var sql = " SELECT * FROM newbook ORDER BY entry_time DESC";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  // 4. 返回
})

// 功能三新书上架页面渲染
app.get("/Newbook",(req,res)=>{
  // 3. 创建sql语句
  var sql = " SELECT * FROM newbook ORDER BY entry_time ASC";
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
       console.log(uid);
       req.session.uid = uid; //保存session
       console.log(req.session.uid);
       res.send({code:1,msg:"登录成功"});
    }
  })
})

// 功能五：点击某一本新书跳转到详情页面
app.get('/Bookdetail',(req,res)=>{
  var nid = req.query.nid;
  var sql = "SELECT * FROM newbook WHERE nid = ?"
  pool.query(sql,[nid],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send({code:1,data:result});
  })
});
// 

// 功能六：根据书名，搜索所有书籍
app.get("/Search",(req,res)=>{
  var key = req.query.key;
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 10;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM book WHERE CONCAT(title,author,press,ISBN) LIKE ? LIMIT ?,?";
  var ps = parseInt(pageSize);
  var offset = (pno-1)*pageSize;
  pool.query(sql,["%"+key+"%",offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  });
  // 4. 返回
});

// 功能七：获取用户名列表
/* app.get("/User",(req,res)=>{
  // 3. 创建sql语句
  var sql = " SELECT * FROM user";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
}) */

app.get("/User",(req,res)=>{
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 10;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM user LIMIT ?,?";
  var ps = parseInt(pageSize);
  var offset = (pno-1)*pageSize;
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  // 4. 返回
})


// 功能八：根据图书分类求每类图书的个数
/* app.get("/Classify",(req,res)=>{
  var classify = req.query.classify;
  var sql = "SELECT count(classify) as count from book where classify = ?"
  pool.query(sql,[classify],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
}); */
// select classify ,count(*) as total from newbook group by classify having count(1)>1; 
app.get("/Classify",(req,res)=>{
  // var classify = req.query.classify;
  var sql = "SELECT classify ,count(*) as total from book group by classify";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});


// 功能九：管理员 新增用户
app.post("/Addstudent",(req,res)=>{
  console.log(req.body)
  var uid = req.body.uid;
  var upwd = req.body.upwd;
  var name = req.body.name;
  var sex = req.body.sex;
  var tel = req.body.tel;
  var dept = req.body.dept;
  var uclass = req.body.uclass;
  var sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,null,null,null)"
  pool.query(sql,[uid,upwd,name,sex,tel,dept,uclass],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"插入成功！"});
    }else{
      res.send({code:-1,msg:"插入失败！"});
    }
  })
});

// 功能十：管理员 修改用户信息
app.post("/Edit",(req,res)=>{
  console.log(req.body)
  var uid = req.body.uid;
  var upwd = req.body.upwd;
  var name = req.body.name;
  var tel = req.body.tel;
  var dept = req.body.dept;
  var uclass = req.body.uclass;
  var sql = "UPDATE user SET upwd=?,name=?,tel=?,dept=?,uclass=? where uid=?";
  pool.query(sql,[upwd,name,tel,dept,uclass,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"更新成功！"});
    }else{
      res.send({code:-1,msg:"更新失败！"});
    }
  })
})
//功能十一： 根据id 编辑当前用户信息
app.get('/getUser', (req, res) => {
  var uid = req.query.uid;
  var sql = `SELECT upwd,name,tel,dept,uclass FROM user WHERE uid=?`;
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

app.get("/getInfo",(req,res) =>{
  var uid = req.query.uid;
  var sql = `SELECT uid,name,sex,tel,dept,uclass,remark FROM user WHERE uid=?`;
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 功能十二： 根据id 删除当前用户信息
app.get('/delUser',(req,res) => {
  var uid = req.query.uid;
  var sql = `DELETE FROM user WHERE uid =?`;
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功！"});
    }else{
      res.send({code:-1,msg:"删除失败！"});
    }
  })
})

// 功能十三： 根据关键字查找用户信息
app.get("/userSearch",(req,res)=>{
  var key = req.query.key;
  var upno = req.query.upno;
  var upageSize = req.query.upageSize;
  if(!upno){
    upno = 1;
  }
  if(!upageSize){
    upageSize = 50;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM user WHERE CONCAT(uid,name,dept,uclass) LIKE ? LIMIT ?,?";
  var ps = parseInt(upageSize);
  var offset = (upno-1)*upageSize;
  pool.query(sql,["%"+key+"%",offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  });
  // 4. 返回
});

/* // 功能十四：借阅功能
app.post("/Borrow",(req,res)=>{
  // var uid = req.session.uid;
  var bookname = req.body.bookname;
  var borrowdate = req.body.borrowdate;
  var Ereturndate = req.body.Ereturndate;
  var sql = "INSERT INTO borrow VALUES(null,?,?,?,null,null)";
    pool.query(sql,[bookname,borrowdate,Ereturndate],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
}) */

app.post("/Borrow",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  var uid = req.session.uid;
  var bookname = req.body.bookname;
  var borrowdate = req.body.borrowdate;
  var Ereturndate = req.body.Ereturndate;
  var sql = "SELECT * FROM borrow WHERE uid = ?"
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    var sql = "INSERT INTO borrow VALUES(null,?,?,?,null,null,?)";
    pool.query(sql,[bookname,borrowdate,Ereturndate,uid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
  })  
})

// 功能十五： 渲染借阅页面
app.get("/getBorrow",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  var uid = req.session.uid;
  var sql = " SELECT * FROM borrow WHERE uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 功能十六： 管理员 借阅记录列表
app.get("/allBorrow",(req,res)=>{
  // 3. 创建sql语句
  var sql = "SELECT * FROM borrow";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 借阅列表：根据关键字 搜索
app.get("/BorrowSearch",(req,res)=>{
  var key = req.query.key;
  var upno = req.query.upno;
  var upageSize = req.query.upageSize;
  if(!upno){
    upno = 1;
  }
  if(!upageSize){
    upageSize = 50;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM borrow WHERE uid LIKE ? LIMIT ?,?";
  var ps = parseInt(upageSize);
  var offset = (upno-1)*upageSize;
  pool.query(sql,["%"+key+"%",offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  });
  // 4. 返回
});

// 功能十七：读者意见表的插入
app.post("/reader",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  var uid = req.session.uid;
  var content = req.body.content;
  var time = req.body.time;
  var sql = "SELECT * FROM reader_advise WHERE uid = ?"
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    var sql = "INSERT INTO reader_advise VALUES(null,?,?,?)";
    pool.query(sql,[uid,content,time],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
  })  
})

// 功能十八：管理员 读者意见列表渲染
app.get("/Readerlist",(req,res)=>{
  // 3. 创建sql语句
  var sql = " SELECT * FROM reader_advise";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 读者列表：根据关键字 搜索
app.get("/ReaderSearch",(req,res)=>{
  var key = req.query.key;
  var upno = req.query.upno;
  var upageSize = req.query.upageSize;
  if(!upno){
    upno = 1;
  }
  if(!upageSize){
    upageSize = 50;
  }
  // 3. 创建sql语句
  var sql = " SELECT * FROM reader_advise WHERE uid LIKE ? LIMIT ?,?";
  var ps = parseInt(upageSize);
  var offset = (upno-1)*upageSize;
  pool.query(sql,["%"+key+"%",offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  });
  // 4. 返回
});

// 功能十九：管理员登录
app.get("/ManagerLogin",(req,res)=>{
  var workid = req.query.workid;
  var pswd = req.query.pswd
  var sql = "SELECT * FROM managerinfo WHERE workid = ? AND pswd = ?";
  pool.query(sql,[workid,pswd],(err,result)=>{
    if(err) throw err;
    if(result.length == 0){
      res.send({code:-1,msg:"学号或密码有误"})
      console.log({code:-1,msg:"学号或密码有误"});
    }else{
      res.send({code:1,msg:"登录成功"})
       console.log({code:1,msg:"登录成功"});
    }
  })
})

// 功能二十： 新书页面 按月份查找书籍
app.get("/month",(req,res)=>{
  var key = req.query.key;
  // 3. 创建sql语句
  var sql = " SELECT * FROM book WHERE entry_time LIKE ?";
  pool.query(sql,["%"+key+"%"],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  });
});
// 功能二十一： 新书页面 按图书分类查询书籍
app.post("/classifykey",(req,res)=>{
  var key = req.body.key;
  var sql = "SELECT * FROM book WHERE classify LIKE ?";
  pool.query(sql,["%"+key+"%"],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})