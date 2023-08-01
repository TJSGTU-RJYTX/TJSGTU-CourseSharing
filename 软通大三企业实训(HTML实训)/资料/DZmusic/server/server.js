// 导入express模块
var express = require('express')
// 导入cors模块
var cors = require('cors')
var mysql = require('mysql')
// 获取数据库连接对象
var pool = mysql.createPool({
  connectionLimit: 15, //连接池大小，可省略
  host: '180.76.143.181', //数据库服务器的主机地址，可省略
  port: 3306, //数据库服务器的端口号，可省略
  user: 'root', //登录数据库的用户名，不能省略！！
  password: 'root', //登录数据库的用户密码，默认值是''
  database: 'zd' //要打开哪个数据库，不能省略
})
// 创建服务
var app = express()
// 设置监听端口号
app.listen(3000)

// 解决跨域问题
app.use(cors())

// 解析post请求参数
app.use(express.json())

var users = require('./db/users.json')

app.post('/login', (req, res) => {
  // 获取请求参数,因为是post请求,所以用req.body
  var phone = req.body.phone
  var upwd = req.body.upwd
  // 连接数据库做查询操作
  // 要执行的sql命令,?是占位符,根据手机号和密码查询用户
  var sql = 'SELECT * FROM zd_user WHERE phone=? AND upwd=?'
  // 通过数据库链接对象执行sql命令
  pool.query(sql, [phone, upwd], (err, result) => {
    // err 是报错
    console.log(err)
    // result 是执行sql命令的结果
    console.log(result)
    if (result.length == 1) {
      res.send({ code: 200, msg: '登录成功', uid: result[0].uid })
    } else {
      res.send({ code: 201, msg: '账号或密码不正确' })
    }
  })
})

// 数据库:用来存储信息的仓库
// SQLserver  Oracle  MySQL
app.post('/register', (req, res) => {
  var phone = req.body.phone
  var upwd = req.body.upwd
  // 现根据手机查询用户,判断该手机号是否注册过
  var sql = 'SELECT * FROM zd_user WHERE phone=?'
  pool.query(sql, [phone], (err, result) => {
    if (result.length >= 1) {
      res.send({ code: 201, msg: '该手机号已经被注册' })
    } else {
      // 执行sql命令,把用户信息插入到数据库
      var sql =
        'INSERT INTO zd_user VALUES(NULL,?,NULL,?,"img/avatar/default.jpg",NULL)'
      pool.query(sql, [phone, upwd], (err, result) => {
        res.send({ code: 200, msg: '注册成功' })
      })
    }
  })
})

// 获取用户详情
app.get('/userInfo', (req, res) => {
  var uid = req.query.uid
  // 连接数据库做查询操作
  // 要执行的sql命令,?是占位符,根据uid查询用户
  var sql = 'SELECT * FROM zd_user WHERE uid=?'
  // 通过数据库链接对象执行sql命令
  pool.query(sql, [uid], (err, result) => {
    // err 是报错
    console.log(err)
    // result 是执行sql命令的结果
    console.log(result)
    res.send({ code: 200, msg: '获取用户详情成功', data: result[0] })
  })
})


app.get('/banner',(req,res)=>{
  var imgs = [
    './img/ad/811.jpg',
    './img/ad/853.jpg',
    './img/ad/902.jpg',
    './img/ad/918.jpg',
]
res.send({code:200,data:imgs})
})
var sheets = require('./db/sheets.json')
app.get('/sheets',(req,res)=>{
  res.send({code:200,data:sheets})
})

var songs = require('./db/songs.json')

app.get('/songs',(req,res)=>{
  res.send({code:200,data:songs})
})

app.get('/songInfo', (req, res) => {
  var sid = req.query.sid
  var song = songs.find(function (item) {
    return item.sid == sid
  })
  res.send({ code: 200, data: song })
})

app.get('/search', (req, res) => {
  var searchStr = req.query.searchStr
  var songList = songs.filter(function (item) {
    return item.title.includes(searchStr) || item.singer.includes(searchStr)
  })
  res.send({ code: 200, data: songList })
})