-module(pe012).
-import(primes, [primes/0]).
-export([main/0]).
-compile(export_all).

prime_factors(N) -> prime_factors(N, primes()).

prime_factors(1, _) -> [];
prime_factors(N, [PH|PT]) ->
  Cashed = get(N),
  case Cashed of
    undefined -> case N rem PH of
        0 -> Calculated = [PH|prime_factors(N div PH, [PH|PT])],
             put(N, Calculated),
             Calculated;
        _ -> prime_factors(N, PT())
      end;
    _         -> 
      Cashed
  end.

count([FH|FT]) -> count([FH|FT], undefined, 1, 1). 
count([], _, Cnt, Prod) -> Cnt * Prod;
count([Cur|T], Cur, Cnt, Prod) -> count(T, Cur, Cnt + 1, Prod);
count([Cur|T], _,   Cnt, Prod) -> count(T, Cur, 2, Cnt * Prod).

solve(Nth, Tri) ->
  PF = prime_factors(Tri),
  case count(PF) > 500 of
    true -> Tri;
    _    -> Next = Nth + 1, solve(Next, Tri + Next)
  end.

main() -> erase(), solve(2, 3).

% 13> c("012/pe012.erl").
% 15> timer:tc(pe012, main, []).
% {75553462,76576500}

