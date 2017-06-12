load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_5.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_6.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_8.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_10.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_12.mat');

precess_5 = TransRho(three_precess_5);
precess_6 = TransRho(three_precess_6);
precess_8 = TransRho(three_precess_8);
precess_10 = TransRho(three_precess_10);
%precess_12 = TransRho(three_precess_12);

ideal = ClusterMaker(4);
 
precess_5_fid = Fidelity(ideal,precess_5);
precess_6_fid = Fidelity(ideal,precess_6);
precess_8_fid = Fidelity(ideal,precess_8);
precess_10_fid = Fidelity(ideal,precess_10);
%precess_12_fid = Fidelity(ideal,precess_12);

fidelities_swept_prec_4 = [precess_5_fid, precess_6_fid, precess_8_fid,...
    precess_10_fid];
% fidelities_4 = [precess_5, precess_6, precess_8, precess_10, precess_12];

LE_precess_5 = Negs2(precess_5);
LE_precess_6 = Negs2(precess_6);
LE_precess_8 = Negs2(precess_8);
LE_precess_10 = Negs2(precess_10);
%LE_precess_12 = Negs2(precess_12);

Elength_precess_5 = Elength(LE_precess_5, 25);
Elength_precess_6 = Elength(LE_precess_6, 25);
Elength_precess_8 = Elength(LE_precess_8, 25);
Elength_precess_10 = Elength(LE_precess_10, 25);
%Elength_precess_12 = Elength(LE_precess_12, 25);

dist_x_axis = [1,2,3];
Elength_4_axis = linspace(1,25,25);

%%% PLOT WITH INSET %%%%%

% Place axes at (0.1,0.1) with width and height of 0.8
fig = figure;
handaxes1 = axes('position', [0.1 0.1 0.8 0.8]);
plot(dist_x_axis,real(LE_precess_5),'b-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_precess_6),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_precess_8),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_precess_10),'y-o','LineWidth',2); hold on;
%plot(dist_x_axis,real(LE_precess_12),'b-o','LineWidth',2); hold on;

plot(Elength_4_axis, real(Elength_precess_5), 'b*--'); hold on;
plot(Elength_4_axis, real(Elength_precess_6), 'r*--'); hold on;
plot(Elength_4_axis, real(Elength_precess_8), 'g*--'); hold on;
plot(Elength_4_axis, real(Elength_precess_10), 'y*--'); hold on;
%plot(Elength_4_axis, real(Elength_precess_12), 'b*--'); hold on;

title('LE with Swept DE Precession Time T=2\pi \\ \omega_2', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 24 0 0.5]); set(gca,'xtick',0:25); set(gca,'FontSize',20); grid minor;
legend('DE T = 5ns', '       = 6ns', '       = 8ns',...
    '       = 10ns');
% xlabel('t'); ylabel('sin(t)');
set(handaxes1, 'box', 'off');

% Adjust XY label font
handxlabel1 = get(gca, 'xlabel');
set(handxlabel1, 'fontsize', 20, 'fontweight', 'bold');
handylabel1 = get(gca, 'ylabel');
set(handylabel1, 'fontsize', 20, 'fontweight', 'bold');

% Place second set of axes on same plot
handaxes2 = axes('position', [0.58 0.2 0.3 0.3]);
bar(fidelities_swept_prec_4)
title('Fidelity with Rising Precession Time', 'FontSize', 22);
xlabel('Precession Time (ns)', 'FontSize', 18);
ylabel('Fidelity', 'FontSize', 18);
set(gca,'FontSize',16);
set(gca,'XTickLabel', [5 6 8 10 12]);
axis([0 5 0 1]);