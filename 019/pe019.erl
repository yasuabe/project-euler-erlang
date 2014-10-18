-module(pe019).
-compile(export_all).
-import(lists, [member/2]).

next_month(Y, 12) -> {Y + 1, 1};
next_month(Y, M)  -> {Y,     M+1}.

next_DoW(Y, 2, W) when (Y rem 4 == 0) and (Y rem 100 /= 0) -> (W + 1) rem 7;
next_DoW(_, 2, W) -> W;
next_DoW(_, M, W) ->
  Mod = case member(M, [4, 6, 9, 11]) of true -> 2; _ -> 3 end,
  (W + Mod) rem 7.

solve({2001, _}, _, C) -> C;
solve({Y,    M}, W, C1) ->
  C2 = case (Y /= 1900) and (W == 0) of true -> 1; _ -> 0 end,
  solve(next_month(Y, M), next_DoW(Y, M, W), C1 + C2). 

main() -> solve({1900, 1}, 1, 0).

% 59> c("019/pe019.erl").
% {ok,pe019}
% 60> pe019:main().      
% 171
