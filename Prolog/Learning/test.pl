%%Checks if lists of A and B are of equal length
a2b([],[]).
a2b([a|Ta],[b|Tb]) :- a2b(Ta,Tb).

%%Checks to see if lists of anything are the same length
sameLength([],[]).
sameLength([X | XT], [Y | YT]) :- sameLength(XT, YT).

twice([], []).
twice([Ha | Ta], [Ha, Ha | Tb]) :- twice(Ta, Tb).

%%This will combine two lists together in a third list
 
%% ?- combine2([foo,bar,yip,yup],[glub,glab,glib,glob],Result).
%% Result = [[foo,glub],[bar,glab],[yip,glib],[yup,glob]]
combine2([],[],[]).
combine2([H1 | T1], [H2 | T2], [[H1, H2] | T3]) :- combine2(T1, T2, T3).


%% ?- combine3([foo,bar,yip,yup],[glub,glab,glib,glob],R).
%% R = [join(foo,glub),join(bar,glab),join(yip,glib),join(yup,glob)]
combine3([],[],[]).
combine3([H1 | T1], [H2 | T2], [join(H1, H2) | T3]) :- combine3(T1, T2, T3).

add_3_and_double(X,Y) :- Y is (X+3)*2.

%%Length of a list (not nested)
len([],0).
len([_|T],N) :- len(T,X), N is X+1.

accLen([_|T],A,L) :-  Anew is A+1, accLen(T,Anew,L).
accLen([],A,A).

leng(List,Length) :- accLen(List,0,Length).

%%This will return the largest value in a list
accMax([H|T],A,Max) :-
    H > A,
    accMax(T,H,Max).
 
 accMax([H|T],A,Max) :-
    H =< A,
    accMax(T,A,Max).
 
 accMax([],A,A).

max(List,Max) :-
    List = [H|_],
    accMax(List,H,Max).

%%This will return the smallest value in a list
accMin([H|T],A,Min) :-
    H < A,
    accMin(T,H,Min).
 
accMin([H|T],A,Min) :-
    H >= A,
    accMin(T,A,Min).
 
accMin([],A,A).

min(List, Min) :-
    List = [H|_],
    accMin(List, H, Min).

%% Scalar Multiplication
%%scalarMult(3,[2,7,4],Result).

%% base case
scalarmult(Mult, [], []).
%% inductive case
scalarmult(Mult, [H1|T1], [H2|T2]) :-
  is(H2,*(H1,Mult)),
  scalarmult(Mult, T1, T2).

%% base case
accDot([],[],A,A).

%% inductive case
accDot([H1|T1], [H2|T2], A, Result) :-
  is(Anew,+(A,*(H1,H2))),
  accDot(T1, T2, Anew, Result).

dot(Vector1, Vector2, Result) :-
  accDot(Vector1, Vector2, 0, Result).

%% Messing around 
testingThis(List, Result) :- length(List, Result).