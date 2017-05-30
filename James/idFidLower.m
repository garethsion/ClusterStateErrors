function [output] = idFidLower(alpha,M)
%%% Calculates the lower bound for the fidelity using ID table formalism.
%%% Input is experimental observable alpha and number of table rows M.

if (abs(alpha)>M)
    msg = 'Absolute value of alpha cannot be larger than M. Check inputs.';
    error(msg);
end

if ~and((rem(M,1)==0),M>0)
    msg = 'M needs to be a positive integer';
    error(msg)
end

F_sq_ID_lower = (alpha - M + 4)/4 ;

output = F_sq_ID_lower;