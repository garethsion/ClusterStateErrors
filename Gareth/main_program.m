% EPSRC CDT in Delivering Quantum Technologies
% University College London
% MRES Group Project - Deterministic Generation of Cluster States
% Author:   Gareth Jones
% Dependencies: qlib toolkit http://www.tau.ac.il/~quantum/qlib/intro.html
% History:  18.05.201  file created
%                      full description at the top
%     

%=========================================================================
% Generate Cluster state from Schwartz paper assuming unitary dynamics
%=========================================================================
% addpath('C:\Users\Gareth\Desktop\QETLAB-0.9');
% addpath('C:\Users\Gareth\Desktop\qit');
%init;
number_of_photons = 4;                                                                                                                                                                           ;

if number_of_photons > 6
   error('This number of qubits might crash your computer.')
end

% Initial state is a minus in the Shwartz paper
minus = kron(1/sqrt(2) * [1;-1],[1;0]);

Cluster_State = Cluster(number_of_photons, minus);

rho_cluster = Cluster_State*Cluster_State';
% figure('Name',[num2str(number_of_photons) ' Photon Cluster State Density Matrix']);
% bar3(real(rho_cluster));hold on; bar3(imag(rho_cluster));
% title([num2str(number_of_photons) ' Photon Cluster State Density Matrix'], 'FontSize', 30);

loc = LocEntanglement(rho_cluster,(number_of_photons+1), 2,4)
%Negativity(rho_cluster,length(rho_cluster));

%neg = Negativity(rho_cluster);


