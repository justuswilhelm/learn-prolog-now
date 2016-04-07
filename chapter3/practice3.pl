travel(A, B, go(A, B)) :-
  directConnection(A, B).
travel(A, B, go(A, C, Route)) :-
  directConnection(A, C),
  travel(C, B, Route).
:- include('chapter3/travelroutes.pl').
