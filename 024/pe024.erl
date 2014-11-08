-module(pe024).
-compile(export_all).
-import(lists, [seq/2, foldr/3, nthtail/2, reverse/1, split/2]).
-define(Lim, 1000000).
-define(Cols, 10).

prod(List) -> foldr(fun(A, Acc) -> A*Acc end, 1, List).

posrem(A, B) ->
    D = A div B,
    R = A rem B,
    case R of
        0 -> { D, B};
        _ -> { D + 1, R}
    end.

solve([],     _)     -> [1];
solve(Digits, Whole) ->
    {Pos, Rem} = posrem(Whole, prod(Digits)),
	[Pos| solve(nthtail(1, Digits), Rem)].

remove_nth(N, List) ->
    {L1, [H|L2]} = split(N-1, List),
    {H, L1++L2}.

to_number([],         _,    Cur) -> Cur;
to_number([Pos|Poss], Nums, Cur) ->
    {D, Next} = remove_nth(Pos, Nums),
    to_number(Poss, Next, Cur*10 + D).

main() -> 
    PosList = solve(reverse(seq(1, ?Cols-1)), ?Lim),
    to_number(PosList, seq(0, 9), 0).

% 61> c(pe024).    
% {ok,pe024}
% 62> timer:tc(pe024, main, []).
% {26,2783915460}
