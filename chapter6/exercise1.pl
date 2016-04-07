doubled([]).
doubled(List) :-
  append(First, Second, List),
  First = Second.
