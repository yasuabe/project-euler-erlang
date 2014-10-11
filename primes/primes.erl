-module(primes).
-export([primes/0]).

wheel(Prev, [],    Wheel) -> wheel(Prev, Wheel, Wheel);
wheel(Prev, [H|T], Wheel) -> 
  Prime = Prev + H,
  [Prime| fun() -> wheel(Prime, T, Wheel) end].      

wheel([Last], Wheel)  -> [Last| fun() -> wheel(Last, Wheel, Wheel) end];
wheel([Ph|Pt], Wheel) -> [Ph|   fun() -> wheel(Pt,   Wheel) end].

filter(_, []) -> [];
filter(Pred,[H|Tl]) ->
  case Pred(H) of
    true  -> [H|fun() -> filter(Pred,Tl()) end];
    false -> filter(Pred,Tl())
  end.

sift(P, L) -> filter(fun(N) -> N rem P /= 0 end, L).

sieve([H|T1]) -> [H|fun() -> sieve(sift(H, T1())) end].

primes() -> sieve(wheel([2,3,5,7], [4,2,4,2,4,6,2,6])).
