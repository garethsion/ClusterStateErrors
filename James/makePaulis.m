function [output] = makePaulis(pauliTable);
%%% From a table of Pauli operators given in the format, eg:
%%% pauliTable = [ {'X Z I'};
%%%             {'Z X Z'};
%%%             {'I Z X'};
%%%             {'Y X Y'}]
%%% Calculates the matrix representations.

M = length(pauliTable);

for k = 1:M
    PauliOps(:,:,k) = pauliTensor(pauliTable{k});
end

output = PauliOps;
