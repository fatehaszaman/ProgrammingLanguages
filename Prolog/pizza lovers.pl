% ---------------------------------------------------------------------
% pizza lovers.pl 
% ---------------------------------------------------------------------

female(jane).
female(alice).
female(mary).

male(john).
male(james).
male(bill).

eats(jane, salad).
eats(jane, pizza).
eats(jane, fruit).
eats(alice, salad).
eats(alice, fruit).
eats(john, pasta).
eats(john, pizza).
eats(james, pizza).
eats(james, fruit).
eats(bill, pizza).

drinks(john, beer).
drinks(bill, beer).
drinks(mary, wine).
drinks(alice, soda).
drinks(alice, water).
drinks(james, water).

% ---------------------------------------------------------------------
% relationships
% ---------------------------------------------------------------------

% Write Prolog rules for:
%
% - Jane likes men who drink beer and eat pizza
% - John likes women who eat pizza
% - John likes women who drink wine
% - Alice likes men who eat fruit and drink water
% - James likes women who eat fruit and drink water or soda
% - Men and women may fall in love if they like each other

% Jane likes men who drink beer and eat pizza
likes(jane, X) :- male(X), drinks(X, beer), eats(X, pizza).

% John likes women who eat pizza
likes(john, X) :- female(X), eats(X, pizza).

% John likes women who drink wine
likes(john, X) :- female(X), drinks(X, wine).

% Alice likes men who eat fruit and drink water
likes(alice, X) :- male(X), eats(X, fruit), drinks(X, water).

% James likes women who eat fruit and drink water or soda
likes(james, X) :- female(X), eats(X, fruit), (drinks(X, water); drinks(X, soda)).

% Define loves(X, Y) based on mutual liking
loves(X, Y) :- likes(X, Y), likes(Y, X).


% ---------------------------------------------------------------------
% queries
% ---------------------------------------------------------------------

% what does jane eat?                                -> salad, pizza, fruit
eats(jane, X).        

% who eats pizza?                                    -> jane, john, james, bill
eats(X, pizza).

% who eats salad and pizza?                          -> jane
eats(X, salad), eats(X, pizza).

% which are the meals that jane and john like?       -> pizza    
eats(jane, X), eats(john, X).  

% who does jane like?                                -> john, bill
likes(jane, X).

% who does john like?                                -> jane, mary
likes(john, X).

% who does jane love?                                -> john
loves(jane, X).

% who does alice love?                               -> james
loves(alice, X).

% who does john love?                                -> jane
loves(john, X).

% who loves james?                                   -> alice
loves(james, X).

% list all possible couples                          -> john and jane; james and alice
loves(X, Y).
