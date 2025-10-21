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
at_most_3([_ | [_,_]]).
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