# Exercises
## 2
```
kanga(V, R, Q) -->
  roo(V, R),
  jumps(Q, Q),
  {marsupial(V, R, Q)}.
```
translates to
```
kanga(A, B, C, D, E) :-
  roo(A, B, D, F),
  jumps(C, C, F, G),
  marsupial(A, B, C),
  G = E.
```
