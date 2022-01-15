## Defining a Policy Imperitively

so there's a dependency `p1 <- lights, {drivers states}`
sN represents the lights state, π = perpendicular light,
we can define state as:
```c++
// include information about time dependency
#define REACTION 1
#define current first
#define next second
#define Driver pair<Action, Action>

struct State {
	int time;
	Color currentColor;
	vector<Driver> drivers;
	State* nextState;
};

enum Action {
	STOPPED,
	ACCEL,
	SPEED,
	SLOW,
};

enum Color {
	RED,
	GREEN,
	YELLOW,
};
```

IF p1.s0.currentColor = RED AND
p1.s0.time NOT maxtime AND
driver.current IN π.s0.drivers = SPEED THEN

p1.s0.time++;

ELSE THEN

traverse(π.s0); // -> until s0 = RED
p1.s0 = State { time = 0, currentColor = GREEN, drivers = drivers.next, nextState = PROLOG HELP! };

## Defining Policy Declaritively

We will do this using prolog psuedo code instead of C++ like psuedo code.

Policy 1 is a set of rules if I look above I may be able to figure out these rules implementation of maxtime policy doesn't make any sense to me at the moment. This is actually really cool you get this generic conflict policy which we can apply to each transition policy.
```prolog
-maxtime(X) :- not maxtime(X).
conflict(X) :- red(X).
conflict(X) :- -maxtime(X).
conflict(X) :- perpendicular(X, P), at(P, Driver, _), speed(Driver).
-conflict(X) :- not conflict(X).

p1(X, State) :- -conflict(X), light(_, X, State).
```
