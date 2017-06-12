clear;
close all;
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_5.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_6.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_8.mat');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_10.mat');
%load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\P\three_precess_12.mat');

ideal = ClusterMaker(4);
 
minus = kron(1/sqrt(2) * [1;-1],[1;0]);
%G_noise = ClusterNoise(3,minus);
G_noise_5 = three_precess_5;
G_noise_6 = three_precess_6;
G_noise_8 = three_precess_8;
G_noise_10 = three_precess_10;

rho_G_5 = G_noise_5*G_noise_5';
LE_G_5 = Negs2(rho_G_5);

rho_G_6 = G_noise_6*G_noise_6';
LE_G_6 = Negs2(rho_G_6);

rho_G_8 = G_noise_8*G_noise_8';
LE_G_8 = Negs2(rho_G_8);

rho_G_10 = G_noise_10*G_noise_10';
LE_G_10 = Negs2(rho_G_10);

Elength_G_5 = Elength(LE_G_5,25);
Elength_G_6 = Elength(LE_G_6,25);
Elength_G_8 = Elength(LE_G_8,25);
Elength_G_10 = Elength(LE_G_10,25);


dist_x_axis = [1,2,3];
Elength_G_axis = linspace(1,25,25);

fig = figure;

plot(dist_x_axis,real(LE_G_5),'b-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_G_6),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_G_8),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_G_10),'m-o','LineWidth',2); hold on;

plot(Elength_G_axis, real(Elength_G_5), 'b*--'); hold on;
plot(Elength_G_axis, real(Elength_G_6), 'g+--'); hold on;
plot(Elength_G_axis, real(Elength_G_8), 'rs--'); hold on;
plot(Elength_G_axis, real(Elength_G_10), 'md--'); hold on;
title('LE with Swept Precession Time T=2\pi \\ \omega_2', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 24 0 0.5]); set(gca,'xtick',0:25); set(gca,'FontSize',22); grid minor;
legend('DE T = 5ns', '         = 6ns', '         = 8ns',...
    '         = 10ns');

