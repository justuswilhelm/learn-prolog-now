:- use_module('chapter12/printer.pl').
:- use_module('chapter12/grammar.pl').

run :-
    run('chapter12/grammar.in', 'chapter12/grammar.out').
run(InPath, OutPath) :-
    open(InPath, read, In),
    open(OutPath, write, Out),
    read_sentences(In, Out),
    close(In),
    close(Out).


read_sentences(In, Out) :-
    at_end_of_stream.
read_sentences(In, Out) :-
    \+at_end_of_stream,
    read(In, Sentence),
    s(Result, Sentence, []),
    write(Out, Sentence),
    pptree(Result, Out),
    read_sentences(In, Out).

:- begin_tests(run).
test(run, [nondet]) :-
    run.

:- end_tests(run).
:- run_tests.
