% input
int: n; %length of an array of numbers

% Array
array[1..n] of var 0..9: x; % 1 dimensional array 1 to n filled with of values of  0 to 9 array is called x

% constraint 
constraint sum(x) = product(x);

% add non decreasing constraint
constraint forall(i in 1..n-1) (x[i] <= x[i+1]); % Brilliant way of optimising

solve satisfy;