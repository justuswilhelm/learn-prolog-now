toptail(InList, OutList) :-
  [_, B|Rest] = InList,
  append(OutList, [_], [B|Rest]).
