% variables
var 0 .. 10: x; % a decision variable x taking values from 0 to 10

% Constraints 
constraint x mod 4 = 0;

% var int: z;
% constraint z * 4 = x; %note solution from tutors

% Solve
var int: y = (x - 7) * (x - 7); %note could not get function pow() TO WORK

solve minimize y ;

output[show(y)]