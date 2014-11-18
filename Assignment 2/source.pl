% Q1 - maximum predicate - outputs maximum value X from list L

maximum([X],X).							% boundary case (X must be X)
maximum([H|T], H) :- maximum(T, Y), H >= Y.			% general case (highest value is H)
maximum([H|T], X) :- maximum(T, X), X > H.			% general case (highest value is X)

% Q2 - duplicate_nth predicate - duplicates index N in L1 to output L2

duplicate_nth(1, [H|T], [H,H|T]).				% boundary case (duplicate H)
duplicate_nth(N, [H|T], [H|T2]) :-				% general case (no duplication)
	N > 1, N1 is N - 1, duplicate_nth(N1, T, T2).
	
% Q3 - semantic network inheritance

instance(city, london).
instance(city, lincoln).
instance(town, boston).
instance(cathedral, stmarys).

subclass(settlement, city).
subclass(settlement, town).
subclass(building, cathedral).
subclass(building, townhall).

has(city, cathedral).
has(city, townhall).
has(town, townhall).
has(lincoln, stmarys).

has(X, Y) :- instance(C, X), has(C, Y).
has(X, Y) :- instance(C, X), has(C, D), subclass(Y, D).