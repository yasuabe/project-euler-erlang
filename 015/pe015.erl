-module(pe015).
-export([main/0]).
-import(lists, [seq/2]).

product(Numbers) -> product(Numbers, 1).

product([],    Product) -> Product;
product([H|T], Product) -> product(T, H * Product).

solve(Size) ->
  product(seq(Size + 1, Size * 2)) div product(seq(1, Size)).

main() -> solve(20).

% 16> c("015/pe015.erl").
% {ok,pe015}
% 17> pe015:main().      
% 137846528820

