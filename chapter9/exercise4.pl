groundterm(ComplexTerm) :- % sometimes there are easy solutions...
    numbervars(ComplexTerm, 0, End),
    End is 0.

:- begin_tests(exercise4).
test(groundterm, [fail]) :-
    groundterm(_).

% Test complex terms
test(groundterm) :-
    groundterm(french(bic_mac, le_bic_mac)).

test(groundterm, [fail]) :-
    groundterm(french(whopper, _)).

% Test lists
test(groundterm, [nondet]) :-
    groundterm([a, b, c]).

test(groundterm, [fail]) :-
    groundterm([_, b, c]).

test(groundterm, [nondet]) :-
    groundterm([single_elt]).

test(groundterm, [fail]) :-
    groundterm([_]).
:- end_tests(exercise4).
:- run_tests.
