-module(pe016).
-export([main/0]).

main() ->
  CharToDigit = fun(Char)-> Char - 48 end,
  lists:sum(lists:map(CharToDigit, (integer_to_list(trunc(math:pow(2, 1000)))))).

% 50> pe016:main().
% 1366
% 51> timer:tc(pe016, main, []).
% {19,1366}
