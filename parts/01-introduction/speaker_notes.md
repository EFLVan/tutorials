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
