-module(pe014).
-compile(export_all).

collatz_len(1) -> 1;
collatz_len(N) ->
  Cache = get(N),
  case Cache of
    undefined ->
      Next = case N rem 2 == 0 of true -> N div 2; false -> 3 * N + 1 end,
      1 + collatz_len(Next);
    _         -> Cache
  end.

solve(1000000, Max, _) -> Max;
solve(N, Max, MaxLen) ->
  Len = collatz_len(N),
  case Len > MaxLen of
    true  -> solve(N + 1, N, Len);
    false -> solve(N + 1, Max, MaxLen)
  end.

main() -> erase(), solve(1, 0, 0).

% 4> c("014/pe014.erl").       
% {ok,pe014}
% 5> timer:tc(pe014, main, []).
% {5954221,837799}
