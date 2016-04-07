combine3([], [], []).
combine3([A|ARest], [B|BRest], [j(A, B)|CombinedRest]) :-
  combine3(ARest, BRest, CombinedRest).
