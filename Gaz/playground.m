%=========================================================================
% Here I'm building the idealised protocol using the gate level
% implementation from the Schwartz paper. This assumes a unitary evolution
% of the photon
%=========================================================================

close all;

sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];
sigma0 = eye(2,2);

X = 1/sqrt(2)*sigmaX;
Y = 1/sqrt(2)*sigmaY;
Z = 1/sqrt(2)*sigmaZ;
I = 1/sqrt(2)*sigma0;

plus = 1/sqrt(2) * [1;1];
zero = [1;0];

CNOT = [1,0,0,0;0,1,0,0;0,0,0,1;0,0,1,0];
%figure;bar3(CNOT);

% We're going to CNOT the plus state of the DE and the zero state of the
% photon.
plus_zero = kron(plus, zero);

% G is the gate which represents the pi/2 rotation about the x axis caused
% by the laser excitation pulse. 
G = kron(exp(-1i*(pi/4)*sigmaX),sigma0);

% The DE state becomes entangled with the photon through the application of
% the CNOT gate
GCnot = G*CNOT;
%cycle = cyc*plus_zero;
cycle = G*CNOT*plus_zero;

% Create the density matrix of the cycle
rho_cycle = cycle*ctranspose(cycle);
figure;bar3(real(rho_cycle));
hold on;
bar3(imag(rho_cycle));

ChiMatrix = BuildChi(rho_cycle, rho_cycle, rho_cycle, rho_cycle, 4);
figure;bar3(real(ChiMatrix));hold on; bar3(imag(ChiMatrix));
