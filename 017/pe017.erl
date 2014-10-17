-module(pe017).
-import(lists, [sum/1, map/2, seq/2]).
-export([main/0]).

lettersOf(1) -> length("one");
lettersOf(2) -> length("two");
lettersOf(3) -> length("three");
lettersOf(4) -> length("four");
lettersOf(5) -> length("five");
lettersOf(6) -> length("six");
lettersOf(7) -> length("seven");
lettersOf(8) -> length("eight");
lettersOf(9) -> length("nine");
lettersOf(10) -> length("ten");
lettersOf(11) -> length("eleven");
lettersOf(12) -> length("twelve");
lettersOf(13) -> length("thirteen");
lettersOf(14) -> length("fourteen");
lettersOf(15) -> length("fifteen");
lettersOf(16) -> length("sixteen");
lettersOf(17) -> length("seventeen");
lettersOf(18) -> length("eighteen");
lettersOf(19) -> length("nineteen");
lettersOf(20) -> length("twenty");
lettersOf(30) -> length("thirty");
lettersOf(40) -> length("forty");
lettersOf(50) -> length("fifty");
lettersOf(60) -> length("sixty");
lettersOf(70) -> length("seventy");
lettersOf(80) -> length("eighty");
lettersOf(90) -> length("ninety");
lettersOf(1000) -> lettersOf(1) + length("thousand");
lettersOf(N) when (N > 20) and (N < 100) -> 
  R = N rem 10,
  lettersOf(N - R) + lettersOf(R);
lettersOf(N) when N rem 100 == 0 ->
  lettersOf(N div 100) + length("hundred");
lettersOf(N) ->
  lettersOf(N div 100 * 100) + length("and") + lettersOf(N rem 100).

solve(Numbers) -> sum(map(fun(N) -> lettersOf(N) end, Numbers)).

main() -> solve(seq(1, 1000)).

% 102> c("017/pe017.erl").
% {ok,pe017}
% 103> pe017:main().      
% 21124
