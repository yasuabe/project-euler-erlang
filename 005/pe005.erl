-module(pe005).
-import(primes, [primes/0]).
-import(lists, [foldl/3]).
-export([main/0]).

-define(Limit, 20).

calc_pow(Prime, Res) ->
  case Prime * Res > ?Limit of
    true  -> Res;
    false -> calc_pow(Prime, Res * Prime)
  end.

solve([Prime|_]) when Prime > ?Limit -> [];
solve([Prime|Primes]) -> [calc_pow(Prime, Prime)| solve(Primes())].

main() -> 
  Product = fun(P, AccIn) -> P * AccIn end,
  foldl(Product, 1, solve(primes())).

% 102> c("005/pe005.erl").
% {ok,pe005}
% 103> pe005:main().      
% 232792560

