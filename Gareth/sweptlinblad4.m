%load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\Transformation2');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_100');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_3000');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_4000');
%load('C:\Users\gjones\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_5000')
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_6000');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_7000');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_8000');
load('C:\Users\Gareth\Dropbox\University College London\ClusterStateErrors\Gaz\three_photon_densities\three_072_10000');

delta_4_100 = three_072_100;
delta_4_3000 = three_072_3000;
delta_4_4000 = three_072_4000;
delta_4_6000 = three_072_6000;
delta_4_7000 = three_072_7000;
delta_4_8000 = three_072_8000;
delta_4_10000 =three_072_10000;

% delta_4_100 = TransRho(three_072_100);
% delta_4_3000 = TransRho(three_072_3000);
% delta_4_4000 = TransRho(three_072_4000);
% delta_4_6000 = TransRho(three_072_6000);
% delta_4_7000 = TransRho(three_072_7000);
% delta_4_8000 = TransRho(three_072_8000);
% delta_4_10000 = TransRho(three_072_10000);

%rhoout

ideal = ClusterMaker(4);
 
del_4_100_fid = Fidelity(ideal,delta_4_100);
del_4_3000_fid = Fidelity(ideal,delta_4_3000);
del_4_4000_fid = Fidelity(ideal,delta_4_4000);
del_4_6000_fid = Fidelity(ideal,delta_4_6000);
del_4_7000_fid = Fidelity(ideal,delta_4_7000);
del_4_8000_fid = Fidelity(ideal,delta_4_8000);
del_4_10000_fid = Fidelity(ideal,delta_4_10000);

fidelities_4 = [del_4_100_fid, del_4_3000_fid, del_4_4000_fid,...
    del_4_6000_fid, del_4_7000_fid, del_4_8000_fid, del_4_10000_fid];

minus = kron(1/sqrt(2) * [1;-1],[1;0]);
G_noise = ClusterNoise(3,minus);
rho_G = G_noise*G_noise';
LE_G = Negs2(rho_G);

LE_4_100 = Negs2(delta_4_100);
LE_4_3000 = Negs2(delta_4_3000);
LE_4_4000 = Negs2(delta_4_4000);
LE_4_6000 = Negs2(delta_4_6000);
LE_4_7000 = Negs2(delta_4_7000);
LE_4_8000 = Negs2(delta_4_8000);
LE_4_10000 = Negs2(delta_4_10000);

Elength_4_100 = Elength(LE_4_100, 25);
Elength_4_3000 = Elength(LE_4_3000, 25);
Elength_4_4000 = Elength(LE_4_4000, 25);
Elength_4_6000 = Elength(LE_4_6000, 25);
Elength_4_7000 = Elength(LE_4_7000, 25);
Elength_4_8000 = Elength(LE_4_8000, 25);
Elength_4_10000 = Elength(LE_4_10000, 25);
Elength_G = Elength(LE_G,25);

dist_x_axis = [1,2,3];
Elength_4_axis = linspace(1,25,25);

ideal_clust = Cluster(3,minus);
rho_ideal = ideal_clust*ideal_clust';
test_fid = Fidelity(rho_ideal, rho_G);

%%% PLOT WITH INSET %%%%%

% Place axes at (0.1,0.1) with width and height of 0.8
fig = figure;
handaxes1 = axes('position', [0.1 0.1 0.8 0.8]);
plot(dist_x_axis,real(LE_4_100),'b-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_3000),'c-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_4000),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_6000),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_7000),'y-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_8000),'k-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_4_10000),'m-o','LineWidth',2); hold on;
% plot(dist_x_axis,real(LE_2000),'b-o','LineWidth',2); hold on;
% plot(dist_x_axis,real(LE_5000),'c-o','LineWidth',2); hold on;
% plot(dist_x_axis,real(LE_10000),'r-o','LineWidth',2); hold on;

plot(Elength_4_axis, real(Elength_4_100), 'b*--'); hold on;
plot(Elength_4_axis, real(Elength_4_3000), 'c*--'); hold on;
plot(Elength_4_axis, real(Elength_4_4000), 'r*--'); hold on;
plot(Elength_4_axis, real(Elength_4_6000), 'g*--'); hold on;
plot(Elength_4_axis, real(Elength_4_7000), 'y*--'); hold on;
plot(Elength_4_axis, real(Elength_4_8000), 'k*--'); hold on;
plot(Elength_4_axis, real(Elength_4_10000), 'm*--'); hold on;
% plot(Elength_4_axis, real(Elength_3_1000), 'k*--'); hold on;
% plot(Elength_4_axis, real(Elength_3_2000), 'bd--'); hold on;
% plot(Elength_4_axis, real(Elength_3_5000), 'cd--'); hold on;
% plot(Elength_4_axis, real(Elength_3_10000), 'rd--'); hold on;
title('LE with Swept DE Dephasing Time', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 24 0 0.5]); set(gca,'xtick',0:25); set(gca,'FontSize',22); grid minor;
legend('DE T^*_2 = 100ns', '           = 3000ns', '           = 4000ns',...
    '           = 6000ns', '           = 7000ns','           = 8000ns',...
    '           = 10000ns');
% xlabel('t'); ylabel('sin(t)');
set(handaxes1, 'box', 'off');

% Adjust XY label font
handxlabel1 = get(gca, 'xlabel');
set(handxlabel1, 'fontsize', 24, 'fontweight', 'bold');
handylabel1 = get(gca, 'ylabel');
set(handylabel1, 'fontsize', 24, 'fontweight', 'bold');

% % Place second set of axes on same plot
% handaxes2 = axes('position', [0.58 0.2 0.3 0.3]);

% Place third set of axes on same plot
handaxes2 = axes('position', [0.3 0.4 0.4 0.4]);
plot(dist_x_axis,real(LE_G),'b-o','LineWidth',2); hold on;
plot(Elength_4_axis, real(Elength_G), 'b*--'); hold on;
grid minor;
title('LE with Induced Noise - Fidelity = 0.483', 'FontSize', 22);
%title(['LE with Induced Noise - Fidelity = ', num2str(test_fid)], 'FontSize', 22);
xlabel('Distance Between Qubits', 'FontSize',22);
ylabel('Negativity', 'FontSize',22);
set(gca,'FontSize',22)
axis([0 25 0 0.5]); set(gca,'xtick',0:2:25);
figure;
bar(fidelities_4)
title('Fidelity with Rising Dephasing Time', 'FontSize', 22);
xlabel('Dephasing Time (ns)', 'FontSize', 18);
ylabel('Fidelity', 'FontSize', 18);
set(gca,'FontSize',16);
set(gca,'XTickLabel', [100 3000 4000 6000 7000 8000 10000]);
axis([0 8 0 0.6]);
