-module(pe003).
-import(primes, [primes/0]).
-export([main/0]).

solve(N, [Prime|_]) when Prime * Prime >= N -> N;
solve(N, [Prime|PrimeLT]) ->
  case N rem Prime of
    0 -> solve(N div Prime, [Prime|PrimeLT]);
    _ -> solve(N,           PrimeLT())
  end.

main() -> solve(600851475143, primes:primes()).

% 1> cd("003").
% 2> code:add_path("../primes").
% 3> c(pe003).
% 4> pe003:main().
% 6857

