function [output] = IDLEbound(alpha,n)
%%% Function to evaluate a localisable entanglement bound based
%%% on ID formalism. (alpha is as defined in Greganti et al.)
%%% n is number of qubits in the cluster state.

LE_bound = 0.5*(alpha - n + 1);

output = LE_bound;