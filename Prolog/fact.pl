% ---------------------------------------------------------------------
% four-generation family tree using mother and father as a fact.pl
% ---------------------------------------------------------------------

male(david).				% first generation
male(john).					% first generation
male(james).				% first generation
male(paul).					% second generation
male(ryan).					% second generation

female(jane).				% first generation
female(olivia).				% first generation
female(julia).				% first generation
female(norah).				% second generation
female(sophia).				% second generation
female(claire).				% second generation
female(alice).				% third generation
female(ava).				% third generation
female(lena).				% third generation
female(zoe).				% third generation
female(emma).				% fourth generation

father(david, norah).		% first generation
father(john, paul).			% first generation
father(john, claire).		% first generation
father(john, ryan).			% first generation
father(james, sophia).		% first generation
father(paul, alice).		% second generation
father(ryan, ava).			% second generation
father(ryan, lena).			% second generation
father(ryan, zoe).			% second generation

mother(jane, norah).		% first generation
mother(olivia, paul).		% first generation
mother(olivia, claire).		% first generation
mother(olivia, ryan).		% first generation
mother(julia, sophia).		% first generation
mother(norah, alice).		% second generation
mother(sophia, ava).		% second generation
mother(sophia, lena).		% second generation
mother(sophia, zoe).		% second generation
mother(alice, emma).		% third generation

% ---------------------------------------------------------------------
% relationships
% ---------------------------------------------------------------------

% parent(X,Y):- X is Y's parent if X is Y's mother or father

parent(X,Y):- mother(X,Y) ; father(X,Y).

% progenitor(X,Y):- if X is mother or father of Y (it includes the cut to avoid duplicated brothers or sisters)

progenitor(X,Y):- mother(X,Y), ! ; father(X,Y).

% grandfather(X,Y):- X is Y's grandfather if X is father of Y's parent
% grandmother(X,Y):- X is Y's grandmother if X is mother of Y's parent

grandfather(X,Y):- father(X,Z), parent(Z,Y).
grandmother(X,Y):- mother(X,Z), parent(Z,Y).

% son(X,Y):- X is Y's son if X is male and Y is X's parent
% daughter(X,Y):- X is Y's daughter if X is female and Y is X's parent

son(X,Y):- male(X), parent(Y,X).        
daughter(X,Y):- female(X), parent(Y,X).

% sister(X,Y):- X is Y's sister if X is female and shares a parent with Y
% brother(X,Y):- X is Y's brother if X is male and shares a parent with Y
% sibling(X,Y):- X is Y's sibling if X and Y are brothers or sisters

sister(X,Y):- female(X), progenitor(Z,X), progenitor(Z,Y), X \= Y.
brother(X,Y):- male(X), progenitor(Z,X), progenitor(Z,Y), X \= Y.
sibling(X,Y):- brother(X,Y) ; sister(X,Y).

% aunt(X,Y):- X is female and is sister of Y's parent
% uncle(X,Y):- X is male and is brother of Y's parent

aunt(X,Y):- female(X), parent(Z,Y), sister(X,Z).
uncle(X,Y):- male(X), parent(Z,Y), brother(X,Z).

% ancestor(X,Y):- X is Y's ancestor if X is Y's parent or X is Y's ancestor if X is Y's parent, 
% descendant(X,Y):- X is Y's descendant if Y is X's ancestor

ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).

descendant(X,Y):- ancestor(Y,X).

% X has a child

haschild(X):- parent(X,_).

% ---------------------------------------------------------------------
% queries
% ---------------------------------------------------------------------

% parent(X, alice).				-> norah, paul

% mother(X, alice).				-> norah
% mother(X, lena).				-> sophia
% mother(X, emma).				-> alice

% father(X, alice).				-> paul
% father(X, lena).				-> ryan
% father(X, claire).			-> john

% grandmother(X, emma).			-> norah
% grandfather(X, emma).			-> paul
% grandmother(X, alice).		-> jane, olivia
% grandfather(X, lena).			-> james, john

% son(X, john).					-> paul, ryan
% daughter(X, olivia).			-> claire
% daughter(X, sophia).			-> ava, lena, zoe

% brother(paul, ryan).			-> true
% brother(X, ryan).				-> paul
% sibling(paul, ryan).			-> true
% sister(ryan, claire).			-> false
% sister(claire, ryan).			-> true
% sibling(X, ryan).				-> paul, claire
% sister(X, lena).				-> ava, zoe
% sibling(X, ava).				-> lena, zoe

% descendant(X, jane).			-> norah, alice, emma
% descendant(X, olivia).		-> paul, claire, ryan, alice, emma, ava, lena, zoe

% ancestor(olivia, emma).		-> true 
% ancestor(jane, emma).			-> true
% ancestor(julia, lena).		-> true

% ancestor(norah, emma).		-> true 
% ancestor(paul, emma).			-> true

% ancestor(X, emma).			-> alice, jane, olivia, norah, david, john, paul

% uncle(X, lena).				-> paul
% aunt(X, lena).				-> claire

% haschild(alice).				-> True
% haschild(zoe).				-> False
