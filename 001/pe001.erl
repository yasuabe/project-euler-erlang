-module(pe001).
-export([main/0]).

-define(Limit, 1000). 

f(N, A) when N == ?Limit -> A;
f(N, A) when (N rem 3 == 0) or (N rem 5 == 0) -> f(N + 1, A + N);
f(N, A) -> f(N + 1, A).
  
main() -> f(1, 0).

% 233168
