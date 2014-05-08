# Introduction

* introduce yourselves
* introduce helpers
* don't be afraid if you have questions
* team up in pairs if you feel like it

# History of Erlang

* first experiments started in the early '80 by Ericsson
* name 'Erlang' as reference to the Danish mathematician Agner Erlang, not so
  much 'Ericsson Language'
* designed for long running systems with high uptime requirements, like
  telefone switches
* mention 'Erlang the movie'
* functional programming language inspired among others by Prolog
* Erlang implements actor model with distribution support built in
* actors are implemented with lightweight processes, easily spawn hundred
  thousands of processes
* Erlang VM acts like an operating system and it actually can (Erlang on Xen)

# Erlang Shell

* explain atoms, like constants in C/C++/Java or symbols in Ruby
* atoms with spaces have to be enclosed with single quotes
* statements are finalized with period

* simple arithmetic, integers and floats, type system is smart enough to mix

* variables are capitalized, statements can be sequenced with comma
* variables are single assignment

* lists are constructed with angle brackets
* elements can be added to the front of an existing list which may be the empty
  list

* support for list comprehensions which iterates over the entire list and
  runs an expression to each element, like map and fold

* strings are represented as list of numbers
* and the Erlang shell is always eager to interprete them as such

* tuples are represented with curly brackets
* tuples are used to represent complex data structures

# Modules and Functions

* module names have to match the file name
* when exporting functions the arity has to be given, functions with arity have 
  to be put in a list
* function arguments can be variables or any of the type we have seen so far
* functions are finalized with period
* writing an output to the shell is done with io:format("~p~n", [Name]), ~p
  formatter, ~n to force newline
* every function must return something in Erlang
* compile and load your module, do NOT forget the load
* call your function

# The Task

* introduce a lot of Erlang primitive
* show Erlang strong points, e.g., processes, messaging

# Version 1

* Spawning
    * mention arity
    * Creating a new process
    * Processes are identified by pids (process identifiers)
    * Process has its own heap
    * Each process is GCd individually (yay!)
    * Cheap!
* Receive
    * Receives are how Erlang processes consume messages
    * Process handles one message at time
* `!` or `erlang:send/2`
    * How messages get sent from one process to another
    * Processes are identified with the Pid returned from spawn
    * Async, always returns the sent message, never blocks
* Looping
    * Recursive functions / calling oneself
    * Ask for feedback!
    * Maintain state with tail-recursion
    * How state is maintained in Erlang
* `io:format`
    * A way to print out things in Erlang
    * Why does it return `ok` because everything has to have a return value
    * Mind the "~p~n" (show on the screen)


# Version 2

### Task

There is a gap in the product as there is no way to get back a list of songs from
the player.

We need to implement a way to add songs and get back the list of songs from the
player.

### Objective

Introduce two-way communication, API code for usability, pattern matching on tuples
and mention selective receive.

Introduce flush() and how calls are implemented in Erlang

### Talk about

*
* Pattern matching
    * is awesome
    * selective receive
    * you can match on a shape of a term -> EXAMPLE in shell?
        * {A,_} = {a,b}.
        * {A,_,_} = {a,b}.
    * Show a case example (in editor or a slide or the shell)
        * case {a,b} of {A,B} -> B end. (lolsample)
    * More examples
* `!` and `erlang:send/2` and `receive` continue
    * Draw process diagram
    * Messages are Erlang terms
    * Messages go to the receiving processes mailbox and remain there until received
    * Mailboxes are ordered as messages are received, maybe not by how they are sent (hehe)
* Two-way communication
    * Communication in Erlang is async
        * Allows for the construction of lose coupling which is vital for fault tolerance and
        distribution, location transparency and all that sweet turf
    * We need the pid of the process expecting a reply so the receiving process can
    reply to it
    * You need the pid to send a message to the process so keep the pid in a variable
    * flush() prints out messages the shell has received
    * self() ! hehe. flush() show on screen but with more than more
* start function with song preloading
    * add parameter to start function and pass it as argument in spawn


# Version 3

### Task

There is a gap in the product as there is no way to delete songs from the player,
and the user needs to understand flush to use it.

We need to implement a way to delete and simplify the API

### Objective

Continue to talk about two-way communication and handle messages sent from the
player.

Talk about the `case` statement and call to external functions, in this case the
lists module. We will also talk about matching on `_`.

We introduce a function call to `lists`, which happen in the player process.

Refactoring into pure functions that allow for better testability.

### Talk about

* API changes
    * make communication synchronous
    * pattern match appropriate information for pretty print
* Two-way communication
    * Send a message and go into receive to handle the response
    * Again, because message sending is async
    * Mention that Erlang has well defined patterns for this
* The `case` statement and pattern matching
    * point out punctuation, i.e., `;` between clauses, no `;` after last clause
    * Erlang has a If statement, but people use case
    * Similar to a switch statement in Java, except you can match on
    the shape of the term - Haskell/Scala peeps are familiar
    * Looks like receive on a term you already hold
* Anonymous match
    * A catchall clause
    * Can be a part of a structure to ignore parts
* `delete` functionality
    * handle new message in receive loop
    * handle different replies in API
    * bonus: put delete functionality into its own function
* Refactoring
    * Makes code easier to read, easier to test

# Version 4

### Task

As KoolTek grows there is an apparent need to make the codebase easier to extend,
and test. We therefore need to introuce the koolpayer protocol* and this will
requre a refactoring.

There is also a risk that by sending the wrong message to the player no reply will
be sent to the sender, meaning the receive clause will block. We need to add a
timeout.

### Objective

Introduce the `after` clause which is important since nothing lasts forever
(mention Pet Hallend stance on timeouts (why not 30 years?)).

Introduce handling messages in function heads, getting more pure code which
is easier to test and closer to real world erlang code.

### Talk about

* Refactoring into matching on messages in function heads
   * More "erlangy"
   * Makes code easier to test
   * Pure functions
* `after`
   * Is used to implement timeouts
   * Timeouts are important in systems because parts fail, processes can and will
   crash
   * If the player process crashes while we're waiting for a reply, we will
   wait forever. Nothing should ever wait forever - why not 30 years?
   * Stress that it's very important for fault tolerance

# Version 5

This is optional depending on how it goes.

### Task

Market analysts have discovered a big gap in the product; koolplayer is not able to play
any music. It's all-hands on deck, gotta get it done.

We'll use Erlang's amazing processes and process monitoring to implement continous playback.

### Objective

We introduce a complex state since we believe other feature
requests are coming from our marketing team.

Introduce sub-processes and monitors.

### Talk about

* Monitors
    * Erlang allows one process to monitor another process.
    * The monitoring process will receive a message when the monitored process
    goes away
    * Similar mechanism is links, they create a suicide pact between the procsses, if
    one process goes down the other one will as well. (trap exits)
    * Super important in fault tolerant systems
    * Allow procsses to restarted if they go down
    * Allows for monitoring
* Process started by another process that was started by another process (...)
    * Turtles all the way down
    * This important in Erlang, and is how fault tolerant systems are strucuted
    * Allow for partial failure, supervision and recovery
    * ^^ this actually happens
    * OTP is a battle tested framework designed around fault tolerance
        * But I'm not gonna tell you about it

### Bonus

* What song is currently playing
* Next song
* Prev song
* Which song?
* Different song lengths
* Pause/Resume
* Different duration
* Sharing! is caring
