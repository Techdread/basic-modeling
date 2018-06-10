%Array
array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: TIME = 0..length(readings);

array[TIME] of var int: temp;

%constraints
constraint temp[0] = start;
constraint forall(t in 1..n)(temp[t] = (readings[t] + temp[t-1]) div 2);

solve satisfy; 

%Output
output ["temp = \(temp)\n"];



