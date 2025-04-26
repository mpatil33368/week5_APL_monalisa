% --- Basic Facts ---
parent(john, mary).
parent(john, tom).
parent(susan, mary).
parent(susan, tom).
parent(mary, anna).
parent(mary, bob).
parent(paul, anna).
parent(paul, bob).
parent(tom, lisa).
parent(tom, mike).
parent(linda, lisa).
parent(linda, mike).

male(john).
male(tom).
male(paul).
male(bob).
male(mike).

female(susan).
female(mary).
female(linda).
female(anna).
female(lisa).

% --- Derived Relationships (Rules) ---

% Grandparent rule
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling rule
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin rule
cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sibling(PX, PY),
    X \= Y.

% Children of a person
child(X, Y) :-
    parent(Y, X).

% Descendant (recursive)
descendant(X, Y) :- 
    parent(Y, X).
descendant(X, Y) :-
    parent(Y, Z),
    descendant(X, Z).
