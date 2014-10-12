-module(pe009).
-export([main/0]).
-import(math, [sqrt/1]).

solve(A, B) -> 
  C = sqrt(A * A + B * B),
  L = A + B + C,
  if L == 1000 -> A * B * C;
     L <  1000 -> solve(A    , B + 1);
     L >  1000 -> solve(A - 1, B    )
  end.
 
main() -> 
  Start = trunc(1000 * (1 / (1 + 1 + sqrt(2)))),
  trunc(solve(Start, Start)).

% 77> c("009/pe009.erl").
% {ok,pe009}
% 78> pe009:main().      
% 31875000
