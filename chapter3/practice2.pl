travel(A, B) :-
  directConnection(A, B).
travel(A, B) :-
  directConnection(A, C),
  travel(C, B).

:- include('chapter3/travelroutes.pl').
