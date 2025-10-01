% This is the family relations exercise at the end of Ch.4 [L].
child(alberto,guido). child(alberto,antonietta).
child(giulia,enrico). child(giulia,annamaria).
child(dante,marco).   child(clara,marco).
child(dante,laura).   child(clara,laura).
child(marco,alberto).   child(marco,giulia).
child(laura,lawrence).  child(laura,julie).
child(emily,lawrence).  child(emily, julie).
child(claire,lawrence). child(claire, julie).
child(sam,emily). child(ben,emily).
child(sam,dave). child(ben,dave).
child(eve,claire). child(annabelle,claire).
child(eve,ed). child(annabelle,ed).
child(giulio,guido). child(donata,giulio).
child(sara,donata). child(marco2,donata).
child(gioia,clara). % gioia and donata are first cousins once removed.
child(giulio,antonietta). % remove to test full_sibling/2 and half_sibling/2

male(guido). male(enrico).
male(marco). male(dante). male(alberto). male(lawrence).
male(sam). male(ben). male(dave). male(ed).
male(giulio). male(marco2).
female(antonietta). female(annamaria).
female(clara).  female(laura).  female(giulia). female(julie).
female(emily). female(claire). female(eve). female(annabelle).
female(donata). female(sara). female(gioia).

%Clauses from Figure 3.1, as required by Exercise of Ch.4[L]
parent(Y,X) :- child(X,Y).
father(Y,X) :- child(X,Y), male(Y).
opp_sex(X,Y) :- male(X), female(Y).
opp_sex(Y,X) :- male(X), female(Y).
grand_father(X,Z) :- father(X,Y), parent(Y,Z).

% New clauses for Exercise of Ch.4[L] follow for f25 HW4 solution.
%Q1:
mother(Y,X) :- child(X,Y), female(Y).
/*
?- mother(antonietta,alberto).
true.
*/
grand_parent(X,Z) :- parent(X,Y), parent(Y,Z).
/*
?- grand_parent(alberto,dante).
true ;
false.
*/
great_grand_mother(X,Z) :- mother(X,Y), parent(Y,W), parent(W,Z).
/*
?- great_grand_mother(giulia,X).
X = gioia.
*/

%Q2:
sibling(X,Y) :- parent(Z,Y), parent(Z,X), \+ X=Y.
/*
?- sibling(sara,X).
X = marco2 ;
false.
*/
brother(X,Y) :- sibling(X,Y), male(X).
/*
?- brother(marco2,X).
X = sara ;
false.
*/
sister(X,Y) :- sibling(X,Y), female(X).
/*
?- sister(sara,X).
X = marco2 ;
false.
*/

%Q3:
half_sibling(X,Y) :- parent(Z,X),parent(Z,Y), \+full_sibling(X,Y), \+ X=Y.
/*
?- half_sibling(X,Y).
X = sara,
Y = marco2 ;
X = marco2,
Y = sara ;
false.
*/
full_sibling(X,Y) :- parent(Z,X), parent(Z,Y),parent(W, X), parent(W,Y), \+ W=Z, \+ X=Y.
/*
?- full_sibling(giulio,X).
X = alberto ;
X = alberto ;
false.
*/

%Q4:
first_cousin(X,Y) :- parent(Z,W), parent(Z,V), parent(W,X), parent(V,Y), sibling(W,V), \+ X=Y. 
/*
?- first_cousin(X,Y).
X = marco,
Y = donata .
?- sibling(alberto, giulio).
true ;
true.
*/
second_cousin(X,Y) :- grand_parent(Z,W), grand_parent(Z,V), parent(W,X), parent(V,Y), first_cousin(W,V), \+ X=Y.

%Q5:
half_first_cousin(X,Y) :- parent(Z,X), parent(W,Y), half_sibling(Z,W), \+ X=Y.
double_first_cousin(X,Y) :- mother(Z,X), father(W,X), mother(V,Y), father(U,Y),
    ((sibling(Z,V), sibling(W,U)); (sibling(Z,U), sibling(W,V))), \+ X=Y.

%Q6:
first_cousin_twice_removed(X,Y) :- first_cousin(X,Z), grand_parent(Z,Y), \+ X=Y.

%Q7
descendant(X,Y) :- parent(Y,X); (parent(Y,Z), descendant(X,Z)).
ancestor(X,Y) :- descendant(Y,X).

%Q8
cousin(X,Y) :- \+ X=Y, parent(Z,X), parent(V,Y), (sibling(Z,V); cousin(Z,V)).

%Q9
closest_common_ancestor(X,Y,Z) :- ancestor(Z,X), ancestor(Z,Y), \+ (child(C,Z), ancestor(C,Y), ancestor(C,X)).

%Q10
write_child(X,Y) :- write(X), write(' is a child of '),write(Y),nl.

write_descendant_chain(X,Y) :- descend_from(X,Y).
descend_from(Descendant, Ancestor) :- child(Descendant, Ancestor), write_child(Descendant, Ancestor).
descend_from(Descendant, Ancestor) :- child(C, Ancestor), descend_from(Descendant, C), write_child(C,Ancestor).