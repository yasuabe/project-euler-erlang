-module(prime_cache).
-import(primes, [primes/0]).
-export([init_cache/0, next_prime/1]).

init_cache() -> [PH|PT] = primes(), put(-PH, PT).

next_prime(Prime) ->
  Cached = get(-Prime),
  case is_function(Cached) of
    true ->
      [Next|Primes] = Cached(),
      put(-Prime, Next),
      put(-Next,  Primes),
      Next;
    _ -> Cached
  end.

