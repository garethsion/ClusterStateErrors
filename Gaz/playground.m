sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];
sigma0 = eye(2,2);

X = 1/sqrt(2)*sigmaX;
Y = 1/sqrt(2)*sigmaY;
Z = 1/sqrt(2)*sigmaZ;
I = 1/sqrt(2)*sigma0;

plus = 1/sqrt(2) * [1;1];
%minus = 1/sqrt(2) * [1;-1];
zero = [1;0];

CNOT = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];
%figure;bar3(CNOT);

plus_one = kron(plus, zero);
G = kron(exp(-1i*(pi/4)*sigmaX),sigma0);
GCnot = G*CNOT;
cycle = cyc*plus_one;

cycle_dm = cycle*ctranspose(cycle)
figure;bar3(real(cycle_dm));
hold on;
bar3(imag(cycle_dm));

