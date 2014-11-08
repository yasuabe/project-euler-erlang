-module(pe025).
-compile(export_all).

fib(A, B) -> [B| fun() -> fib(B, A+B) end].

solve(N, [Fib|Fun]) ->
  case length(integer_to_list(Fib)) of
    1000 -> N;
    _    -> solve(N+1, Fun())
  end.

main() -> solve(1, fib(0, 1)).

%14> c("025/pe025.erl").
%{ok,pe025}
%15> timer:tc(pe025, main, []).
%{161495,4782}
