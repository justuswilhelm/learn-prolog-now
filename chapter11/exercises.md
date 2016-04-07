# Exercises
## 1
```
?- assert(q(a,b)),  assertz(q(1,2)),  asserta(q(foo,blug)).
```
```
true.
```
```
?- listing.
```
```
:- dynamic q/2.

q(foo, blug).
q(a, b).
q(1, 2).

true.
```
```
?- retract(q(1,2)), assertz((p(X) :- h(X))).
```
```
true.
```
```
?- listing.
```
```
:- dynamic p/1.

p(A) :-
    h(A).
:- dynamic q/2.

q(foo, blug).
q(a, b).

true.
```
```
?- retractall(q(_, _)).
```
```
true.
```
```
?- listing.
```
```
:- dynamic p/1.

p(A) :-
        h(A).

:- dynamic q/2.

true.
```

## 2
1.
```
?- findall(X, q(blob, X), List).
```
```
List = [blug, blag, blig].
```
2.
```
?- findall(X, q(X, blug), List).
```
```
List = [blug, blag, blig].
```
3.
```
?- findall(X,q(X,Y),List).
```
```
List = [blob, blob, blob, blaf, dang, dang, flab].
```
4.
```
?- bagof(X, q(X, Y), List).
```
```
Y = blag,
List = [blob, blaf] ;
Y = blig,
List = [blob] ;
Y = blob,
List = [flab] ;
Y = blug,
List = [blob, dang] ;
Y = dong,
List = [dang].
```
5.
```
?- setof(X,Y^q(X,Y),List).
```
```
List = [blaf, blob, dang, flab].
```
