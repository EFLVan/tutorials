# Modules and Functions

* Change to the `parts/02-modules-and-functions` directory
* Run the test:
```erlang
1> c(geom_test).
2> eunit:test(geom_test).
```
* Look at the test file `geom_test.erl` ;)

---

# Make the test pass

* Create a new file named `geom.erl`

* Declare the module `geom`
```erlang
-module(geom).
```

* Export the area function with arity 2
```erlang
-export([area/2]).
```

* Implement the area function
```erlang
area(L, W) ->
  %% your code goes here
  ...
```

* Compile and load your module and rerun the test
```erlang
3> c(geom).
4> l(geom).
5> eunit:test(geom_test).
```

---

# Document your code

* Add a function type a doc tag
```erlang
%% @doc Calculate the area of a rectangle.
-spec area(number(), number()) -> number().
area(L, W) -> L * W.
```

