% the women of the family
female(lora).
female(amanda).
female(sheela).
female(diana).
female(aileen).
female(emily).

% the men of the family
male(oscar).
male(owen).
male(tom).
male(adam).
male(shaun).

% the relationships between them
parent(lora, amanda).
parent(lora, tom).
parent(lora, sheela).

parent(oscar, amanda).
parent(oscar, tom).

parent(owen, sheela).

parent(amanda, diana).
parent(amanda, adam).

parent(tom, shaun).
parent(tom, aileen).

parent(sheela, emily).

% QUESTION 2
% mother and father defined by specific gender and parent relationship
mother(X, Y) :- female(X), parent(X, Y).
father(X, Y) :- male(X), parent(X, Y).

% children defined by gender and parent relationship of Y to X
child(X, Y) :- parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
son(X, Y) :- male(X), parent(Y, X).

% siblings defined by gender and having at least one matching parent
sister(X, Y) :- dif(X, Y), female(X), parent(B, X), parent(B, Y).
brother(X, Y) :- dif(X, Y), male(X), parent(B, X), parent(B, Y).
sibling(X, Y) :- dif(X, Y), parent(B, X), parent(B, Y).

% uncles and aunts defined by gender and sibling relation to one parent
uncle(X, Y) :- male(X), parent(B, Y), sibling(B, X).
aunt(X, Y) :- female(X), parent(B, Y), sibling(B, X).
cousin(X, Y) :- parent(B, X), (uncle(B, Y);aunt(B, Y)).

% QUESTION 4
% relatives are defined by parent, child, and siblings relationships
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(B, Y), ancestor(X, B).
relative(X, Y) :- dif(X, Y), ancestor(X, Y) ; ancestor(Y, X).
relative(X, Y) :- dif(X, Y), ancestor(B, X), ancestor(B, Y).

% QUESTION 5
% modolo predicate defined by boundary cases and general case
modolo(X, 0, X).
modolo(X, D, R) :- X < D, R is X.
modolo(X, D, R) :- X >= D, modolo(X - D, D, R), !.