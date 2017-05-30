function [output] = checkIdentity(IDTable)
%%% See Greganti et. al. (2015) doi:10.1103/PhysRevA.91.022325
%%% From a table of Pauli operators given in the format, eg:
%%% IDtable = [ {'X Z I'};
%%%             {'Z X Z'};
%%%             {'I Z X'};
%%%             {'Y X Y'}]
%%% (We assume these operators stabilize the target state, so eigenvalues
%%% are all +1.)
%%% Function multiplies all entries together and checks they give the
%%% identity.
tolerance = 0.01;


M = length(IDTable);


matrices =  makePaulis(IDTable);

currentMatrix = matrices(:,:,1);
d = size(currentMatrix,1);
ident=eye(d);

for k = 2:M
    isIdentity = 0;
    currentMatrix = currentMatrix*matrices(:,:,k);
    isIdentity = sum((currentMatrix-ident)<tolerance)
    if isIdentity
        display(['Identity reached at element number ' num2str(k)]);
    end
end

if isIdentity
    display(['Final product was the identity']);
else
    display(['Final product was NOT the identity']);
end

output = currentMatrix;

end