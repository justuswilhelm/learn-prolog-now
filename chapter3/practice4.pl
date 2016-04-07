:- include('chapter3/travelroutes.pl').

method(Depart, Arrive, 'by plane') :-
  byPlane(Depart, Arrive).
method(Depart, Arrive, 'by train') :-
  byTrain(Depart, Arrive).
method(Depart, Arrive, 'by car') :-
  byCar(Depart, Arrive).

travel(Depart, Arrive, go('from', Depart, Means, 'to', Arrive)) :-
  method(Depart, Arrive, Means),
  directConnection(Depart, Arrive).
travel(Depart, Arrive, go('from', Depart, Means, 'to', Hop, 'and then', Route)) :-
  directConnection(Depart, Hop),
  method(Depart, Hop, Means),
  travel(Hop, Arrive, Route).
