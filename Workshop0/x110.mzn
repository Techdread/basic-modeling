% variables
var 1 .. 10: x;

%constraints works without

%constraint x > 0;
%constraint x < 11;

solve satisfy;

output[show(x)]