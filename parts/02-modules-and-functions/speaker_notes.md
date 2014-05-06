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
