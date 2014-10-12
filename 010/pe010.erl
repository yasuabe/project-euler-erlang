-module(pe010).
-export([main/0]).
-import(primes, [primes/0]).
-import(lists, [any/2]).

divisable_by_any(M, Primes) ->
  any(fun(Prime)-> M rem Prime == 0 end, Primes).

diminish(_, _, 1, S) -> S;
diminish(Primes, Prime, M, S) ->
  Diminished = case not divisable_by_any(M, Primes) of
    true  -> S - Prime * M;
    false -> S
  end,
  diminish(Primes, Prime, M - 1, Diminished).

solve(_, [Prime|_], S) when Prime * Prime > 2000000 -> S;
solve(LesserPrimes, [Prime|PrimeLT], S) ->
  S1 = diminish(LesserPrimes, Prime, 2000000 div Prime, S),
  solve([Prime|LesserPrimes], PrimeLT(), S1).
 
main() -> 
  StartSum = 2 + 999999 * (3 + 1999999) div 2,
  [P1|PT] = primes(),
  solve([P1], PT(), 2 + StartSum).

% 41> c("010/pe010.erl").
% {ok,pe010}
% 42> pe010:main().      
% 142913828924
