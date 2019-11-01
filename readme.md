# Rack Demo

这是一个 Rack Demo, 来展示 Rack 最基本的用法, 实现一个图书查询接口.

## 初始化数据库

```bash
bundle install
./bin/init
```

## 启动服务

```bash
rackup
```

## 查询图书

```text
http://localhost:3000/books/{ISBN}
```