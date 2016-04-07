s --> np, vp.
np --> det,n.
vp --> v,np.
vp --> v.
det --> [the].
det --> [a].
n --> [woman].
n --> [man].
v --> [shoots].

s(A, B) :-
  np(A, C),
  vp(C, B).

np(A, B) :-
  det(A, C),
  n(C, B).

vp(A, B) :-
  v(A, C),
  np(C, B).
vp(A, B) :-
  v(A, B).

det([the|A], A).
det([a|A], A).

n([woman|A], A).
n([man|A], A).

v([shoots|A], A).
