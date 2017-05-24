function exValue = pauliMeasure(pauliString,rho)
%%% Takes string eg. 'Z X Z I I I' and finds expectation value of this 
%%% Pauli measurement for the density matrix rho.

pauliOperator = pauliTensor(pauliString);

rhoSize = size(rho);
pauliSize = size(pauliOperator);

if ~(rhoSize(1)==rhoSize(2))
    msg = 'Your density matrix is not square';
    error(msg)
end

if ~(rhoSize==pauliSize)
    msg = ['Your density matrix is of different dimension to the'...
            ' specified Pauli operator.'];
    error(msg)
end

exValue = trace(pauliOperator*rho);

return