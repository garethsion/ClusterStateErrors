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

size_of_cluster = 1;

if size_of_cluster > 6
   error('This number of qubits might crash your computer.')
end

Cluster_State = Cluster(size_of_cluster);    
rho_cluster = Cluster_State*Cluster_State';
figure('Name',[num2str(size_of_cluster) ' Qubit Cluster State Density Matrix']);
bar3(real(rho_cluster));hold on; bar3(imag(rho_cluster));
title([num2str(size_of_cluster) ' Qubit Cluster State Density Matrix'], 'FontSize', 30);

%=========================================================================
% Generate Process Matrix for the cluster state
%=========================================================================

