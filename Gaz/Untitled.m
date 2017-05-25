sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];
sigma0 = eye(2,2);

X = 1/sqrt(2)*sigmaX;
Y = 1/sqrt(2)*sigmaY;
Z = 1/sqrt(2)*sigmaZ;
I = 1/sqrt(2)*sigma0;

plus = 1/sqrt(2) * [1;1];
initial_state = kron(plus,[1;0]);
G = sigmaX.*-1i;
CNOT = cnot();

no_of_qubits = 4;

% Application of first excitation pulse
cnot1 = CNOT;
cycle1 = kron(G, eye(2))*cnot1*initial_state;
rho_cycle1 = cycle1*cycle1';
figure;bar3(rho_cycle1);

% Application of second excitation pulse
cnot2 = blkdiag(eye(4),sigmaX,sigmaX);
space = kron(cycle1,[1;0]); % expand Hilbert space;
cycle2 = kron(G,eye(4)) * cnot2 * space ;
rho_cycle2 = cycle2*cycle2';
figure;bar3(rho_cycle2)

% Application of third excitation pulse
cnot3 = blkdiag(eye(8),sigmaX,sigmaX,sigmaX,sigmaX);
space = kron(cycle2,[1;0]); % expand Hilbert space;
cycle3 = kron(G,eye(8)) * cnot3 * space ;
rho_cycle3 = cycle3*cycle3';
figure;bar3(rho_cycle3)

% Application of fourth excitation pulse
cnot4 = blkdiag(eye(16),sigmaX,sigmaX,sigmaX,sigmaX,sigmaX,sigmaX,sigmaX,sigmaX);
space = kron(cycle3,[1;0]); % expand Hilbert space;
cycle4 = kron(G,eye(16)) * cnot4 * space ;
rho_cycle4 = cycle4*cycle4';
figure;bar3(rho_cycle4)

