killer(butch).

married(mia, marsellus).

dead(zed).

kills(marsellus, X) :-
  gives_footmassage(X, mia).
gives_footmassage(douchebro, mia).

eats(jules, X) :-
  is_food(X, nutritious);
  is_food(X, tasty).

is_food(kale, nutritious).
is_food(tofu, tasty).
