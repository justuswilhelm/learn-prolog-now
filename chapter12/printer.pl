:- module(printer, [pptree/2]).
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
    nonvar(ComplexTerm),
    functor(ComplexTerm, _, Arity),
    Arity > 0.

pptree(Term, Stream) :-
    pptree(Term, 0, Stream).
pptree([], _, _).
pptree(SimpleTerm, Level, Stream) :-
    termtype(SimpleTerm, simple_term),
    tab(Stream, Level),
    write(Stream, SimpleTerm).

pptree(ComplexTerm, Level, Stream) :-
    termtype(ComplexTerm, complex_term),
    ComplexTerm =.. [Functor|Arguments],
    tab(Stream, Level),
    write(Stream, Functor),
    write(Stream, '('),
    wrarg(Arguments, Level + 2, Stream),
    write(Stream, ')').

wrarg([], _, _).
wrarg([H|T], Level, Stream) :-
    nl(Stream),
    pptree(H, Level, Stream),
    wrarg(T, Level, Stream).
