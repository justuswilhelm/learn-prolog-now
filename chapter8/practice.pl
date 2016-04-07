s -->
  np(Number, subject, Person),
  vp(Number, Person).

% Noun phrase
% np(Number, Case, Person)
np(Number, _, _) -->
  det(Number, _),
  n(Number).
np(Number, _, _) -->
  det(Number, _),
  n(Number),
  post_mod(_).
np(Number, _, _) -->
  det(Number, _),
  mod(_),
  n(Number).
np(Number, Case, Person) -->
  [Pronoun],
  {lex(Pronoun, pro, Case, Number, Person)}.

post_mod(_) -->
  [Preposition],
  {lex(Preposition, pre, _, _, _)},
  det(Number, _),
  n(Number).

mod(_) -->
  [Modifier],
  {lex(Modifier, adj, _, _, _)}.
mod(_) -->
  [Modifier],
  {lex(Modifier, adj, _, _, _)},
  [Modifier],
  {lex(Modifier, adj, _, _, _)}.

% Verb phrase
% vp(Number, Person).
vp(Number, Person) -->
  v(Number, Person),
  np(_, object, _).
vp(Number, Person) -->
  v(Number, Person).

det(Number, Person) -->
  [Word],
  {lex(Word, det, _, Number, Person)}.

n(Number) -->
  [Word],
  {lex(Word, n, _, Number, _)}.

v(Number, Person) -->
  [Word],
  {lex(Word, v, _, Number, Person)}.

% Lexicon
% Determiners
lex(the, det, _, _, _).
lex(a, det, _, singular, _).

% Nouns
lex(woman, n, _, singular, _).
lex(man, n, _, singular, _).
lex(women, n, _, plural, _).
lex(men, n, _, plural, _).

% Verbs
lex(Verb, v, _, singular, third) :-
  lex(Stem, v, _, none, none),
  atom_concat(Stem, s, Verb).

lex(shoot, v, _, Number, Person) :-
  Number\==singular,
  Person\==third.
lex(see, v, _, Number, Person) :-
  Number\==singular,
  Person\==third.
lex(lift, v, _, Number, Person) :-
  Number\==singular,
  Person\==third.

% Personal Pronouns
lex(you, pro, subject, singular, first).
lex(you, pro, subject, singular, second).
lex(he, pro, subject, singular, third).
lex(she, pro, subject, singular, third).
lex(it, pro, subject, singular, third).
lex(we, pro, subject, plural, first).
lex(you, pro, subject, plural, second).
lex(they, pro, subject, plural, third).

lex(me, pro, object, singular, first).
lex(you, pro, object, singular, second).
lex(it, pro, object, singular, third).
lex(him, pro, object, singular, third).
lex(her, pro, object, singular, third).
lex(us, pro, object, plural, first).
lex(you, pro, object, plural, second).
lex(them, pro, object, plural, third).

% Adjectives
lex(blue, adj, _, _, _).
lex(heavy, adj, _, _, _).
lex(red, adj, _, _, _).
lex(light, adj, _, _, _).

% Prepositions
lex(under, pre, _, _, _).
lex(over, pre, _, _, _).
