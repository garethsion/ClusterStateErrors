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
noisy_cluster = ClusterNoise(4,minus);
rho_ideal = ideal_cluster*ideal_cluster';
rho_noisy = noisy_cluster*noisy_cluster';

% This forms a matrix of the LE for distance between qubits. Here, we have
% measure qubits 1 and 2, 1 and 3, and 1 and 4;
outcomes_mis1 = zeros(1,4);
outcomes_mis1t = zeros(1,4);
outcomes_mis2t = zeros(1,3);
outcomes_mis3t = zeros(1,2);

outcomes_mis1t(1) = LocEntanglement5(rho_noisy,1,2);
outcomes_mis1t(2) = LocEntanglement5(rho_noisy,2,3);
outcomes_mis1t(3) = LocEntanglement5(rho_noisy,3,4);
outcomes_mis1t(4) = LocEntanglement5(rho_noisy,4,5);

outcomes_mis2t(1) = LocEntanglement5(rho_noisy,1,3);
outcomes_mis2t(2) = LocEntanglement5(rho_noisy,2,4);
outcomes_mis2t(3) = LocEntanglement5(rho_noisy,3,5);

outcomes_mis3t(1) = LocEntanglement5(rho_noisy,1,4);
outcomes_mis3t(1) = LocEntanglement5(rho_noisy,2,5);

outcomes_mis4=LocEntanglement5(rho_noisy,1,5);

d1=[outcomes_mis1(1), outcomes_mis2(1), outcomes_mis3(1), outcomes_mis4]; % d=1
d2=[outcomes_mis1(2),outcomes_mis2(2), outcomes_mis3(2),0];% d=2
d3=[outcomes_mis2(3),outcomes_mis2(3),0,0];% d=3
d4=[outcomes_mis4,0,0,0];%d=4

d1t=[outcomes_mis1t(1),outcomes_mis1t(2),outcomes_mis1t(3),outcomes_mis1t(4)];
d2t=[outcomes_mis1t(2),outcomes_mis2t(2), outcomes_mis3t(2),0];% d=2
d3t=[outcomes_mis2t(3),outcomes_mis2t(3),0,0];% d=3
d4t=[outcomes_mis4,0,0,0];%d=4

distancest = [d1t;d2t;d3t;d4t];
dist_means=[d1_max,d2_max,d3_max,d4_max];

d1t_max=max(distancest(1,:));
d2t_max=max(distancest(2,:));
d3t_max=max(distancest(3,:));
d4t_max=max(distancest(4,:));
dist_meanst=[d1t_max,d2t_max,d3t_max,d4t_max];

Elengtht_5 = Elength(dist_meanst, 35);

dist_axis = [1,2,3,4];
% (Inlude 'real' in plot to supress warning)
figure;
xax = linspace(1,35,35);
plot(real(dist_axis),real(dist_meanst),'bo--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','green')
% hold on;
% plot(xax,Elengtht_5,'go--','LineWidth',2,'markersize',...
%     10,'MarkerFaceColor','blue');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0.1 5 0 0.5]);
set(gca,'xtick',0:2:35);
set(gca,'FontSize',20)
grid minor;
legend('Actual','Expected from Fit')
