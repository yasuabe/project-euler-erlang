-module(pe007).
-export([main/0]).
-import(primes, [primes/0]).

nth(1, [Prime|_]) -> Prime;
nth(N, [_|Primes]) -> nth(N-1, Primes()).

main() -> nth(10001, primes()).

% 1> pwd().
% /home/xad/devel/workspace/erlang/project-euler
% ok
% 2> code:add_path("primes").
% true
% 3> c("007/pe007.erl").
% {ok,pe007}
% 4> pe007:main().
% 104743

