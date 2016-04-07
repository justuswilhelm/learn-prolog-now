last1(List, X) :-
  reverse(List, [X|_]).
last2([Head|Rest], X) :-
  last2(Rest, X).
last2([Rest], X).
