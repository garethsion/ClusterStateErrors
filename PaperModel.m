% EPSRC CDT in Delivering Quantum Technologies
% University College London
% MRES Group Project - Deterministic Generation of Cluster States
% Author:   Gareth Jones
% Dependencies: qlib toolkit http://www.tau.ac.il/~quantum/qlib/intro.html
% History:  18.05.201  file created
%                      full description at the top
%           

% Add the path to the qlib library
%addpath ('C:/Users/Gareth/Desktop/2016Clean/Documents/qlib'); qlib;

X = [0,1;1,0];
Y = [0,-1i;1i,0];
Z = [1,0;0,-1];
I = eye(2,2);

%=========================================================================
% Model values, taken from table S1 of supplementary material of Schwartz,
% et al, Science vol. 354, issue 6311, pp. 434-437.
%=========================================================================
t_rad = 0.33E-09; % BiE lifetime t_rad = 1/gamma_d
w3 = (2*pi)/5.05E-09; % BiE precession rate
w2 = (2*pi)/3.03E-09; % DE precession rate
T2_star = 100E-09; % DE dephasing time T2*=1/gamma_2*
hbar_Omega_w = 100E-06; % DE to BiE excitation pulse width
Delta = 0; % DE to BiE excitation pulse detuning
Theta = pi; % DE to BiE excitation pulse area
pure_init_prob = 0.72; % Pure state initialisation probability
%=========================================================================

% Initial spin eigenstate is a pi excitation pulse
psi_DE_init = -X;

% Take this inital spin eigenstate and form initial DE state before the
% cluster state generation excitation pulses
rho_DE_init = pure_init_prob * psi_DE_init * ctranspose(psi_DE_init) +...
    (1-pure_init_prob) *0.5*I;

% Excitation pulses
h = 6.626E-34; % Planck's constant
hbar = h/(2*pi); 
hbar_w2 = hbar * w2;
hbar_w3 = hbar * w3;

Delta_E2 = hbar_w2; % The variables represent energy splittings of the DE
Delta_E3 = hbar_w3; % ... and BiE eigenstates.

H2 = 0.5 * [0, hbar_w2; hbar_w2, 0]; % Ham. acting on DE states 
H3 = 0.5 * [0, hbar_w3; hbar_w3, 0]; % Ham acting on BiE states

Free_Hamiltonian = mod(H2, H3); % Ham. describing unitary evolution

Pulse_Hamiltonian = 0.5 * [Delta, hbar_w2, Omega_R, 0;...
    hbar_w2, Delta, 0, Omega_L; Omega_R, 0, -Delta, hbar_w3;...
    0, Omega_L, hbar_w3, -Delta];

