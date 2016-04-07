addone([], []).
addone([Head|Tail], [AddHead|AddTail]) :-
  AddHead is Head + 1,
  addone(Tail, AddTail).
