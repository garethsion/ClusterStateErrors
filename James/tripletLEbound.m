function [output] = tripletLEbound(stabilizerTable,rho);
%%%% Calculates the bound for localisable entanglement, as per Nutz et al.,
%%%% using the triplet of observables B_1, B_2, B_3.

%%% length check
number_obs = length(stabilizerTable);

if number_obs ~= 3
    msg = 'you need a triplet of observables';
    error(msg);
end

for k = 1:3
    this_stabilizer = pauliTensor(stabilizerTable{k});
    stabilizer(:,:,k) = this_stabilizer;
    stabilizer_exvalue(k) = trace(this_stabilizer*rho);
end

%%% Check that the stabilizers have the correct product
tolerance = 0.00001;
difference = stabilizer(:,:,2)*stabilizer(:,:,1) - stabilizer(:,:,3);

if sum(sum(~(abs(difference)<=tolerance))) ~= 0
    msg = 'Your stabilizers do not have the correct product properties';
    error(msg);
end

concurrence_bound = 0.5*(sum(stabilizer_exvalue)-1);

output = concurrence_bound;

end