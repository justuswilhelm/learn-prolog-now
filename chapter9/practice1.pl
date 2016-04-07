% pptree(   s(np(det(a),n(man)),vp(v(shoots),np(det(a),n(woman,bla))))).
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

pptree(Term) :-
    pptree(Term, 0).
pptree([], _).
pptree(SimpleTerm, Level) :-
    termtype(SimpleTerm, simple_term),
    tab(Level),
    write(SimpleTerm),!.

pptree(ComplexTerm, Level) :-
    termtype(ComplexTerm, complex_term),
    ComplexTerm =.. [Functor|[SingleArgument]],
    tab(Level),
    write(Functor),
    write('('),
    termtype(SingleArgument, simple_term),
    write(SingleArgument),
    write(')'),
    !.

pptree(ComplexTerm, Level) :-
    termtype(ComplexTerm, complex_term),
    ComplexTerm =.. [Functor|Arguments],
    tab(Level),
    write(Functor),
    write('('),
    wrarg(Arguments, Level + 2),
    write(')'),!.

wrarg([], _).
wrarg([H], Level) :-
    nl,
    pptree(H, Level).
wrarg([H|T], Level) :-
    nl,
    pptree(H, Level),
    wrarg(T, Level).
