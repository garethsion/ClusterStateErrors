X = [0,1;1,0];
Y = [0,-1i;1i,0];
Z = [1,0;0,-1];
I = eye(2,2);

%=========================================================================
% Model values, taken from table S1 of supplementary material of Schwartz,
% et al, Science vol. 354, issue 6311, pp. 434-437.
%=========================================================================
t_rad = 0.33E-09; % BiE lifetime t_rad = 1/gamma_d
w_3 = (2*pi)/5.05E-09; % BiE precession rate
w_2 = (2*pi)/3.03E-09; % DE precession rate
T2_star = 100E-09; % DE dephasing time T2*=1/gamma_2*
hbar_Omega_w = 100E-06; % DE to BiE excitation pulse width
Delta = 0; % DE to BiE excitation pulse detuning
Theta = pi; % DE to BiE excitation pulse area
pure_init_prob = 0.72; % Pure state initialisation probability
%=========================================================================

% Initial state is a pi excitation pulse
psi_DE_init = -X;

rho_DE_init = pure_init_prob * psi_DE_init * ctranspose(psi_DE_init) +...
    (1-pure_init_prob) *0.5*I