xCount([H1 | T], C) :- =(H1, x), !, NewC is C + 1, xCount(T, NewC); xCount(T, C).
xCount([], A) :- A is 1.

countOfCounts([], S) :- S is 1.
countOfCounts([H | T], S) :- xCount(H, 0), !, X is S + 1, countOfCounts(T, X); countOfCounts(T, S).
solved(A) :- countOfCounts(A, 0).
 /*
 Solved takes in a List of Lists (A) and passes them to count of counts, and passes in 0, being the starting number for the amount of times we've seen the x peg so far
countOfCounts takes the list of lists and splits it with H being the first thing in the list, T being everything that follows (similiar to Scheme with car and cdr) and S being the count
It runs xCount on the H (being one row of this board) 
If xCount returns true (ie there's an x on that row) then we run everything to the right of the exclamation point until the semi colon (we increase the overall count by one and pass the rest pf the list in recursively)
If it returns false then we pass the rest of the list in with our original value of S, since it didn't increase by one
Our basecase is if we have an empty list then S is 1

xCount takers in a list and checks each character for x and increases the counter each time it sees an x 
 */