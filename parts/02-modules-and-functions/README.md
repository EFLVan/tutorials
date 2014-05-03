# Modules and Functions

* Create a file called `kool_player.erl`
* Declare the module `kool_player`
```erlang
-module(kool_player).
```
* Export the function `player1/0`
```erlang
-export([player1/0]).
```
* Open the shell compile & load your module
```erlang
1> c(kool_player).
2> l(kool_player).
```
* Call `kool_player:player1()` in the shell

