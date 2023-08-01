// 引入操作数据库的模块
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

module.exports = pool

var test = function () {
  // 要执行的sql命令
  var sql = 'SELECT * FROM zd_carousel order by c_order'
  // 通过数据库链接对象执行sql命令
  pool.query(sql, (err, result) => {
    // err 是报错
    console.log(err)
    // result 是执行sql命令的结果
    console.log(result)
  })
}

test()
