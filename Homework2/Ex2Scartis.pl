left_of(bay, yonge).    left_of(st-george, bay).
left_of(spadina, st-george). left_of(bathurst, spadina).
left_of(christie, bathurst).

west_of(X, Y) :- left_of(X, Y).
west_of(X, Z) :- left_of(X, Y), west_of(Y, Z).
east_of(Y, X) :- west_of(X, Y). 