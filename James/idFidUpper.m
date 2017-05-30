function [output] = idFidUpper(alpha,M)
%%% Calculates the upper bound for the fidelity using ID table formalism.
%%% Input is experimental observable alpha and number of table rows M.


if (abs(alpha)>M)
    msg = 'Absolute value of alpha cannot be larger than M. Check inputs.';
    error(msg)
end

if ~and((rem(M,1)==0),M>0)
    msg = 'M needs to be a positive integer';
    error(msg)
end

if mod(M,2)==0
    % M is even
    F_sq_ID_upper = (alpha + M)/(2*M);
else
    % M is odd
    F_sq_ID_upper = (alpha + M - 2)/(2*M - 2);
end

output = F_sq_ID_upper;