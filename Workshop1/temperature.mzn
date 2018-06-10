enum CONTROLLER; 
CONTROLLER = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CONTROLLER] of int: cost = [1, 5, 3, 9, 0];
array[CONTROLLER] of int: raise_temp = [1, 4, -2, -5, 0];
%Above section was only bit of code was able to do myself.

%input
array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: TIME0 = 0..length(readings); %Readings from the start temperture
set of int: TIME = 1..length(readings); %Readings for the Controller 

array[TIME0] of var 25..30: temp; %will hold the output tempeture (constrained 25.30)
array[TIME] of var CONTROLLER: choice; %will hold the choice of the controller

%constraints
constraint temp[0] = start; %push the start temp so the output temp is filled in
constraint forall(t in TIME)(temp[t] = (readings[t] + temp[t-1]) div 2
                                        + raise_temp[choice[t]]); %find the ouput temp by averaging the temperture and using the controller

var int: t_cost = sum(t in TIME)(cost[choice[t]]); % sum up the cost by summing the choices

solve minimize t_cost; %solve by minimizing

%Output
output ["temp = \(temp)\n choice = \(choice)\n cost = \(t_cost)\n;"];



