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

## Local Console

```bash
./bin/console
```

## 运行测试

```bash
bundle exec rspec
```

## Conference


[https://rack.github.io/](https://rack.github.io/)

[https://guides.rubyonrails.org/rails_on_rack.html](https://guides.rubyonrails.org/rails_on_rack.html)

[http://huiming.io/2016/11/10/ruby-rack.html](http://huiming.io/2016/11/10/ruby-rack.html)

[http://huiming.io/2017/04/30/ruby-rack-2.html](http://huiming.io/2017/04/30/ruby-rack-2.html)

[https://ruby-china.org/topics/21517](https://ruby-china.org/topics/21517)
