accMin(List, Result) :-
  List = [H|_],
  accMin(List, H, Result).

accMin([], Acc, Acc).
accMin([Head|Tail], Acc, Result) :-
  Head < Acc,
  accMin(Tail, Head, Result).
accMin([Head|Tail], Acc, Result) :-
  Head >= Acc,
  accMin(Tail, Acc, Result).
