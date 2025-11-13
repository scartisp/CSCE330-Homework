%Simion Cartis

acted_in('Kate Beckinsale', 'The Aviator').
acted_in('Kate Beckinsale', 'Click').
acted_in('Ben Affleck', 'The Town').
acted_in('Jennifer Anniston', 'The Switch').
acted_in('Shia LaBeouf', 'Eagle Eye').
acted_in('Shia LaBeouf', 'New York, I Love You').
acted_in('Shia LaBeouf', 'Indiana Jones and the Kingdom of the Crystal Skull').
acted_in('Christoph Waltz', 'Django Unchained').
acted_in('Christoph Waltz', 'Inglourious Basterds').

directed('Neil Blomkamp', 'District 9').
directed('Martin Scorsese', 'The Aviator').
directed('Martin Scorsese', 'Taxi Driver').
directed('Frank Coraci', 'Click').
directed('Roland Emmerich', '2012').
directed('Quentin Tarantino', 'Inglourious Basterds').
directed('Quentin Tarantino', 'Django Unchained').
directed('Quentin Tarantino', 'Pulp Fiction').
directed('Lana Wachowski', 'The Matrix').
directed('Lilly Wachowski', 'The Matrix').

released('Click', 2006).
released('The Aviator', 2004).
released('District 9', 2009).
released('The Town', 2010).
released('The Switch', 2010).
released('2012', 2009).
released('Inglourious Basterds', 2009).
released('Django Unchained', 2012).
released('Eagle Eye', 2008).
released('New York, I Love You', 2008).
released('Indiana Jones and the Kingdom of the Crystal Skull', 2008).

/*
ANSWERS

Q1:
?- acted_in('Leonardo DiCaprio', 'Babel').
false.

Q2:
?- directed(X, 'District 9').
X = 'Neil Blomkamp' .

Q3:
?- acted_in(X, 'Click'), acted_in(X, 'The Aviator').
X = 'Kate Beckinsale' .

Q4:
?- released(X, 2010), acted_in(Y, X), \+ Y=X, \+ Y='Jennifer Anniston'.
X = 'The Town',
Y = 'Ben Affleck' .

Q5:
?- directed(X,Y), released(Y, 2009), \+ Y=X.
X = 'Neil Blomkamp',
Y = 'District 9' ;
X = 'Roland Emmerich',
Y = '2012' ; THIS IS A MOVIE NAME, NOT YEAR
X = 'Quentin Tarantino',
Y = 'Inglourious Basterds' ;
false.

Q6:
?- directed(X, Y), directed(X, Z), \+ Z=Y.
X = 'Martin Scorsese',
Y = 'The Aviator',
Z = 'Taxi Driver' .

Q7:
?- directed(X, Y), directed(Z, Y), \+ X=Z.
X = 'Lana Wachowski',
Y = 'The Matrix',
Z = 'Lilly Wachowski' .

Q8:
?- acted_in(X, Y), acted_in(X, Z), released(Y, 2008), released(Z, 2008), \+ Y=Z.
X = 'Shia LaBeouf',
Y = 'Eagle Eye',
Z = 'New York, I Love You' .

Q9:
?- acted_in(X, Y), acted_in(X, Z), acted_in(X, A), released(Y, B), released(Z, B), released(A,B), \+ Y=Z, \+ Y=A, \+ A=Z.
X = 'Shia LaBeouf',
Y = 'Eagle Eye',
Z = 'New York, I Love You',
A = 'Indiana Jones and the Kingdom of the Crystal Skull',
B = 2008 .

Q10:
?- acted_in(A, B), acted_in(A, C), directed(D, B), directed(D, C), released(B, E), released(C, F), \+ B=C, \+ A=D, \+ E=F.
A = 'Christoph Waltz',
B = 'Django Unchained',
C = 'Inglourious Basterds',
D = 'Quentin Tarantino',
E = 2012,
F = 2009 ;
A = 'Christoph Waltz',
B = 'Inglourious Basterds',
C = 'Django Unchained',
D = 'Quentin Tarantino',
E = 2009,
F = 2012 ;
false.
*/