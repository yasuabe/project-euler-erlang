-module(pe010).
-export([main/0]).
-import(primes, [primes/0]).

solve([Prime|_], Sum) when Prime > 2000000 -> Sum;
solve([Prime|PrimeLT], Sum) ->
  solve(PrimeLT(), Sum + Prime).
  
main() -> solve(primes(), 0).

% 6> c("010/pe010.erl").
% {ok,pe010}
% 7> pe010:main().      
% 142913828922
