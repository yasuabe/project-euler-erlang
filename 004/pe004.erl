-module(pe004).
-export([main/0]).
-import(lists, [seq/2, filter/2, reverse/1]).

-define(Max, 999).

revert(0, Res)   -> Res;
revert(Num, Res) -> revert(Num div 10, Res * 10 + Num rem 10).

is_palin(A) -> revert(A, 0) == A.

candidates() -> reverse(filter(fun(N)->N rem 10 /= 0 end, seq(101, ?Max))).

solve([],      _,        Res) -> Res;
solve([_|TX],  [],       Res) -> solve(TX, candidates(), Res);
solve([HX|_],  [?Max|_], Res) when HX * ?Max < Res -> Res; 
solve([HX|TX], [HY|TY],  Res) ->
  Mul = HX * HY,
  case Mul =< Res of
    true -> solve(TX, candidates(), Res);
    false -> case is_palin(Mul) of 
      true  -> solve(TX, candidates(), Mul);
      false -> solve([HX|TX], TY, Res)
    end
  end.

main() -> solve(candidates(), candidates(), 0).

% 85> c("004/pe004.erl").
% 86> pe004:main().      
% 906609

