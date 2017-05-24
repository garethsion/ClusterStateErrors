sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];
sigma0 = eye(2,2);

X = 1/sqrt(2)*sigmaX;
Y = 1/sqrt(2)*sigmaY;
Z = 1/sqrt(2)*sigmaZ;
I = 1/sqrt(2)*sigma0;

zero_DE = Z;
one_DE = -Z;

CNOT = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];

kron(zero_DE * ctranspose(zero_DE),sigma0) + kron(one_DE * ctranspose(one_DE),sigmaX)

