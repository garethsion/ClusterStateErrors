function [output] = nutzBound(rho,n,obsExpectation)
%%% Evaluates Localisable Entanglement bound as per Nutz et al. 2017.
%%% LE_1,n (rho) >= 1 - n(1 - <ZXZ>)
%%% where <ZXZ> is the minimum of all evaluated Z_(j-1) X_j Z_(j+1), X_1
%%% Z_2, and Z_m-1, X_m stabiliser generators, for m-qubit cluster state.
%%% rho is the state to be evaluated against, n is the number of qubits
%%% over which to measure.
%%% obsExpectation is a vector of the XZ, ZXZ and ZX observables measured.

ZXZ = min(obsExpectation);

LE_bound = 1 - n*(1 - ZXZ);

output = LE_bound;




