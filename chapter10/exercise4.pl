directTrain(saarbruecken, dudweiler) :- !.
directTrain(forbach, saarbruecken) :- !.
directTrain(freyming, forbach) :- !.
directTrain(stAvold, freyming) :- !.
directTrain(fahlquemont, stAvold) :- !.
directTrain(metz, fahlquemont) :- !.
directTrain(nancy, metz) :- !.

path(Start, End) :-
    directTrain(Start, End).
path(Start, End) :-
    directTrain(End, Start).

route(Start, Mid, Route) :-
    path(Start, End), !.
route(Start, End, [Start|Route]) :-
    path(Start, Mid),
    not(member(Mid, Route)),
    route(Mid, End, Route), !.

:- begin_tests(exercise4).
test(route) :-
    route(forbach, freyming, Route),
    Route=[forbach, freyming].
test(route) :-
    route(forbach, stAvold, Route),
    Route=[forbach, freyming, stAvold].
test(route) :-
    route(forbach, metz, Route),
    Route=[forbach, freyming, stAvold, fahlquemont, metz].
:- end_tests(exercise4).
