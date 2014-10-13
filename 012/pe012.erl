-module(pe012).
-import(primes, [primes/0]).
-export([main/0]).

count_divisors(N) -> count_divisors(N, primes(), 1, 1).

count_divisors(1, _, C, P) -> C*P;
count_divisors(N, [PH|PT], C, P) when N rem PH == 0 ->
  count_divisors(N div PH, [PH|PT], C + 1, P); 
count_divisors(N, [_|PT], C, P) ->
  count_divisors(N, PT(), 1, C*P). 

solve(Nth, Tri) ->
  case count_divisors(Tri) > 500 of
    true -> Tri;
    _    -> Next = Nth + 1, solve(Next, Tri + Next)
  end.

main() -> solve(1, 1).

% 13> c("012/pe012.erl").
% 15> timer:tc(pe012, main, []).
% {161857072,76576500}

