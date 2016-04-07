is_a(_, _).
are(_, _).
likes(_).
and(_, _).
famous(_).
:- op(300, xfx, [are,  is_a]).
:- op(300, fx, likes).
:- op(200, xfy, and).
:- op(100, fy, famous).
