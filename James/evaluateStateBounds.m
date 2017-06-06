function [output] = evaluateStateBounds(IDTable,n,rho,varargin)
%%% Evaluate all quantities of interest for single state of n qubits.

M = n + 1; % ID table number of rows

%%% Define the ideal state:
ideal_state = ClusterMaker(n);

%%% Evaluate fidelity
rho_fidelity = Fidelity(rho,ideal_state);

%%% Evaluate alpha
ID_result = idObservable(IDTable,rho);
alpha = ID_result(1);
ID_lower_fidsquared = idFidLower(alpha,M);
ID_upper_fidsquared = idFidUpper(alpha,M);
ID_lower_fid = sqrt(max(0,real(ID_lower_fidsquared)));
ID_upper_fid = sqrt(max(0,real(ID_upper_fidsquared)));
generator_exvals = ID_result(2:(n+1));

%%% Measure LE concurrence


%%% Evaluate C_ZXZ
C_ZXZ = nutzBound(n,generator_exvals);

%%% Evaluate C_gen
C_gen = nutzBound(n,generator_exvals,true);

%%% Evaluate C_alpha
C_alpha = IDLEbound(alpha,n);

%%% output data

output = [rho_fidelity, alpha, ID_lower_fidsquared, ID_upper_fidsquared,...
            ID_lower_fid, ID_upper_fid, C_ZXZ, C_gen, C_alpha,...
            generator_exvals];
