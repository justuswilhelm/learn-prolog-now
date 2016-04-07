s --> np(plural), vp(plural).
s --> np(singular), vp(singular).

np(Case) --> det(Case), n(Case).

vp(Case) --> v(Case), np(_).
vp(Case) --> v(Case).

det(_) --> [the].
det(singular) --> [a].

n(singular) --> [woman].
n(singular) --> [man].
n(singular) --> [apple].
n(singular) --> [pear].
n(plural) --> [men].

v(singular) --> [eats].
v(plural) --> [know].
