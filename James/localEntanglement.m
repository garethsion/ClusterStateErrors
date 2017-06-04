function [output] = localEntanglement(measurementList,rho,qubit_1,qubit_2)
%%% Calculates (lower bounds) the localisable entanglement by projecting a
%%% cluster state with a series of local Pauli measurements, then tracing
%%% out two target qubits, and calculating the concurrence on this pair.
%%% Concurrence is maximised over all listed measurement settings.

number_settings = length(measurementList);

for k = 1:number_settings;
    setting_label = measurementList{k,1};
    this_setting = measurementList{k,2};
    localised = localiseQubits(this_setting,rho,qubit_1,qubit_2);
    probabilities = cell2mat(localised(:,2));
    concurrences = cell2mat(localised(:,5));
    avg_concurrence(k) = real(sum(probabilities.*concurrences));
    results(k,:) = {setting_label,localised,probabilities,concurrences,...
        avg_concurrence(k)};
end

LE = max(avg_concurrence);

output = {LE, results};
    

