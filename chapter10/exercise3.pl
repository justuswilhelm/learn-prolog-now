split([], _, _).
split([H|T], Positive, Negative) :-
    number(H),
    split(T, [H|Positive], Negative),
    H >= 0,
    !.
split([H|T], Positive, Negative) :-
    number(H),
    split(T, Positive, [H|Negative]),
    H < 0,
    !.

:- begin_tests(exercise3).
test(split) :-
    split([], P, N),
    P = [],
    N = [].
test(split) :-
    split([-5, -1, -9], P, N),
    P = [],
    N = [-5, -1, -9].
test(split) :-
    split([3, 4, 0, 4], P, N),
    P = [3, 4, 0, 4],
    N = [].
test(split) :-
    split([3, 4, -5, -1, 0, 4, -9], P, N),
    P = [3, 4, 0, 4],
    N = [-5, -1, -9].
:- end_tests(exercise3).
:- run_tests.
