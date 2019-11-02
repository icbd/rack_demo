## 展示 Rack 中间件调用顺序的 DEMO :

> config.ru

```ruby
class FirstMiddleWare
  def initialize(app)
    puts 'FirstMiddleWare.new'
    @app = app
  end

  def call(env)
    puts 'FirstMiddleWare#call <<<'
    status, head, body = @app.call(env)
    puts 'FirstMiddleWare#call >>>'

    [status, head, body]
  end
end

class SecondMiddleWare
  def initialize(app)
    puts 'SecondMiddleWare.new'
    @app = app
  end

  def call(env)
    puts 'SecondMiddleWare#call <<<'
    status, head, body = @app.call(env)
    puts 'SecondMiddleWare#call >>>'

    [status, head, body]
  end
end

class App
  def initialize
    puts 'App.new'
  end

  def call(env)
    puts 'App#call'

    [200, { 'Content-Type' => 'text/plain' }, ['Hello World!']]
  end
end

use FirstMiddleWare
use SecondMiddleWare
run App.new

```

服务启动时:

```text
App.new
SecondMiddleWare.new
FirstMiddleWare.new
```

响应请求时:

```text
FirstMiddleWare#call <<<
SecondMiddleWare#call <<<
App#call
SecondMiddleWare#call >>>
FirstMiddleWare#call >>>
::1 - - [02/Nov/2019:11:45:33 +0800] "GET / HTTP/1.1" 200 - 0.0007
```