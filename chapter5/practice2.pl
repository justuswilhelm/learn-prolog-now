scalarMult(_, [], []).
scalarMult(X, [Head|Tail], [ResultHead|ResultTail]) :-
  ResultHead is Head * X,
  scalarMult(X, Tail, ResultTail).
