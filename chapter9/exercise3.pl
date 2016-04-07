termtype(Variable, variable) :-
    var(Variable).

termtype(Atom, atom) :-
    atom(Atom).

termtype(Integer, integer) :-
    integer(Integer).

termtype(Float, float) :-
    integer(Float).

termtype(Constant, constant) :-
    termtype(Constant, atom).
termtype(Constant, constant) :-
    termtype(Constant, integer).
termtype(Constant, constant) :-
    termtype(Constant, float).

termtype(SimpleTerm, simple_term) :-
    termtype(SimpleTerm, variable).
termtype(SimpleTerm, simple_term) :-
    termtype(SimpleTerm, constant).

termtype(Term, term) :-
    termtype(Term, simple_term);
    termtype(Term, complex_term).

termtype(ComplexTerm, complex_term) :-
    functor(ComplexTerm, _, Arity),
    Arity > 0.

:- begin_tests(exercise3).

test(termtype) :-
    termtype(_,variable).
test(termtype, [nondet]) :-
    termtype(_, simple_term).

test(termtype) :-
    termtype(mia, atom).
test(termtype, [nondet]) :-
    termtype(mia, constant).
test(termtype, [nondet]) :-
    termtype(mia, simple_term).
test(termtype, [nondet]) :-
    termtype(mia, term).
test(termtype, [fail]) :-
    termtype(mia, complex_term).

test(termtype) :-
    termtype(dead(zed), complex_term).
test(termtype, [fail]) :-
    termtype(dead(zed), simple_term).

:- end_tests(exercise3).

:- run_tests.
