s(A, B) :-
  foo(A, C),
  bar(C, D),
  wiggle(D, B).

foo([choo|B], B).
foo(A, B) :-
  foo(A, C),
  foo(C, B),
  !.

bar(A, B) :-
  mar(A, C),
  zar(C, B).

mar(A, B) :-
  me(A, C),
  my(C, B).

me([i|B], B).

my([am|B], B).

zar(A, B) :-
  blar(A, C),
  car(C, B).

blar([a|B], B).

car([train|B], B).

wiggle([toot|B], B).

wiggle(A, B) :-
  wiggle(A, C),
  wiggle(C, B),
  !.
