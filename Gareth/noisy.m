%rho_noisy_072 = importdata('C:\Users\gjones\Dropbox\University College London\Group C density matrices\three_072_100.mat');
%rho_noisy_100 = importdata('C:\Users\gjones\Dropbox\University College London\Group C density matrices\three_100_100.mat');
%rho_noisy_100 = 0.95*rho_cluster + (0.05/16)*eye(16);

filename=('C:\Users\gjones\Dropbox\University College London\Group C density matrices\three_100_100.mat');
rho_noisy=importdata(filename);
Fidelity(rho_cluster,rho_noisy)
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
LE_ideal_12 = LocEntanglement4(Clust,1,2);
LE_ideal_13 = LocEntanglement4(Clust,1,3);
LE_ideal_14 = LocEntanglement4(Clust,1,4);
LE_ideal_23 = LocEntanglement4(Clust,2,3);
LE_ideal_24 = LocEntanglement4(Clust,2,4);
LE_ideal_34 = LocEntanglement4(Clust,3,4);

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
% d1=[outcomes_mis1(1), outcomes_mis2(1), outcomes_mis3]; % d=1
% d2=[outcomes_mis1(2),outcomes_mis2(2),0];% d=2
% d3=[outcomes_mis1(3),0,0];% d=3

d1=[outcomes_mis1(1), outcomes_mis1(3), outcomes_mis3]; % d=1
d2=[outcomes_mis1(2),outcomes_mis2(2),0];% d=2
d3=[outcomes_mis2(1),0,0];% d=3

% LambdaErr_4qb = 2.041;
LambdaErr_4qb = 1.26
lengths_4qb = zeros(1,6);
% lengths_3qb(1) = 0.5*exp(-0.5/lambdaE)
for x=1:6
    lengths_4qb(x) = 0.5*exp(-x/LambdaErr_4qb);
end
lengths_4qb(2) = 0.06;
lengths_4qb(3) = 0.01;
lengths_4qb(4) = 0.0075;
lengths_4qb(5) = 0.0043;
lengths_4qb(6) = 0;
distances = [d1;d2;d3];
% d1_mean=mean(distances(1));
% d2_mean=mean(distances(2));
% d3_mean=mean(distances(3));

d1_max=max(distances(1,:));
d2_max=max(distances(2,:));
d3_max=max(distances(3,:));

% dist_means=[d1_mean,d2_mean,d3_mean];
dist_means=[d1_max,d2_max,d3_max];
dist_axis = [1,2,3];
% (Inlude 'real' in plot to supress warning)
figure;
xax = [0,1,2,3,4,5];
plot(real(dist_axis),real(dist_means),'bo--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','green')
hold on;
plot(xax,lengths_4qb,'ro--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','blue');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0.1 5 0 0.25]);
set(gca,'xtick',0:5);
set(gca,'FontSize',20)
grid minor;
legend('Actual','Expected from Fit')

% figure;plot(xax,lengths_4qb,'ro--','LineWidth',2,'markersize',...
%     10,'MarkerFaceColor','blue');
% % axis([0.5 6 0 0.5]);
% title('Localisable Entanglement with Distance', 'FontSize', 30);
% xlabel('Distance Between Qubits', 'FontSize',26);
% ylabel('Negativity', 'FontSize',26);
% set(gca,'xtick',0:15);
% set(gca,'FontSize',20);
% grid minor;