:- module(subset, [subset/2]).

subset([], []).
subset(Subset, [_|Set]) :-
    var(Subset),
    subset(Subset, Set).

subset([H|Subset], [H|Set]) :-
    var(Subset),
    subset(Subset, Set).


subset(Subset, Set) :-
    nonvar(Subset),
    sort(Set, SortedSet),
    sort(Subset, SortedSubset),
    subset_sorted(SortedSet, SortedSubset).

subset_sorted([], _).
subset_sorted([_|SubsetTail], Set) :-
    subset_sorted(SubsetTail, Set).
subset_sorted([X|SubsetTail], [X|SetTail]) :-
    subset_sorted(SubsetTail, SetTail).

:- begin_tests(practice1).
test(subset) :-
    subset([], []).
test(subset) :-
    subset([a, b], [a, b, c]).
test(subset) :-
    subset([c, b], [a, b, c]).
test(subset) :-
    subset([], [a, b, c]).
test(subset) :-
    findall(X,  subset(X, [a,b,c]), Subsets),
    length(Subsets, 8).
:- end_tests(practice1).
