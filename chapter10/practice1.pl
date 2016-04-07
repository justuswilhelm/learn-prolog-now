neg(Goal) :-
    Goal,
    !,
    fail.
neg(_).

%% First version
%% nu(X, Y) :-
%%     \+(X=Y).
%%
%% Second Version
%%
%% nu(X, Y) :-
%%     neg(X=Y).
%% Third Version
nu(X, Y) :-
    neg(neg(X\=Y)).  % Am I doing the right thing?! :D

:- begin_tests(practice1).
test(nu, [fail]) :-
    nu(foo, foo).

test(nu) :-
    nu(foo, blob).

test(nu, [fail]) :-
    nu(foo, _).
:- end_tests(practice1).

:- run_tests.
