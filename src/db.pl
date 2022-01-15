% database is updated via api?

#include 'constraints.pl'.

% maxtime south
maxtime(south).

% drivers
at(west, john, east).
at(west, joe, east).
at(east, sarah, south).
at(north, jane, south).

% driver states
% 1. stopped
% 2. reaction time (use ML here? default: padding ~400ms)
% 3. acceleration
% 4. running speed
% 5. stopping
speed(john).
speed(joe).
stopped(jane).
acceleration(sarah).

% init colors of the lights
light(red, north, green).
light(green, west, yellow).
light(green, east, yellow).
light(yellow, south, red).
