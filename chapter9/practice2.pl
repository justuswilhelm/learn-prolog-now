not(X) :-
    \+ X.
and(X, Y) :-
    X,
    Y.
or(X, _) :-
    X.
or(_, Y) :-
    Y.
implies(_, Y) :-
    Y.
implies(X, _) :-
    \+ X.
:- op(300, fx, not).
:- op(400, xfy, and).
:- op(500, xfy, or).
:- op(600, xfy, implies).
