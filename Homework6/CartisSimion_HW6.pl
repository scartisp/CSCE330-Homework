%Simion Cartis
%Q1: list of exactly length 3
exactly_3([_|[_,_]]).
/*
?- exactly_3([1,2,3]).
true.

?- exactly_3([1,2,3,4]).
false.

?- exactly_3([1,2]).
false.

?- 
*/

%Q2: list of at least 3
at_least_3([_,_,_|_]).
/*
?- at_least_3([1,2]).
false.

?- at_least_3([1,2,3]).
true.

?- at_least_3([1,2,3,4]).
true.

?- 
*/

%Q3: list of at most 3
at_most_3([]).
at_most_3([_|[]]).
at_most_3([_|[_]]).
at_most_3([_|[_,_]]).
/*
?- at_most_3([]).
true.

?- at_most_3([1]).
true .

?- at_most_3([1,2]).
true .

?- at_most_3([1,2,3]).
true.

?- at_most_3([1,2,3,4]).
false.
*/

%Q4: true if list X has an element in common with list Y 
interesect(X,Y):- member(Z,X), member(Z,Y).
/*
?- interesect([1,2,3], [3,4,5]).
true ;
false.

?- interesect([1,2,3], [6,4,5]).
false.
*/

%Q5: true if every list in list 1 has an element that is also in list Y 
all_interesect([X|L],Y):- interesect(X,Y), all_interesect(L,Y).
all_interesect([],_). 
/*
?- all_interesect([[1,2,3],[5,4,6]],[3,4]).
true .

?- all_interesect([],[3,4]).
true.

?- all_interesect([[1,2,3],[1,2,5],[5,4,6]],[3,4]).
false.
*/