% ---------------------------------------------------------------------
% facts
% ---------------------------------------------------------------------

female(jane).
female(alice).

male(john).
male(james).

eats(jane, salad).
eats(jane, pizza).
eats(jane, fruit).
eats(alice, salad).
eats(alice, fruit).
eats(john, pasta).
eats(john, pizza).
eats(james, pizza).
eats(james, fruit).

drinks(john, beer).
drinks(jane, wine).
drinks(alice, soda).
drinks(alice, water).
drinks(james, water).


% ---------------------------------------------------------------------
% relationships / rules
% ---------------------------------------------------------------------

% Jane likes men who drink beer and eat pizza
likes(jane, X) :- male(X), eats(X, pizza), drinks(X, beer).

% John likes women who drink wine
likes(john, X) :- female(X), eats(X, pizza).

%Alice likes men who eat fruit and drink water
likes(alice, X) :- male(X), eats(X, fruit), drinks(X, water).

% James likes women who eat fruit and drink water or soda
likes(james, X) :- female(X), eats(X, fruit),( drinks(X, water); drinks( X, soda)). 
