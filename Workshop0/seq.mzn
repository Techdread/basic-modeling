% input
int: n; %length of an array of numbers

% Array
array[1..n] of var 0..3: x; % 1 dimensional array 1 to n filled with of values of 0 to 3 array is called x

%constraint
constraint x[1] = 0;
constraint x[n] = 3;
constraint forall(i in 1..n-1) (x[i] + x[i+1] <=3); % sum of any two adjacent numbers in the array x is at most 3
constraint forall(i in 1..n where i mod 3 = 0)(x[i] >= 2); %the value of x at positions divisible by 3 to be greater than or equal to 2

solve maximize sum(x);

output ["\(sum(x)) = \(x)\n"];
