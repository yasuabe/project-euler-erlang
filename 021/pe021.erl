-module(pe021).
-import(lists, [keysort/2, takewhile/2, foreach/2]).
-import(primes, [primes/0]).
-include("macro/cond.hrl").
-compile(export_all).
-define(Limit, 10000).

get_list()-> keysort(1, get()).

put_sums(_, Pow, _, _) when Pow > ?Limit -> ok;
put_sums(Prime, Pow, Aug, List) ->
  foreach(fun({N, D}) -> put(N * Pow, D * Aug) end,
      takewhile(fun({N, _})-> N * Pow =< ?Limit end, List)),
  NextPow = Pow * Prime,
  put_sums(Prime, NextPow, Aug + NextPow, List).

prepare_Ds([P|_]) when P * 2 > ?Limit ->
  foreach(fun({N, Sum}) -> put(N, Sum - N) end, get());
prepare_Ds([P|Ps]) ->
  put_sums(P, P, 1 + P, get_list()),
  prepare_Ds(Ps()).

accumulate([],         Result) -> Result;
accumulate([{N, D}|T], Result) when D  == N -> accumulate(T, Result);
accumulate([{N, D}|T], Result) -> 
  accumulate(T, Result + case get(D) of N -> N; _-> 0 end).

main() ->
  erase(),
  put(1, 1),
  prepare_Ds(primes:primes()),
  accumulate(get_list(), 0).

% 198> c("021/pe021.erl").
% {ok,pe021}
% 199> timer:tc(pe021, main, []).  
% {877816,31626}
