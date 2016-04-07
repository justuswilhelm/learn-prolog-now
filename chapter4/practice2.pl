combine2([], [], []).
combine2([A|ARest], [B|BRest], [[A, B]|CombinedRest]) :-
  combine2(ARest, BRest, CombinedRest).
