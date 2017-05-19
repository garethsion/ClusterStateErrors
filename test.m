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

% Generate dummy Werner state for initial testing, and plot density matrix
wern_state = Werner(100);
figure('Name', 'Werner State');
bar3(wern_state);
title('Werner State', 'FontSize', 22)


% Find localisable entanglement between qubits
% First, calculate the reduced density matrix created by performing
% individual, successive, projective measurements on qubits in between
% m and n (equation 16 in the supplementary material of Greganti, et al)
Ps = 1/4;
reduced_dm = wern_state;

% Calculate LE
LE = Ps*negativity(reduced_dm)


