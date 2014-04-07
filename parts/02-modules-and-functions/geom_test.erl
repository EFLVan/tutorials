-module(geom_test).

-include_lib("eunit/include/eunit.hrl").

area_test() ->
  ?assert(12 =:= geom:area(3,4)),
  ?assert(84 =:= geom:area(12,7)),
  ok.

