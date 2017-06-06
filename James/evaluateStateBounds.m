function [results, localise_results] = evaluateStateBounds(IDTable,n,rho,varargin)
%%% Evaluate all quantities of interest for single state of n qubits.
%%% varargin: 
%%% (...,'Localise',measurementList,...): set a measurementList to
%%% calculate localisable entanglement (measured as concurrence).
%%% (...,'Triplet',stabilizerTable,...): calculate the direct bound from
%%% Nutz et al. using triplet of stabilizer measurements.
%%% -99 in output indicates quantity not evaluated


localise = false;
evaluate_triplet = false;

if nargin>3
    for k = 1:nargin-4
        if strcmp('Localise',varargin{k})  
            measurementList = varargin{k+1};
            localise = true;
        end
        if strcmp('Triplet',varargin{k})  
            stabilizerList = varargin{k+1};
            evaluate_triplet = true;
        end
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

%%% Evaluate triplet measurement
C_triple = -99;
if evaluate_triplet
    C_triplet = tripletLEbound(stabilizerList,rho);
end

%%% output data

results = [rho_fidelity, alpha, ID_lower_fidsquared, ID_upper_fidsquared,...
            ID_lower_fid, ID_upper_fid,...
            local_entanglement,...
            C_ZXZ, C_gen, C_alpha, C_triplet,...
            generator_exvals];
        
end
