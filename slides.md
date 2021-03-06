
# Erlang Tutorial

Welcome!

* Omar Kjartan Yasin (@omarkj)
* Tilman Holschuh (@ypaqt2vte6jo8)

---

# Meet and Greet

Quick introduction of everybody

---

# Getting Started

0. Have Erlang installed.

1. Solutions are available, but don't peek!

   github.com/eflvan/tutorial_1_solutions

---


# Introduction to Erlang

## History of Erlang

* Built at Ericsson by Joe Armstrong, Mike Williams, Robert Virding, Bjarne Dacker
* Built for telecom systems such as switches and base stations - things with long
  uptime requirements

---

# Use the Erlang Shell

```shell
$ erl
```

```erlang
1> helloworld.
2> 1+1.
3> A = 3, B = 0, C = 7, D = 7, E = 10.
4> A = B.
5> Z = [B, C, D, E],
6> F = [A | Z].
7> [X + 69 || X <- F].
8> {i_am_a_tuple, 3.14159, "snap", [1, two, "three"]}.
```


# Modules and Functions

* Create a file called `hello.erl`
* Declare the module `hello`
```erlang
-module(hello).
```

---

# Modules and Functions

* Export the function `hello/1`
```erlang
-export([hello/1]).
```

* Implement the function `hello/1`
```erlang
hello(Name) -> io:format("hello ~p~n", [Name]).
```

# Modules and Functions

* Open the shell compile & load your module
```erlang
1> c(hello), l(hello).
```
* Call call your function in the shell
```erlang
3> hello:hello(world).
```

---

# The Task

build a music player simulator

---

# Version 1

* spawn a music player
* add a song to the song list

---

# `spawn/3`, `spawn/1`

```erlang
spawn(Module, Function, ArgumentList) -> pid()
```

```erlang
spawn(fun() -> ok end) -> pid()
```

---

# `receive`

```erlang
receive
    Term -> Body
end.
```

---

# Send a message `!`

```erlang
Pid ! hello.
```

---

# The Loop

```erlang
loop() ->
  receive
    Term -> loop()
  end.
```

---

# Version 2

* return the list of songs
* preload the player with songs
* add an API in the module

---

# Extend the loop

* pattern match the commands
* reply with message to the caller in the `receive` clause

---

# Pattern Matching

```erlang
receive
    {"hello joe", From} ->
          From ! "hello robert"
end
```


---

# Pattern Matching

```erlang
receive
    {"hello joe", From} ->
          From ! "hello robert"
end
```
Question: What happens when you do this?

```erlang
Pid ! {"hello mike", self()}.
```

---

# API

* extend start function for preloading of songs
* create convenience functions for `add`, `list`

---

# `add` and `list` API

* send message to the player from the caller
* hint: use `self()` and `!`
* REMEMBER: use `flush()` to show message sent to the shell !!!

---

# Version 3

* delete a song from the list
* return the reply from the player to the caller and handle replies from the player in the API
* for each API function pretty print an appropriate message

---

# API Changes

* `receive` correct response from player in the API functions
* match on the relevant information
* print an appropriate message
* return the whole response

---

# `lists` module

```erlang
1> lists:member(1, [1,2,3]).
true
2> lists:delete(1, [1,2,3]).
[2,3]
```

---

# `case` statement

```erlang
case Greeting of
  {hello, joe} -> {hello, robert};
  {hello, mike} -> {hello, joe};
  {hello, Name} -> {whois_is, Name};
  _ -> pardon_me
end.
```

---

# `case` statement

```erlang
case Greeting of
  {hello, joe} -> {hello, robert};
  {hello, mike} -> {hello, joe};
  {hello, Name} -> {whois_is, Name};
  _ -> pardon_me
end.
```

Question: What happens when you leave out the `_` clause?

---

# Delete functionality

* reply with a song deleted message when the song is in the playlist
* reply with no such song when the song is not in the playlist
* hint: use `case`, `lists:member`, and, `lists:delete`

---

# Version 4

* make sure the API doesn't hang if the player isn't running
* introduce common command structure to the loop and handle commands in separate function

---

# `receive ... after`

```erlang
receive
    _ -> got_message
after
    500 -> timed_out
end
```

---

# Command Structure

* allows easier refactoring into pure functions
* enforces common pattern

---

# Common Structure

```erlang
{add_song, From, Song}
```
vs.
```erlang
{koolplayer, From, Command = {add, Song}}
```

---

# Function Heads

* aka: pattern matching in function heads
```erlang
receive
  {koolplayer, From, Command = {add, Song}} ->
    case handle_message(Command, Songs) of
      {reply, Reply, NewSongs} -> ...
```

```erlang
handle_message({add, Song}, Songs) ->
  {reply, {song_added, Song}, [Song | Songs]};
...
```

---

# Version 5

* introduce continuous play back functionality using sub-processes
* extend state to keep track of sub-process using monitor

---

# Monitors

* one process can monitor another process
* monitoring process receives a message when the monitored process goes away

---

# Monitors

```erlang
Pid = spawn(Module, Function, Arguments),
Ref = monitor(process, Pid).
```
when `Pid` goes away the monitoring process gets the message:

```erlang
{'DOWN', Ref, process, Pid, Reason}
```

---

# Play a song

* spawn off a process the pretty prints the playing song
* hint: use `spawn/3` and `receive ... after`


# Extend the state

* the player state needs to keep track of the monitor reference
* hint: use tuple `{Songs, {SongPid, SongMonitorRef}}`

