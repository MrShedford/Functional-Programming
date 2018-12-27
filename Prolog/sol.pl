/* Exercise 1 */

xCount([H1 | T], C) :- =(H1, x), !, NewC is C + 1, xCount(T, NewC); xCount(T, C).
xCount([], A) :- A is 1.

countOfCounts([], S) :- S is 1.
countOfCounts([H | T], S) :- xCount(H, 0), !, X is S + 1, countOfCounts(T, X); countOfCounts(T, S).
solved(A) :- countOfCounts(A, 0).

/*Exercise 2 */
%% horizontal
checkHorizontalJump([H1 | T1], [H2 | T2], DifferenceCount) :- \+ =(H1, H2), !, NewCount is DifferenceCount + 1, checkHorizontalJump(T1, T2, NewCount); checkHorizontalJump(T2, T2, DifferenceCount).
checkHorizontalJump([], [], DifferenceCount) :- DifferenceCount is 3; DifferenceCount is 0.

isCorrectHorizontalJump([H1 | T1], [H2 | T2]) :- checkHorizontalJump(H1, H2, 0), !, isCorrectHorizontalJump(T1, T2).
isCorrectHorizontalJump([], []).
                           
containsHorizontalJump([], _, OCount, FoundConsecutiveX) :- OCount > 0, FoundConsecutiveX is 1.
containsHorizontalJump([H | T], IsLastX, OCount, FoundConsecutiveX) :- =(H, x), !, (=(IsLastX, 1), !, containsHorizontalJump(T, 1, OCount, 1); containsHorizontalJump(T, 1, OCount, FoundConsecutiveX)); NewOCount is OCount + 1, containsHorizontalJump(T, 0, NewOCount, FoundConsecutiveX). 

isHorizontalJump([], XCount) :- XCount is 1. % must have one instance of two x's
isHorizontalJump([H | T], XCount) :- containsHorizontalJump(H, 0, 0, 0), !, NewXCount is XCount + 1, isHorizontalJump(T, NewXCount); isHorizontalJump(T, XCount).


%% vertical
checkVerticalJump([H1 | T1], [H2 | T2], DifferenceCount) :- \+ =(H1, H2), !, NewCount is DifferenceCount + 1, checkVerticalJump(T1, T2, NewCount); checkVerticalJump(T1, T2, DifferenceCount).
checkVerticalJump([], [], DifferenceCount) :- DifferenceCount is 1.

isCorrectVerticalJump([H1 | T1], [H2 | T2]) :- checkVerticalJump(H1, H2, 0), !, isCorrectVerticalJump(T1, T2).
isCorrectVerticalJump([], []).

containsVerticalJump([], XCount) :- XCount is 1.
containsVerticalJump([H | T], XCount) :- =(H, x), !, NewCount is XCount + 1, containsVerticalJump(T, NewCount); containsVerticalJump(T, XCount).

isVerticalJump([], XCount) :- XCount is 2. % must have one instance of two x's
isVerticalJump([H | T], XCount) :- containsVerticalJump(H, 0), !, NewXCount is XCount + 1, isVerticalJump(T, NewXCount); isVerticalJump(T, XCount).


jump(BoardOne, BoardTwo) :- isHorizontalJump(BoardOne, 0), !, isCorrectHorizontalJump(BoardOne, BoardTwo); isVerticalJump(BoardOne, 0), !, isCorrectVerticalJump(BoardOne, BoardTwo).