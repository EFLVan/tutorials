# Modules and Functions

* Create a file called `hello.erl`
* Declare the module `hello`
```erlang
-module(hello).
```
* Export the function `hello/0`
```erlang
-export([hello/0]).
```
* Implement the function `hello/0`
```erlang
hello() -> hello_world.
```
* Open the shell compile & load your module
```erlang
1> c(hello).
2> l(hello).
```
* Call `hello:hello()` in the shell
```erlang
3> hello:hello().
```

