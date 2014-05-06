# Modules and Functions

* Create a file called `hello.erl`
* Declare the module `hello`
```erlang
-module(hello).
```
* Export the function `hello/1`
```erlang
-export([hello/1]).
```
* Implement the function `hello/1`
```erlang
hello(Name) -> io:format("hello ~p~n", [Name]).
```
* Open the shell compile & load your module
```erlang
1> c(hello), l(hello).
```
* Call call your function in the shell
```erlang
3> hello:hello(world).
```

