-module(pe022).
-import(string, [strip/3]).
-import(lists, [map/2, sort/1, zipwith/3, seq/2, sum/1]).
-compile(export_all).

read_names(Filename) ->
  case file:read_file(Filename) of
    {error, Reason} -> exit(Reason);
    {ok,    Data}   -> Data
  end.

sum_characters([], Sum) -> Sum;
sum_characters([Ch|Rest], Sum) -> sum_characters(Rest, Sum + Ch - 64).

solve(Contents) -> 
  Strip = fun(Name) -> string:strip(binary_to_list(Name), both, $") end,
  CalcScore = fun(N, Word)->N * sum_characters(Word, 0) end,
  Words = sort(map(Strip, re:split(Contents, ","))),
  sum(zipwith(CalcScore, seq(1, length(Words)), Words)).

main() -> solve(read_names("022/p022_names.txt")).

%261> c("022/pe022.erl").       
%{ok,pe022}
%262> timer:tc(pe022, main, []).
%{11101,871198282}
