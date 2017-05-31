%=========================================================================
% This will generate a process matrix for a one photon (two qubit) cluster
% state following the method in Beterov, et aa, arXiv:1601.07282v3
% [quant-ph], and Bialczak's PhD Thesis (see link below)
% http://web.physics.ucsb.edu/~martinisgroup/theses/Bialczak2011.pdf.
%=========================================================================

% Right now, this preamble is superfluous, but it may be useful later if I
% change something. 
number_of_photons = 1;

if number_of_photons > 6
   error('This number of qubits might crash your computer.')
end

zero = [1;0];
one = [0;1];

I = [1,0;0,1];
X = [0,1;1,0];
Z = [1,0;0,-1];

% Define generic inputs
H = zero;
V = one;
D = 1/sqrt(2) * [1;1];
R = 1/sqrt(2) * [1;-1i];

% Define a 2x4 matrix containing the generic inputs
input = H;
input(:,2)=V;
input(:,3)=D;
input(:,4)=R;

state = zeros(4,16);
for x=1:4
    for y = 1:4
        state(:,4*(x-1)+y) = Cluster(number_of_photons,(kron(input(:,x),input(:,y))));
    end
end

% for u=1:4
%     for v=1:4
%         state_tam(:,4*(u-1)+v) = Cluster_tam
%     end
% end


rho = zeros(4,64);

% for x=1:length(state)
%     rho(1:
% end


% Build density matrices. Can implement this is a loop for neatness
rho_HH = state(:,1)*state(:,1)';
rho_HV = state(:,2)*state(:,2)';
rho_HD = state(:,3)*state(:,3)';
rho_HR = state(:,4)*state(:,4)';
rho_VH = state(:,5)*state(:,5)';
rho_VV = state(:,6)*state(:,6)';
rho_VD = state(:,7)*state(:,7)';
rho_VR = state(:,8)*state(:,8)';
rho_DH = state(:,9)*state(:,9)';
rho_DV = state(:,10)*state(:,10)';
rho_DD = state(:,11)*state(:,11)';
rho_DR = state(:,12)*state(:,12)';
rho_RH = state(:,13)*state(:,13)';
rho_RV = state(:,14)*state(:,14)';
rho_RD = state(:,15)*state(:,15)';
rho_RR = state(:,16)*state(:,16)';

% Build the Chi matrix. This follows the Beterov paper for performing state
% tomography on two qubits. 

% SWAP matrix. Not quite sure what the purpose of this is, but it may be
% key in understanding how to generalise tomography for N qubits.
M = [1,0,0,0;0,0,1,0;0,1,0,0;0,0,0,1];  
P = kron(I,kron(M,I));
Lambda = kron(0.25 * (kron(Z,I)+kron(X,X)) , (kron(Z,I) + kron(X,X)));
K = P*Lambda;

rho_matrix = [rho_HH',rho_HV',rho_HD',rho_HR';rho_VH',rho_VV',rho_VD',...
    rho_VR';rho_DH',rho_DV',rho_DD',rho_DR';rho_RH',rho_RV',rho_RD',...
    rho_RR'];

Chi = K' * rho_matrix * K;
figure;bar3(real(Chi));hold on; bar3(imag(Chi));
title(sprintf('Process Matrix Describing Evolution\n of System in Each Cycle'), 'FontSize', 30)

% Chi_H = [Chi(:,1), Chi(:,2), Chi(:,3), Chi(:,4)]
% figure;bar3(real(Chi_H))

% Determine the fidelity of the measured process matrix. here, we don't
% have a measured one, so the fidelity should always be unity. However it
% will be useful to compare the fidelity with the master equation results.
fidelity = ProcessFidelity(Chi,Chi);