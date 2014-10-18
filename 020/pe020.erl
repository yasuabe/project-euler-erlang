-module(pe020).
-import(lists, [sum/1, map/2, seq/2, foldl/3]).
-compile(export_all).

solve(Numbers) ->
  Product = foldl(fun(X, Prod) -> X * Prod end, 1, Numbers),
  sum(map(fun(D)->D - 48 end, integer_to_list(Product))).

main() -> solve(seq(1, 100)).

% 76> c("020/pe020.erl").
% {ok,pe020}
% 77> pe020:main().      
% 648

