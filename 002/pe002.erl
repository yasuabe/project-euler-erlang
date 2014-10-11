-module(pe002).
-export([main/0]).
-include("../macro/cond.hrl").

f(_, Fib, Sum) when Fib > 4000000 -> Sum;
f(Prev, Fib, Sum) ->
  f(Fib, Prev + Fib, Sum + ?COND(Fib rem 2 == 0, Fib, 0)).

main() -> f(1, 1, 0).

% ans. 4613732
