%%January 2018
mul(List1, List2, List3) :-
    length(List1, R1),
    length(List2, R2),
    length(List3, R3),
    R3 =:= (R1*R2).

%%January 2017

%%This will find them if they're in the same list/couple
path(X, Y, G) :-
    walk(X,Y, G, []).
    
    walk(X, Y, G, V) :-
    member([X, A], G),
    not(member(A, V)) , 
    (
    A = Y;
    walk(A, Y, G, [A|V])
    ).
% ?- path(b,Y,[[a,b],[b,c],[b,d],[d,e]]).
%  Y = c ;
%  Y = d ;
%  Y = e ;
%  no
%%January 2016
noah([],[],[]).
noah([H1|T1],[H2|T2],[H1,H2|T3]) :- noah(T1,T2,T3).