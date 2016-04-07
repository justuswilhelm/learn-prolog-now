:- use_module('chapter11/practice1.pl').
:- use_module('chapter11/practice1.pl').
powerset(Set, Powerset) :-
    findall(X, subset(X, Set), Powerset).

:- begin_tests(practice2).
test(practice2) :-
    powerset([a,b,c], Powerset),
    length(Powerset, 8).
:- end_tests(practice2).

:- run_tests(practice2).
