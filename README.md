
需要一些 `Elixir` 的基础. 

如果你想要构造一个真实的应用程序. 我们采用[Cowboy](https://github.com/ninenines/cowboy)作为Web服务器, 但Cowboy是用`Erlang`实现的, 对于没有`Erlang`背景知识的同学, 有比较陡峭的学习曲线. 幸运的是Elixir语言提供了一个库: [Plug](https://github.com/elixir-lang/plug), 用它我们能够构Web应用.

Plug 不是一个Web框架, 它不是用来替代 Phoenix 或 Sugar的, 相反,这两个框架都使用了Plug来与底层的HTTP服务器(Cowboy)交互. 

## 设置应用程序

通过命令`mix new --sup plug_sample` 创建一个项目.

在`mix.exs`文件中添加依赖

```elixir
defp deps do
  [{:cowboy, "~> 1.0.0"},
   {:plug, "~> 0.12"}]
end
```

安装依赖

```
mix deps.get
```

### 创建进程

在`PlugSample.Worker`启动`Plug`, `PlugSample.Worker`由`PlugSample.start/2`启动

```
defmodule PlugSample.Worker do
  def start_link do
    Plug.Adapters.Cowboy.http PlugSample.MyPlug, []
  end
end

```

## 路由 `Plug.Router`

创建路由模块 `lib/elixir_plug_examples/router.ex`

```elixir
defmodule ElixirPlugExamples.Router do
  use Plug.Router
  if Mix.env == :dev do
    use Plug.Debugger
  end
  plug :match
  plug :dispatch
  # Root path
  get "/" do
    send_resp(conn, 200, "This entire website runs on Elixir plugs!")
  end
end
```

路由模块创建完成后, 就可以通过`iex -S mix`来启动这个简单的Web应用程序了. 访问 [http://localhost:4000/](http://localhost:4000/).

使用 `curl -v http://localhost:4000` 连接到服务器, `-v` 选项让我们可以看到响应头信息.

响应头如下:

```
> GET / HTTP/1.1
> Host: localhost:4000
> User-Agent: curl/7.43.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< server: Cowboy
< date: Tue, 12 Apr 2016 08:25:38 GMT
< content-length: 11
< cache-control: max-age=0, private, must-revalidate
< content-type: text/plain; charset=utf-8
< 
Hello world
```

现在我们有了一个可以工作的Web应用程序, 但这只完成了一半, 另一半是理解它是如何工作的

### 一个简单的路由

第一个路由足够简单. 匹配路径 "/"(网站根路径), 并用函数`send_resp/3`构造一个响应.

## 完整的代码

本文网站的示例代码

https://github.com/developerworks/plug_sample
