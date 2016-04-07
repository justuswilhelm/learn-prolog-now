:- dynamic sum/2.
sum(1, 1).
sum(N, X) :-
    PreviousN is N - 1,
    sum(PreviousN, PreviousX),
    X is N + PreviousX,
    asserta((sum(N, X) :- !)),!.

:- begin_tests(exercise3).
test(sum) :-
    sum(3, 6).
test(sum) :-
    sum(5, X),
    X = 15.
:- end_tests(exercise3).

:- run_tests.
