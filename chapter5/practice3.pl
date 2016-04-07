dot(X, Y, Result) :-
  dotAcc(X, Y, 0, Result).

dotAcc([], [], Acc, Acc).
dotAcc([XHead|XTail], [YHead|YTail], Acc, Result) :-
  NextAcc is Acc + XHead * YHead,
  dotAcc(XTail, YTail, NextAcc, Result).
