-module(ranges).
-export([main/1]).

overlaps(L1, R1, L2, R2) ->
    L1 =< R2 andalso L2 =< R1.

contains(L1, R1, L2, R2) ->
    L1 =< L2 andalso R1 >= R2.

solve1([], Res) -> Res;
solve1([{L1, R1, L2, R2}|T], Res) ->
    case contains(L1, R1, L2, R2) or contains(L2, R2, L1, R1) of
        true -> solve1(T, Res + 1);
        false -> solve1(T, Res)
    end.

solve2([], Res) -> Res;
solve2([{L1, R1, L2, R2}|T], Res) ->
    case overlaps(L2, R2, L1, R1) of
        true -> solve2(T, Res + 1);
        false -> solve2(T, Res)
    end.

process_input([], Acc) -> Acc;
process_input([H|T], Acc) ->
    [P1, P2] = string:tokens(H, ","),
    [L1_, R1_] = string:tokens(P1, "-"),
    [L2_, R2_] = string:tokens(P2, "-"),
    L1 = list_to_integer(L1_),
    R1 = list_to_integer(R1_),
    L2 = list_to_integer(L2_),
    R2 = list_to_integer(R2_),
    process_input(T, [{L1, R1, L2, R2}|Acc]).
    
readfile(FileName) ->
    {ok, Binary} = file:read_file(FileName),
    Lines = string:tokens(erlang:binary_to_list(Binary), "\n"),
    Lines.

main(FileName) ->
    Lines = readfile(FileName),
    Pairs = process_input(Lines, []),
    Res1 = solve1(Pairs, 0),
    io:format("~p~n", [Res1]),
    Res2 = solve2(Pairs, 0),
    io:format("~p~n", [Res2]).