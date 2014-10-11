-define(COND(Flag, TValue, FValue),
        case Flag of true -> TValue; false -> FValue end).

