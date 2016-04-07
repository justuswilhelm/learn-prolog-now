# Exercises
## 1
The second rule would never be evaluated, as both calls to descend(X,Z) and
descend(Z, Y) will be resovled to child(X,Z) and child(Z, Y) respectively.
Therefore only grandparent and parent relationships can be tested.
