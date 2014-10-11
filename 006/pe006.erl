-module(pe006).
-export([main/0]).

-define(Max, 100).

solve(0, {N, N2}) -> {N, N2};
solve(K, {N, N2}) -> solve(K-1, {N+K, N2+K*K}).

main() -> {N, N2} = solve(?Max, {0, 0}), N*N-N2.

% 114> c("006/pe006.erl").
% {ok,pe006}
% 115> pe006:main().      
% 25164150

