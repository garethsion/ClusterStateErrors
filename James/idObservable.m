function [output] = idObservable(IDtable,rho)
%%% See Greganti et. al. (2015) doi:10.1103/PhysRevA.91.022325
%%% Function evaluates the expectation value of the observable denoted        
%%% alpha in the above paper for the density matrix rho.
%%% Alpha is based on the identity product formalism, and is calculated
%%% from a table of Pauli operators given in the format, eg:
%%% IDtable = [ {'X Z I'};
%%%             {'Z X Z'};
%%%             {'I Z X'};
%%%             {'Y X Y'}]
%%% (We assume these operators stabilize the target state, so eigenvalues
%%% are all +1.)

rhoSize = size(rho);

if ~(rhoSize(1)==rhoSize(2))
    msg = 'Your density matrix is not square';
    error(msg)
end


M = length(IDtable);


for k = 1:M
    IDops(:,:,k) = pauliTensor(IDtable{k});
    ObsExpectation(k) = trace(IDops(:,:,k)*rho);
end

alpha = sum(IDops,3);

alphaExValue = trace(alpha*rho);

output = [alphaExValue,ObsExpectation];
