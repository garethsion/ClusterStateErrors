function fidelity = ProcessFidelity(Chi_ideal,Chi_meas)
    % PROCESSFIDELITY - Determines the fidelity of a measured process
    % Usage: fidelity = ProcessFidelity(Chi_ideal, Chi_measured) 
    
    fidelity = 1 - 0.5*trace(sqrt(ctranspose(Chi_ideal - Chi_meas)*...
        (Chi_ideal - Chi_meas))); 
end