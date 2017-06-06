function [results, localise_results] = evaluateStateBounds(IDTable,n,rho,varargin)
%%% Evaluate all quantities of interest for single state of n qubits.
%%% varargin: argument 4 can be set to a measurementList to calculate
%%% localisable entanglement (measured as concurrence).

localise = false;

if nargin>3
    measurementList = varargin{1};
    localise = true;
end

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
localise_results = {};
local_entanglement = -99;
if localise
    qubit_1 = 1;
    qubit_2 = n;
    loc_results = localEntanglement(measurementList,rho,qubit_1,qubit_2);
    local_entanglement = loc_results{1};
    localise_results = loc_results{2};
end

%%% Evaluate C_ZXZ
C_ZXZ = nutzBound(n,generator_exvals);

%%% Evaluate C_gen
C_gen = nutzBound(n,generator_exvals,true);

%%% Evaluate C_alpha
C_alpha = IDLEbound(alpha,n);

%%% output data

results = [rho_fidelity, alpha, ID_lower_fidsquared, ID_upper_fidsquared,...
            ID_lower_fid, ID_upper_fid,...
            local_entanglement,...
            C_ZXZ, C_gen, C_alpha,...
            generator_exvals];
        
end
