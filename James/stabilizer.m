function [generators,state] = stabilizer(generatorTable)
%%% Calculate the stabilizer state corresponding to a set of stabilizer
%%% generators, where generators are given as strings describing the 
%%% single qubit Paulis. Example:
%%% %%% IDtable = [ {'X Z I'};
%%%                 {'Z X Z'};
%%%                 {'I Z X'};
%%%                 {'Y X Y'}]
%%% Output is the set of generators converted as matrices, and a density
%%% matrix representation of the stabilizer state.



num = length(generatorTable);

for k = 1:num
    gen(:,:,k)=pauliTensor(generatorTable{k});
end

ident = eye(2^num);

currentOp = (1/(2^num))*ident;

for k=1:num
    currentOp = currentOp*(ident + gen(:,:,k));
end

state = currentOp;

generators = gen;
