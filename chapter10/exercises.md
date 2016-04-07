# Exercises
## 1
1.
```
X = 1 .
```
2.
```
X = Y, Y = 1 ;
X = 1,
Y = 2 ;
X = 2,
Y = 1 ;
X = Y, Y = 2.
```
3.
```

X = Y, Y = 1 ;
X = 1,
Y = 2.
```

## 2
The `class` predicate returns whether a number is positive, zero, or negative.
The program can be enhanced by cutting after the positive and zero case. That
prevents a query for `class(0, X)` and `class(2, X)` ending up with more than
one choicepoint.
