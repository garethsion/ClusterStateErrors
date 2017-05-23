%%% PROCESS MAP %%%%%%%%%%%%%
sigmaX = [0,1;1,0];
sigmaY = [0,-1i;1i,0];
sigmaZ = [1,0;0,-1];
sigma0 = eye(2,2);

X = sigmaX;
Y = sigmaY;
Z = sigmaZ;
I = sigma0;

%=========================================================================
% This describes the gate based circuit shown in the paper. The values 
% zero_DE and one_DE represent the state of the system before excitation.
% The CNOT is an entangling gate, and G represents the unitary evolution
% of the system after an excitation cycle.
%=========================================================================
% zero_DE = sigmaZ;
% one_DE = -sigmaZ;
% 
% U = [1,0;0,1];
% 
% psi_DE_init = U*zero_DE;
% 
% CNOT = kron((zero_DE*ctranspose(zero_DE)),sigma0)...
%     + kron((one_DE*ctranspose(one_DE)),sigmaX);
% 
% G = exp(-1i*(sigmaX/2)*(pi/2)); % Single qubit rotation
%
%=========================================================================

%=========================================================================
% In reality, the physical properties of the system prevent G from being
% truly unitary. SO instead we describe the operation with a CPTP map
% acting on the DE and the emitted photon. 
%=========================================================================

% Probability of being in an initially pure state. Value deemed
% experimentally.
pure_init_prob = 0.72;

% Initial spin eigenstate is a pi excitation pulse
psi_DE_init = -X;

% Take this inital spin eigenstate and form initial DE state before the
% cluster state generation excitation pulses
rho_DE_init = pure_init_prob * psi_DE_init * ctranspose(psi_DE_init) +...
    (1-pure_init_prob) *0.5*I;

% I'm not fully certain what the density matrices for x  y and z are, so
% for now I am dummying it.
rho_0 = rho_DE_init;
rho_x = rho_DE_init;
rho_y = rho_DE_init;
rho_z = rho_DE_init;

% Determine the DE density matrix. Again the term2...term4 values are
% incorrect, so I have dummied them for now. 
rho_DE_term1 = rho_0*sigma0;
rho_DE_term2 = rho_x*sigmaX;
rho_DE_term3 = rho_y*sigmaY;
rho_DE_term4 = rho_z*sigmaZ;
rho_DE = rho_DE_term1 + rho_DE_term2 + rho_DE_term3 + rho_DE_term4;

% Determine the density matrix for the DE and emitted photon. Dummy values.

%rho_DE_minus_1 = 
%=========================================================================

%=========================================================================
% Build the process matrix. This code will build the plot. I've ripped it
% from my code from the tomography lab with John Morton, and the equations
% below come from Nielson and Chuang. These equations may require
% modification here.
%=========================================================================

p1 = rho_DE_term1;
p4 = rho_DE_term2;
p3 = rho_DE_term3 - 1i*rho_DE_term4 - (1-1i)*(p1+p4)/2;
p2 = rho_DE_term3 + 1i*rho_DE_term4 - (1+1i)*(p1+p4)/2;
    
Lambda = 1/2 * [I, sigmaX; sigmaX, -1*I];
Chi = Lambda * [p1, p2; p3, p4] * Lambda;
bar3(real(Chi));
% hold on;
% bar3(imag(Chi), 'b');