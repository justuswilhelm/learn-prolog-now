:- module(grammar, [s/3]).

s(s(NP, VP)) -->
  np(NP, _),
  vp(VP, _).

% Noun phrase
% np(Number, Case, Person)
np(np(DET, N), np(Number, _, _)) -->
  det(DET, det(Number, _)),
  n(N, Number).
np(np(DET, N, POSTMOD), np(Number, _, _)) -->
  det(DET, det(Number, _)),
  n(N, Number),
  post_mod(POSTMOD, _).
np(np(DET, MOD, N), np(Number, _, _)) -->
  det(DET, det(Number, _)),
  mod(MOD, _),
  n(N, Number).

np(np(Pronoun), np(Number, Case, Person)) -->
  [Pronoun],
  {lex(Pronoun, pro, Case, Number, Person)}.

post_mod(post_mod(Preposition, DET, N), _) -->
  [Preposition],
  {lex(Preposition, pre, _, _, _)},
  det(DET, det(Number, _)),
  n(N, Number).

mod(mod(Modifier), _) -->
  [Modifier],
  {lex(Modifier, adj, _, _, _)}.
mod(mod(Modifier1, Modifier2), _) -->
  [Modifier1],
  {lex(Modifier1, adj, _, _, _)},
  [Modifier2],
  {lex(Modifier2, adj, _, _, _)}.

% Verb phrase
% vp(Number, Person).
vp(vp(V, NP), vp(Number, Person)) -->
  v(V, v(Number, Person)),
  np(NP, np(_, object, _)).
vp(vp(V), vp(Number, Person)) -->
  v(V, v(Number, Person)).

det(det(Word), det(Number, Person)) -->
  [Word],
  {lex(Word, det, _, Number, Person)}.

n(n(Word), Number) -->
  [Word],
  {lex(Word, n, _, Number, _)}.

v(v(Word), v(Number, Person)) -->
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
lex(cow, n, _, plural, _).
lex(table, n, _, plural, _).

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
lex(like, v, _, Number, Person) :-
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
lex(dead, adj, _, _, _).

% Prepositions
lex(under, pre, _, _, _).
lex(over, pre, _, _, _).
