word(astante, a, s, t, a, n, t, e).
word(astoria, a, s, t, o, r, i, a).
word(baratto, b, a, r, a, t, t, o).
word(cobalto, c, o, b, a, l, t, o).
word(pistola, p, i, s, t, o, l, a).
word(statale, s, t, a, t, a, l, e).

crossword(Word1, Word2, Word3, Word4, Word5, Word6) :-
  word(Word1, _, A, _, B, _, C, _),
  word(Word2, _, D, _, E, _, F, _),
  word(Word3, _, G, _, H, _, I, _),
  word(Word4, _, A, _, D, _, G, _),
  word(Word5, _, B, _, E, _, H, _),
  word(Word6, _, C, _, F, _, I, _).
