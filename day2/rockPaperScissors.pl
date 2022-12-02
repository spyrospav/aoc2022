main(Filename) :-
    open(Filename, read, Str),
    read_file(Str,Lines),
    close(Str),
    maplist(score, Lines, S),
    unzip(S1, S2, S),
    sum_list(S1, Score1),
    sum_list(S2, Score2),
    write(Score1), nl, write(Score2), nl.

read_file(Stream,[]) :-
    at_end_of_stream(Stream).
    
read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_codes(Stream,Codes),
    atom_chars(X, Codes),
    read_file(Stream,L), !.

sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.

unzip([],[],[]).
unzip([H1|T1],[H2|T2],[[HL,HR]|T]) :-
   H1 = HL,
   H2 = HR,
   unzip(T1,T2,T).

score('A X', [Score1, Score2]) :-
    Score1 is 3 + 1,
    Score2 is 0 + 3.
score('A Y', [Score1, Score2]) :-
    Score1 is 6 + 2,
    Score2 is 3 + 1.
score('A Z', [Score1, Score2]) :-
    Score1 is 0 + 3,
    Score2 is 6 + 2.
score('B X', [Score1, Score2]) :-
    Score1 is 0 + 1,
    Score2 is 0 + 1.
score('B Y', [Score1, Score2]) :-
    Score1 is 3 + 2,
    Score2 is 3 + 2.
score('B Z', [Score1, Score2]) :-
    Score1 is 6 + 3,
    Score2 is 6 + 3.
score('C X', [Score1, Score2]) :-
    Score1 is 6 + 1,
    Score2 is 0 + 2.
score('C Y', [Score1, Score2]) :-
    Score1 is 0 + 2,
    Score2 is 3 + 3.
score('C Z', [Score1, Score2]) :-
    Score1 is 3 + 3,
    Score2 is 6 + 1.