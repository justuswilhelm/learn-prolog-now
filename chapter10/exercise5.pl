loves(vincent, mia).
loves(marsellus, mia).
loves(pumpkin, honey_bunny).
loves(honey_bunny, pumpkin).

jealous(X, Y) :-
    loves(X, Z),
    loves(Y, Z),
    X\=Y.

:- begin_tests(exercise5).
test(jealous, [fail]) :-
    jealous(marsellus, marsellus).
:- end_tests(exercise5).
:- run_tests.
