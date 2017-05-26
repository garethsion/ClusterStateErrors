function [output] = mixedCluster(numberqubits,mixparam,badstate)
%%% Mixes the n-qubit cluster state with a bad state. If the pure cluster
%%% state is|C><C|, and the bad state is sigma, the output will be:
%%% rho = p*sigma + (1-p)|C><C|, 
%%% the variable noiseparam.


%%% Validation %%%
if ~and(mixparam>=0,mixparam<=1)
    msg = ['The noise parameter must be between'...
            ' 0 (fully mixed) and 1 (pure).'];
        error(msg);
        return
end

dim = 2^numberqubits;

rhoSize = size(badstate);

if ~(rhoSize(1)==rhoSize(2))
    msg = 'Your density matrix is not square';
    error(msg)
end

if ~(rhoSize(1)==dim)
    msg = ['The dimension of your density matrix does not match the '...
            'cluster state'];
    error(msg)
end

if ~(trace(badstate)==1)
    msg = ['Your density matrix does not have trace 1.'];
    error(msg)
end

%%% Calculate the state %%%

pureCluster = ClusterMaker(numberqubits);

mixedState = mixparam*badstate + (1-mixparam)*pureCluster;

output = mixedState;