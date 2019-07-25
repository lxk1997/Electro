- 下载并安装mysql数据库
```
mkdir mysql
cd mysql
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.17-linux-glibc2.12-x86_64.tar.xz
tar xvf mysql-8.0.17-linux-glibc2.12-x86_64.tar.xz
export MySQL_HOME= /home/demo/mysql
export PATH = \$MySQL_HOME/bin:$PATH
mysqld --defaults-file=/home/hadoop/MySQL/my.cnf --initialize --user=demo
mysqld_safe --defaults-file=/home/demo/mysql/my.cnf --user=demo &
```
- 创建用户及数据库实例，导入SQL
```
CREATE USER 'uname'@'host' IDENTIFIED BY 'pwd';
create database db_name;
GRANT privileges ON db_name.tb_name TO 'uname'@'host'
source scheme.sql
```
- 下载并编译redis数据库
```
mkdir redis
cd redis
wget http://download.redis.io/releases/redis-4.0.10.tar.gz
tar xzf redis-4.0.10.tar.gz
cd redis-4.0.10
make
cd ..
```
- 后台启动redis数据库, 使用demo提供的参数. 建议后台运行, 例如tmux
```
./redis/src/redis-server demo/redis.conf
```
- 创建并进入python2的虚拟环境
```
virtualenv -p /usr/bin/python2.7 ./venv
source ./venv/bin/activate
```
- 安装所需项目并加入环境变量
```
 http://gitlab.hobot.cc/auto/perception/ad/horizonadas_evalkit
```
- 安装Python所需模块
```
pip install -r requirement.txt
```
- 配置config.py
```
SECRET_KEY = <加密字符串>
MYSQL = {
        'user'   : <用户名>，
        'passwd' :  <密码>，
        'database'  :<数据库>，
        'host' : <主机地址>，
        'port' :<端口> ,
    }
REDIS = {
        'host'      : <主机地址>,
        'port'      : <端口号>,
        'password'  : <密码>,
        'db': <数据库>
    }
FS = {
        'mode'      : 'local',
        'config'    : {
            'prefix'    : <存储目录>,
            },
    }
    TMP = {
        'prefix'    : <存储目录>,
   }
SESSION_TYPE = 'redis'
SESSION_PERMANENT = True
SESSION_USE_SIGNER = True
SESSION_KEY_PREFIX = 'session:'
PERMANENT_SESSION_LIFETIME = 86400
CELERY_BROKER_URL = 'redis://:123456@127.0.0.1:6379/1'
CELERY_RESULT_BACKEND = 'redis://:123456@127.0.0.1:6379/1'
CELERYD_CONCURRENCY = 16
```
- 设置PATH
```
export PATH=detection-evaluation-system/venv/bin:$PATH
```
- 设置PYTHONPATH
```
export PYTHONPATH=detection-evaluation-system/venv/lib/python2.7/site-packages:$PYTHONPATH
```
- 设置 APP路径
```
export FLASK_APP=eval_app
```
- 设置配置文件路径
```
export APP_CONFIG=config.py
```
- 如果你需要对APP进行开发, 则需要设置环境参数为development
```
export FLASK_ENV=development
```
- 设置服务器监听的host和port, 并启动APP. 建议后台运行, 例如tmux
```
host=0.0.0.0
port=5000
flask run --host \${host} --port ${port}
```
