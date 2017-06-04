function [output] = nutzBound(n,obsExpectation,varargin)
%%% Evaluates Localisable Entanglement bound as per Nutz et al. 2017.
%%% LE_1,n (rho) >= 1 - n(1 - <ZXZ>)
%%% where <ZXZ> is the minimum of all evaluated Z_(j-1) X_j Z_(j+1), X_1
%%% Z_2, and Z_m-1, X_m stabiliser generators, for m-qubit cluster state.
%%% n is the number of qubits
%%% over which to measure.
%%% obsExpectation is a vector of the XZ, ZXZ and ZX observables measured.
%%% third optional argument takes true or false. If true,
%%% calculates bound using stabilizers for specific positions (i.e. does
%%% not just take the minimum).
individual_obs_flag = false;
if varargin > 2
    individual_obs_flag = varargin{3};
end

ZXZ = min(obsExpectation);

calc_LE_bound = 1 - n*(1 - ZXZ);

LE_bound = max([0,calc_LE_bound]);

% If flag is set, also calculate bound using all observables.
if individual_obs_flag
    calc_obs_bound = sum(obsExpectation) - n + 1;
    LE_obs_bound = max([0,calc_obs_bound]);
    LE_bound = [LE_bound, LE_obs_bound]; 
end

output = LE_bound;




