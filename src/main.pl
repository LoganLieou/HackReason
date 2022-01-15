#include 'constraints.pl'.
#include 'db.pl'.
% transition graph is CLL
% state dependency graph is DLL

% timing policy
-maxtime(X) :- not maxtime(X).

% if perpendicular light is green
conflict(X) :- perpendicular(X, P), light(green, P, _).

% if the drivers on the perpendicular road are driving full speed, and maxtime not reached
conflict(X) :- -maxtime(X), perpendicular(X, P), at(P, Driver, _), speed(Driver). 

% negate conflict
-conflict(X) :- not conflict(X).

% transition policy definition
transition_policy(X, NewColor) :- -conflict(X), light(_, X, NewColor).

?- transition_policy(west, NewColor).
?- conflict(west).
