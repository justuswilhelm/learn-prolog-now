unifiable([], _, []).
 % X and Y cannot be unified
unifiable([X|Tail], Y, Result) :-
    \+(X=Y),
    unifiable(Tail, Y, Result), !.
% X and Y can be unified
unifiable([X|Tail], Y, [X|Result]) :-
    \+(X\=Y),
    unifiable(Tail, Y, Result).

:- begin_tests(practice2).
test(unifiable) :-
    unifiable([b], t(a), []).
test(unifiable) :-
    unifiable([X], t(a), [X]).
test(unifiable) :-
    unifiable([t(X)], t(a), [t(X)]).
test(unifiable) :-
    unifiable([t(a)], t(a), [t(a)]).
test(unifiable) :-
    unifiable([t(b)], t(a), []).
test(unifiable) :-
    unifiable([b], t(a), []).
test(unifiable) :-
    unifiable([b, X], t(a), [X]).
test(unifiable) :-
    unifiable([t(b), b], t(a), []).

test(unifiable) :-
    unifiable([t(a), t(a)], t(a), [t(a), t(a)]).
test(unifiable) :-
    unifiable([t(b), t(a)], t(a), [t(a)]).

test(unifiable) :-
    unifiable([X, Y], t(a), [X, Y]).

test(unifiable) :-
    unifiable([X, b, t(Y)], t(a), [X, t(Y)]).
:- end_tests(practice2).
:- run_tests.
