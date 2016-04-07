combine1([], [], []).
combine1([A|ARest], [B|BRest], [A, B|CombinedRest]) :-
  combine1(ARest, BRest, CombinedRest).
