flatten_(InList, OutList) :-
  flatten_(InList, [], OutList), !.

flatten_([], Tail, Tail).
flatten_([H|T], Tail, List) :-
  flatten_(H, FlatHeadTail, List),
  flatten_(T, Tail, FlatHeadTail).
flatten_(H, Tail, [H|Tail]).
