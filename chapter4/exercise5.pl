tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([Head|Rest], [TranHead|TranRest]) :-
  tran(Head, TranHead),
  listtran(Rest, TranRest).
