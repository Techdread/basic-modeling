% workshop 2
% select a set of trade negotiation party
enum NEGOTIATOR;
NEGOTIATOR: dummy; 

int: l; % minimum party size
int: u; % maximum party size
int: m; % minimum joint ability

array[NEGOTIATOR] of int: honor;
array[NEGOTIATOR,NEGOTIATOR] of int: joint;

var set of NEGOTIATOR: neg;

constraint card(neg) >= l;
constraint card(neg) <= u;

constraint sum(i, j in neg where i < j)(joint[i,j]) >= m;

var int: minhonor;
constraint minhonor = min([honor[i] | i in NEGOTIATOR
                    where i in neg]);

solve maximize minhonor;

output ["party = \(neg) ;\nobj = \(minhonor);\n"];