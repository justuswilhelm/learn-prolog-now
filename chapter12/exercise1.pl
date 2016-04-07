write_hp :-
    open('chapter12/hogwarts.txt', write, Stream),
    tab(Stream, 8),
    write(Stream, "gryffindor"),
    nl(Stream),
    write(Stream, "hufflepuff"),
    tab(Stream, 8),
    write(Stream, "ravenclaw"),
    nl(Stream),
    tab(Stream, 8),
    write(Stream, "slytherin"),
    close(Stream).
