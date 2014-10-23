-module(pe023).
-compile(export_all).
-include("macro/cond.hrl").
-define(Lim, 28123).

get_or_zero(I) -> case get(I) of undefined -> 0; V -> V end.

add_divisors(_, J) when ?Lim < J -> ok;
add_divisors(D, J) -> put(J, get_or_zero(J) + D), add_divisors(D, J + D).

process_abundant(I, {Abundants, Total}) ->
  process_abundant(I, Abundants, {Abundants, Total}).

process_abundant(_, [],     State)                   -> State;
process_abundant(I, [A|_],  State) when I + A > ?Lim -> State; 
process_abundant(I, [A|As], {Abs, Total}) ->
  process_abundant(I, As, {Abs, process_soa(I + A, Total)}).

negate_soa(Total, SoA) ->
  put(-SoA, exists),
  Total - SoA.

process_soa(SoA, Total) ->
  case get(-SoA) of
    undefined -> negate_soa(Total, SoA);
    exists    -> Total
  end.

next_state(I, {A, T}) ->
  case get_or_zero(I) > I of
    true  -> process_abundant(I, { A ++ [I], T });
    false -> {A, T}
  end.

solve(I, {_, Total}) when I > ?Lim -> Total;
solve(I, State) ->
  add_divisors(I, I * 2),
  solve(I + 1, next_state(I, State)).
  
main() -> erase(), solve(1, {[], ?Lim * (?Lim + 1) div 2}).

%374> pe023:main().      
%4179871
%375> timer:tc(pe023, main, []).  
%{1107292,4179871}
