twice([], []).
twice([Head|Rest], [Head,Head|TwiceRest]) :-
  twice(Rest, TwiceRest).
