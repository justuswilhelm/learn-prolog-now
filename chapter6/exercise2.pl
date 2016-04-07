palindrome([]).
palindrome(List) :-
  reverse(List, Reverse),
  List=Reverse.
