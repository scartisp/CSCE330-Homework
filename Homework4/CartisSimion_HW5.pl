%Simion Cartis

/*
Q2 color the map of central Europe such that no two countries that share a border
have the same color
*/
color(red).
color(yellow).
color(orange).

central_europe(France, Switzerland, Italy, Belgium, Holland, Germany, Austria):-
    color(France), color(Switzerland), color(Italy), color(Belgium), color(Holland),
    color(Germany), color(Austria),
    \+ France = Germany, \+ France = Switzerland, \+ France = Belgium, \+ France = Italy,
    \+ Switzerland = Germany, \+ Switzerland = Austria, \+ Switzerland = Italy, 
    \+ Italy = Austria,
    \+ Belgium = Germany, \+ Belgium = Holland,
    \+ Holland = Germany, 
    \+ Germany = Austria.

    print_central_europe :-
        central_europe(France, Switzerland, Italy, Belgium, Holland, Germany, Austria), nl,
        write("France: "), write(France), nl,
        write("Switzerland: "), write(Switzerland), nl,
        write("Italy: "), write(Italy), nl,
        write("Belgium: "), write(Belgium), nl,
        write("Holland: "), write(Holland), nl,
        write("Germany: "), write(Germany), nl,
        write("Austria: "), write(Austria), nl.
/*
ANSWER
France: red
Switzerland: yellow
Italy: orange
Belgium: yellow
Holland: red
Germany: orange
Austria: red
true 
*/

/*
Q3: CROSS+ROADS = DANGER
*/

cross_roads(C, R, O, S, A, D, N, G, E):-
    dig(S),
    R is (S+S) mod 10, C1 is (S+S)//10,
    dig(D),
    E is (S+D+C1) mod 10, C10 is (S+D+C1)//10,
    dig(O), dig(A),
    G is (O+A+C10) mod 10, C100 is (O+A+C10)//10,
    dig(R),
    N is (R+O+C100) mod 10, C1000 is (R+O+C100)//10,
    dig(C), C>0, dig(R), R>0,
    A is (C+R+C1000) mod 10, D is (C+R+C1000)//10,
    uniq_digits(C, R, O, S, A, D, N, G, E).
/*
this ordering has been chosen because it defines the lowest order number by
assigning values to the two variables that add up to it, and finds any carries it produces.
Then, it finds the next highest order value, using the carry previously found, and continues.
If any value is defined using this method and is then used as an intermediate step to find
a following value, it first checks to ensure that the found value is in the correct range (0-9). 
This is done so that the value of variables that depend on other variables are
not assumed and then checked, they are found (based on the variables they depend on), and then
verified.
*/

uniq_digits(C, R, O, S, A, D, N, G, E) :- 
    dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
    \+ C = R, \+ C = O, \+ C = S, \+ C = A, \+ C = D, \+ C = N, \+ C = G, \+ C = E,
    \+ R = O, \+ R = S, \+ R = A, \+ R = D, \+ R = N, \+ R = G, \+ R = E,
    \+ O = S, \+ O = A, \+ O = D, \+ O = N, \+ O = G, \+ O = E,
    \+ S = A, \+ S = D, \+ S = N, \+ S = G, \+ S = E,
    \+ A = D, \+ A = N, \+ A = G, \+ A = E,
    \+ D = N, \+ D = G, \+ D = E,
    \+ N = G, \+ N = E,
    \+ G = E.

dig(0). dig(1). dig(2). dig(3). dig(4). dig(5). dig(6). dig(7). dig(8). dig(9).
/*
ANSWER
?- cross_roads(C, R, O, S, A, D, N, G, E).
C = 9,
R = 6,
O = 2,
S = 3,
A = 5,
D = 1,
N = 8,
G = 7,
E = 4 .
*/

/*
Q4: Logic problem
*/

print_logic_solution :- 
    solution(Pizza, Steak, Lasagna, Chicken, Coke, Milk, Coffee, Water), nl,
    write('pizza: '), write(Pizza), nl,
    write('steak: '), write(Steak), nl,
    write('lasagna: '), write(Lasagna), nl,
    write('chicken: '), write(Chicken), nl,
    write('coke: '), write(Coke), nl,
    write('milk: '), write(Milk), nl,
    write('coffee: '), write(Coffee), nl,
    write('water: '), write(Water), nl.

solution(Pizza, Steak, Lasagna, Chicken, Coke, Milk, Coffee, Water) :-
    unique_person(Coke, Milk, Coffee, Water),
    unique_person(Steak, Lasagna, Chicken, Pizza),
    beside(doreen, Steak), \+ doreen = Steak,
    Chicken = Coke,
    across(Lasagna, Milk),
    \+ david = Coffee,
    donna = Water,
    \+danny = Steak.




beside(donna, danny). beside(doreen, danny).
beside(donna, david). beside(doreen, david).

across(danny, david). across(donna, doreen).
across(david, danny). across(doreen, donna).

unique_person(A,B,C,D):-
    person(A), person(B), person(C), person(D),
    \+ A = B, \+ A = C, \+ A = D,
    \+ B = C, \+ B = D,
    \+ C = D.
person(donna). person(danny). person(david). person(doreen).

/*
ANSWER
?- print_solution.

pizza: donna
steak: david
lasagna: danny
chicken: doreen
coke: doreen
milk: david
coffee: danny
water: donna
true 
*/ 