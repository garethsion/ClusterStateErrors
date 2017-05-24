function [output] = noisyCluster(numberqubits,noiseparam)
%%% Generates the noisy n-qubit cluster state. If the pure cluster state is
%%% |C><C|, the output will be rho = p(I/(2^n)) + (1-p)|C><C|, where p is
%%% the variable noiseparam.


pureCluster = ClusterMaker(numberqubits);

dim = 2^numberqubits;

noiseTerm = (1/dim)*eye(dim);

noisyState = noiseparam*noiseTerm + (1-noiseparam)*pureCluster;

output = noisyState;