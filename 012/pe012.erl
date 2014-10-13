-module(pe012).
-import(prime_cache, [init_cache/0, next_prime/1]).
-export([main/0]).
-compile(export_all).

prime_factors(N) -> prime_factors(N, 2).

prime_factors(1, _) -> [];
prime_factors(N, Prime) ->
  Cashed = get(N),
  case Cashed of
    undefined ->
      case N rem Prime of
        0 -> Calculated = [Prime|prime_factors(N div Prime, Prime)],
             put(N, Calculated),
             Calculated;
        _ -> prime_factors(N, next_prime(Prime))
      end;
    _         -> Cashed
  end.

divisors([FH|FT]) -> divisors([FH|FT], undefined, 1, 1). 

divisors([],      _,   Cnt, Prod) -> Cnt * Prod;
divisors([Cur|T], Cur, Cnt, Prod) -> divisors(T, Cur, Cnt + 1, Prod);
divisors([Cur|T], _,   Cnt, Prod) -> divisors(T, Cur, 2, Cnt * Prod).

solve(Nth, Tri) ->
  case divisors(prime_factors(Tri)) > 500 of
    true -> Tri;
    _    -> Next = Nth + 1, solve(Next, Tri + Next)
  end.

main() -> erase(), init_cache(), solve(2, 3).

% 69> timer:tc(pe012, main, []).  
% {295776,76576500}
