function [output] = localiseQubits(measurementOutcomes,rho,qubit_1,qubit_2);
%%%% Project out a pair of qubits based on measurement outcomes, and
%%%% partial trace. qubit_1 and qubit_2 are the qubits to retain, e.g. for
%%%% a five qubit state, qubit_1=2 and qubit_2=5 traces out qubits 1, 3,
%%%% and 4. Also calculates concurrence for reduced state.

number_qubits = log2(size(rho,1));

number_outcomes = length(measurementOutcomes);

projection_results = pauliProject(measurementOutcomes,rho);

dimension_vector = 2*ones(1,number_qubits);

trace_vector = [1:number_qubits];

trace_vector = trace_vector(trace_vector~=qubit_1);

trace_vector = trace_vector(trace_vector~=qubit_2);

for k=1:number_outcomes
    this_state = projection_results{k,3};
    reduced_state = PartialTrace(this_state,trace_vector,dimension_vector);
    this_concurrence = concurrence(reduced_state);
    results(k,:) = {projection_results{k,:},reduced_state,this_concurrence};
end
    
output = results;
    
    
    