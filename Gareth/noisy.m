%rho_noisy_072 = importdata('C:\Users\gjones\Dropbox\University College London\Group C density matrices\three_072_100.mat');
%rho_noisy_100 = importdata('C:\Users\gjones\Dropbox\University College London\Group C density matrices\three_100_100.mat');
%rho_noisy_100 = 0.95*rho_cluster + (0.05/16)*eye(16);

filename=('C:\Users\Gareth\Dropbox\University College London\Group C density matrices\three_100_100.mat');
rho_noisy=importdata(filename);

[pathstr,name,ext] = fileparts(filename);

transformed = TransRho(rho_noisy);
init_success_prob = strsplit(name,'_');
init_success_prob = init_success_prob(2);
init_success_prob=char(init_success_prob);

Clust = ClusterMaker(4);
clust_fidelity = Fidelity(Clust,transformed);

figure;
subplot(1,2,1);
bar3(real(Clust));hold on; bar3(imag(Clust));
title('Ideal Cluster State Density Matrix', 'FontSize',24)
subplot(1,2,2);
bar3(real(transformed));hold on; bar3(imag(transformed));
title(sprintf(['Noisy Cluster State Density Matrix: \n Fidelity = '...
    num2str(clust_fidelity) '\n Initialisation Success Probability = '...
    init_success_prob, ' %%']), 'FontSize',20);

% LE_ideal = LocEntanglement4(rho_cluster)
% LE_noisy = LocEntanglement4(transformed)
LE_ideal = LocEntanglement4(Clust,1,2);

% This forms a matrix of the LE for distance between qubits. Here, we have
% measure qubits 1 and 2, 1 and 3, and 1 and 4;
outcomes_mis1 = zeros(1,3);
for x=1:3
    LE_noisy = LocEntanglement4(transformed,1,x+1);
    outcomes_mis1(x) = LE_noisy;
end

% Here, we have measure 2 and 3 and 2 and 4
outcomes_mis2 = zeros(1,2);
for x=1:2
    LE_noisy = LocEntanglement4(transformed,2,x+2);
    outcomes_mis2(x) = LE_noisy;
end

% Here, we have measure 3 and 4
outcomes_mis3=LocEntanglement4(transformed,3,4);

% Now, let's compare the distances from each instance:
d1=[outcomes_mis1(1), outcomes_mis2(1), outcomes_mis3]; % d=1
d2=[outcomes_mis1(2),outcomes_mis2(2),0];% d=2
d3=[outcomes_mis1(3),0,0];% d=3

distances = [d1;d2;d3];
d1_mean=mean(distances(1));
d2_mean=mean(distances(2));
d3_mean=mean(distances(3));

dist_means=[d1_mean,d2_mean,d3_mean];
dist_axis = [1,2,3];
% (Inlude 'real' in plot to supress warning)
figure;plot(real(dist_axis),real(dist_means),'b*-');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 4 0 0.12]);
set(gca,'xtick',0:4);
set(gca,'FontSize',20)
grid minor;