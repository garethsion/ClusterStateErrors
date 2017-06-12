ideal_cluster = ClusterMaker(5);
% clust_fidelity = Fidelity(ideal_cluster,transformed);

% LE_ideal = LocEntanglement4(rho_cluster)
% LE_noisy = LocEntanglement4(transformed)
LE_ideal_12 = LocEntanglement5(ideal_cluster,1,2);
LE_ideal_13 = LocEntanglement5(ideal_cluster,1,3);
LE_ideal_14 = LocEntanglement5(ideal_cluster,1,4);
LE_ideal_23 = LocEntanglement5(ideal_cluster,2,3);
%LE_ideal_24 = LocEntanglement5(ideal_cluster,2,4); %%% NEED TO FIX NAN
                                                    %PROBLEM
LE_ideal_34 = LocEntanglement5(ideal_cluster,3,4);
LE_ideal_35 = LocEntanglement5(ideal_cluster,3,5);
LE_ideal_45 = LocEntanglement5(ideal_cluster,4,5);
minus = kron(1/sqrt(2) * [1;-1],[1;0]);
noisy_cluster = ClusterNoise(4,minus);

rho_ideal = ideal_cluster*ideal_cluster';
rho_noisy = noisy_cluster*noisy_cluster';

% This forms a matrix of the LE for distance between qubits. Here, we have
% measure qubits 1 and 2, 1 and 3, and 1 and 4;
outcomes_mis1 = zeros(1,4);
outcomes_mis1t = zeros(1,4);
outcomes_mis2t = zeros(1,3);
outcomes_mis3t = zeros(1,2);

dis1=zeros(1,4);
dis2=zeros(1,3);
dis3=zeros(1,2);

dis1(1) = LocEntanglement5(rho_noisy,4,5);
dis1(2) = LocEntanglement5(rho_noisy,3,4);
dis1(3) = LocEntanglement5(rho_noisy,2,3);
dis1(4) = LocEntanglement5(rho_noisy,1,4);

dis2(1) = LocEntanglement5(rho_noisy,3,5);
dis2(1) = LocEntanglement5(rho_noisy,2,4);
dis2(1) = LocEntanglement5(rho_noisy,1,4);

dis3(1) = LocEntanglement5(rho_noisy,2,5);
dis3(1) = LocEntanglement5(rho_noisy,1,3);

d_4 = LocEntanglement5(rho_noisy,1,2);

d_1 = max(dis1);
d_2 = max(dis2);
d_3 = max(dis3);

distances = [d_1;d_2;d_3;d_4];

Elength_5 = Elength(distances, 50);
% Elengtht_5 = Elength(dist_meanst, 35);

dist_axis = [1,2,3,4];
% (Inlude 'real' in plot to supress warning)
figure;
xax = linspace(1,50,50);
plot(real(dist_axis),real(distances),'bo--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','green')
hold on;
plot(xax,Elength_5,'r*--');
%hold on;
% plot(xax,Elength_5,'go--','LineWidth',2,'markersize',...
%     10,'MarkerFaceColor','blue');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
%axis([0.1 5 0 0.25]);
set(gca,'xtick',0:2:50);
set(gca,'FontSize',20)
grid minor;
legend('Actual','Expected from Fit')
