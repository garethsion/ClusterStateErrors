function [output] = concurrence(rho)
%%%%% Calculate the concurrence for two qubit rho

YY = [ 0 0 0 -1;
       0 0 1 0;
       0 1 0 1;
      -1 0 0 0]
  
rho_twirl = YY*rho*YY;

M = rho*rho_twirl;

eigens = eig(M);

lambdas = sort(real(sqrt(eigens)));

eval = [-1 -1 -1 1]*lambdas;

concurrence_val = max([0,eval]);

output = concurrence_val;