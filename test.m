% EPSRC CDT in Delivering Quantum Technologies
% University College London
% MRES Group Project - Deterministic Generation of Cluster States
% Author:   Gareth Jones
% Dependencies: qlib toolkit http://www.tau.ac.il/~quantum/qlib/intro.html
% History:  18.05.201  file created
%                      full description at the top
%           

% Add the path to the qlib library
addpath ('C:/Users/Gareth/Desktop/2016Clean/Documents/qlib'); qlib;

% Generate dummy Werner state for initial testing
wern_state = Werner(2);
figure('Name', 'Werner State');
bar3(wern_state);
title('Werner State', 'FontSize', 22)
%zlim([-1.25 1.25])
%trace(wern_state)

% Find localisable entanglement between qubits


