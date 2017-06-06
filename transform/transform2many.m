function [output] = transform2many(rho_set)
%%%% Performs the local rotation on a set of many two-photon (three qubit)
%%%% states.

number_states = size(rho_set,3);

for k = 1:number_states
    rho_out(:,:,k) = transform_2(rho_set(:,:,k));
end

output = rho_out;

