function [output] = pauliProject(measurementOutcomes,rho)
%%%% Project a state conditioned on outcome of series of measurements.
%%%% Gives matrix of projected states with probabilities.

number_outcomes = length(measurementOutcomes);

projectors = makePaulis(measurementOutcomes);

for k = 1:number_outcomes
    
    this_projector = projectors(:,:,k);
    projected_matrix = this_projector*rho;
    probability = trace(projected_matrix);
    projected_state = projected_matrix/probability;
    
    outcome_label = measurementOutcomes{k};
    
    results(k,:) = {outcome_label, probability, projected_state};
    
end

output = results;
    
