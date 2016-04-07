set(InList, OutList) :-
  setAcc(InList, [], OutList).
setAcc([], Acc, Acc).
setAcc([H|T], Acc, OutList) :-
  member(H, Acc),
  setAcc(T, Acc, OutList).
setAcc([H|T], Acc, OutList) :-
  \+member(H, Acc),
  append(Acc, [H], NewAcc),
  setAcc(T, NewAcc, OutList).
