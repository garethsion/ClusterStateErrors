function [output] = customBound(stabilizerTable,constantTerm,rho)
%%%%% Evaluates a custom LE bound of form:
%%%%% LE >= C_custom = ( [sum of stabilizers] - constantTerm)/2
number_obs = length(stabilizerTable);

for k = 1:number_obs
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

concurrence_bound = 0.5*(sum(stabilizer_exvalue)-constantTerm);


output = concurrence_bound;

end