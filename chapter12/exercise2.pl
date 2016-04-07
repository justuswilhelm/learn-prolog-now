:- dynamic(word/2).
read_words(Result) :-
    open('chapter12/text', read, Stream),
    read_words(Stream, Result),
    close(Stream).

read_words(Stream, []) :-
    at_end_of_stream(Stream), !.

read_words(Stream, [Head|Result]) :-
    readWord(Stream, Head),
    add_word(Head),
    read_words(Stream, Result).

add_word(Word) :-
    \+word(Word, _),
    assertz(word(Word, 1)), !.
add_word(Word) :-
    word(Word, Freq),
    NewFreq is Freq + 1,
    retract(word(Word, _)),
    assertz(word(Word, NewFreq)).

frequencies(Result) :-
    findall([Word, Frequency], word(Word, Frequency), Result).

% Taken from http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse54
readWord(InStream, Word):-
    get_code(InStream, Char),
    checkCharAndReadRest(Char, Chars, InStream),
    atom_codes(Word, Chars).

checkCharAndReadRest(10, [], _) :-
    !.

checkCharAndReadRest(32, [], _) :-
    !.

checkCharAndReadRest(-1, [], _) :-
    !.

checkCharAndReadRest(end_of_file, [], _) :-
    !.

checkCharAndReadRest(Char, [Char|Chars], InStream):-
    get_code(InStream, NextChar),
    checkCharAndReadRest(NextChar, Chars, InStream).
