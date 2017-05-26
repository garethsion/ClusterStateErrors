function [output] = noisyCluster(numberqubits,noiseparam)
%%% Generates the noisy n-qubit cluster state. If the pure cluster state is
%%% |C><C|, the output will be rho = p(I/(2^n)) + (1-p)|C><C|, where p is
%%% the variable noiseparam.

if ~and(noiseparam>=0,noiseparam<=1)
    msg = ['The noise parameter must be between'...
            ' 0 (fully mixed) and 1 (pure).'];
        error(msg);
        return
end
    
pureCluster = ClusterMaker(numberqubits);

dim = 2^numberqubits;

noiseTerm = (1/dim)*eye(dim);

noisyState = noiseparam*noiseTerm + (1-noiseparam)*pureCluster;

output = noisyState;