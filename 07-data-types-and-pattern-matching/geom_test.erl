-module(geom_test).

-include_lib("eunit/include/eunit.hrl").

area_pattern_matching_test() ->
  ?assert(0 =:= geom:area(rectangle, 0, 1)),
  ?assert(12 =:= geom:area(rectangle, 3, 4)),
  ?assert(7.5 =:= geom:area(triangle, 3, 5)),
  ?assert(25.132741228718345 =:= geom:area(ellipse, 2, 4)).

area_guards_test() ->
  ?assert(12 =:= geom:area(rectangle, 3, 4)),
  ?assert(18.84955592153876 =:= geom:area(ellipse, 2, 3)),
  ?assert(10.0 =:= geom:area(triangle, 4, 5)),

  ?assertMatch({error, invalid_dimensions},
               geom:area(rectangle, -1, 3)).

area_underscores_test() ->
  ?assertMatch({error, unknown_shape},
               geom:area(pentagon, 3, 4)),
  ?assertMatch({error, unknown_shape},
               geom:area(hexagon, -1, 5)),
  ?assertMatch({error, unknown_shape},
               geom:area(octagon, 0, 5)).

area_with_tuples_test() ->
  ?assert(0 =:= geom:area({rectangle, 0, 1})),
  ?assert(12 =:= geom:area({rectangle, 3, 4})),
  ?assert(7.5 =:= geom:area({triangle, 3, 5})),
  ?assert(25.132741228718345 =:= geom:area({ellipse, 2, 4})),
  ?assertMatch({error, unknown_shape},
               geom:area({pentagon, 3, 4})).

