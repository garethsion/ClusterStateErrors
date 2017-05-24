function [output] = idFidelity(IDtable,rho)
%%% See Greganti et. al. (2015) doi:10.1103/PhysRevA.91.022325
%%% Function evaluates the fidelity bound from the above paper for the 
%%% density matrix rho based on the identity product formalism. Input IDtable 
%%% is the identity product table as described in the paper.
%%% Example:
%%% IDtable = [ {'X Z I'};
%%%             {'Z X Z'};
%%%             {'I Z X'};
%%%             {'Y X Y'}]
%%% (We assume these operators stabilize the target state, so eigenvalues
%%% are all +1.)

alpha = idObservable(IDtable,rho);

M = length(IDtable);

F_ID = (alpha - M + 4)/4;

output = F_ID;