zebra(Nationality) :-
  Street = [_, _, _],
  member(house(_, red, _), Street),
  member(house(_, blue, _), Street),
  member(house(_, green, _), Street),
  member(house(english, red, _), Street),
  member(house(spanish, _, jaguar), Street),
  sublist([house(_, _, snail), house(japanese, _, _)], Street),
  sublist([house(_, _, snail), house(_, blue, _)], Street),
  member(house(Nationality, _, zebra), Street).
