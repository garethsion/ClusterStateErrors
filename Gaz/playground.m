%=========================================================================
% Here I'm building the idealised protocol using the gate level
% implementation from the Schwartz paper. This assumes a unitary evolution
% of the photon
%=========================================================================

close all;
set(0,'DefaultFigureVisible','on');

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
CZ = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,-1];
%figure;bar3(CNOT);

% We're going to CNOT the plus state of the DE and the zero state of the
% photon.
plus_zero = kron(plus, zero);

% G is the gate which represents the pi/2 rotation about the x axis caused
% by the laser excitation pulse. 
%G = kron(exp(-1i*(pi/4)*sigmaX),sigma0);
%G = [0,0,-1i,0; 0,0,0,-1i; -1i,0,0,0; 0,-1i,0,0];
G = sigmaX.*-1i;
G_32 = kron(G,eye(16)); % extend Hilbert space of G to dim(32) 

initial=zeros(16,1); % initialise space for the five qubits
initial(1) = 1; 

% The DE state becomes entangled with the photon through the application of
% the CNOT gate
CNOT = kron(CNOT,eye(8)); % Extend Hilbert space of CNOT to dim(32)
%GCnot = G_32*CNOT; % Apply CNOT gate
%cycle = cyc*plus_zero;
cycle = G_32*CNOT*kron(plus,initial); % plus_initial is the coupling of the 
                                    %initial DE state to the initial qubit

% Create the density matrix of the cycle
rho_cycle = cycle*ctranspose(cycle);
figure('Name','Cycle1');bar3(real(rho_cycle));
hold on;
bar3(imag(rho_cycle));

cycle2=kron(cycle,[1;0]);
CZ = kron(CZ,eye(16));

rho_cycle2 = cycle2*cycle2';
figure;bar3(rho_cycle2);

end2 = CZ*cycle2;
rho_end2 = end2*end2';

figure('Name', 'End Cycle After 2 Excitations"=');bar3(rho_end2)
%axis([0,32,0,32,0,0.5]);

cycle3 = kron(cycle2,[1;0]);
rho_cycle3 = cycle3*cycle3';
figure;bar3(rho_cycle3);




% % ChiMatrix = BuildChi(rho_cycle, rho_cycle, rho_cycle, rho_cycle, 4);
% % figure;bar3(real(ChiMatrix));hold on; bar3(imag(ChiMatrix));
% 
% endcyc = CZ*cycle;
% rho_end1 = endcyc*endcyc';
% figure('Name','EndCycle');bar3(real(rho_end1));hold on;bar3(imag(rho_end1));
% %kron(sigmaX*[0,-1i;-1i,0],sigma0)
% 
% cycle2 = kron(G*CNOT,sigma0)*(kron(cycle,zero));
% rho_cycle2 = cycle2*ctranspose(cycle2);
% figure('Name','Cycle2');bar3(real(rho_cycle2));hold on; bar3(imag(cycle2));
% 
% endcyc2 = kron(CZ,sigma0)*cycle2;
% rho_end2 = endcyc2*endcyc2';
% figure('Name','EndCycle2');bar3(real(rho_end2));hold on;bar3(imag(rho_end2));
% 
% cycle3 = kron(kron(G*CNOT,sigma0),sigma0)*(kron(cycle2,zero));
% rho_cycle3 = cycle3*ctranspose(cycle3);
% figure('Name','Cycle3');bar3(real(rho_cycle3));hold on; bar3(imag(cycle3));
% 
% cycle4 = kron(kron(kron(G*CNOT,sigma0),sigma0),sigma0)*(kron(cycle3,zero));
% rho_cycle4 = cycle4*ctranspose(cycle4);
% figure('Name','Cycle4');bar3(real(rho_cycle4));hold on; bar3(imag(cycle4));
% 
% figure;
% subplot(2,2,1);
% bar3(real(rho_cycle));hold on; bar3(imag(rho_cycle));
% subplot(2,2,2);
% bar3(real(rho_cycle2));hold on; bar3(imag(cycle2));
% subplot(2,2,3);
% bar3(real(rho_cycle3));hold on; bar3(imag(cycle3));
% subplot(2,2,4);
% bar3(real(rho_cycle4));hold on; bar3(imag(cycle4));