minus = kron(1/sqrt(2) * [1;-1],[1;0]);
ideal_cluster = Cluster(3,minus);
noisy_cluster = ClusterNoise(3,minus);

rho_ideal = ideal_cluster*ideal_cluster';
rho_noisy = noisy_cluster*noisy_cluster';
noise_fidelity = Fidelity(rho_ideal, rho_noisy);

figure;
subplot(1,2,1);
bar3(real(rho_ideal));hold on; bar3(imag(rho_ideal));
title('Ideal Cluster State Density Matrix', 'FontSize',24)
subplot(1,2,2);
bar3(real(rho_noisy));hold on; bar3(imag(rho_noisy));
title(sprintf(['Noisy Cluster State Density Matrix\n Fidelity = '...
    num2str(noise_fidelity)]), 'FontSize',24)


% LE_ideal = LocEntanglement4(rho_cluster)
% LE_noisy = LocEntanglement4(transformed)
ideals_mis1=zeros(1,3);
for x=1:3
    ideals_mis1(x) = LocEntanglement4(rho_ideal,1,x+1);
end

ideals_mis2 = zeros(1,2);
for x=1:2
    ideals_mis2(x) = LocEntanglement4(rho_noisy,2,x+2);
end

ideals_mis3=LocEntanglement4(rho_noisy,3,4);

ideals1=[ideals_mis1(1), ideals_mis2(1), ideals_mis3]; % d=1
ideals2=[ideals_mis1(2),ideals_mis2(2),0];% d=2
ideals3=[ideals_mis1(3),0,0];% d=3
ideals_distances = [ideals1;ideals2;ideals3];

% This forms a matrix of the LE for distance between qubits. Here, we have
% measure qubits 1 and 2, 1 and 3, and 1 and 4;
outcomes_mis1 = zeros(1,3);
for x=1:3
    LE_noisy = LocEntanglement4(rho_noisy,1,x+1);
    outcomes_mis1(x) = LE_noisy;
end

% Here, we have measure 2 and 3 and 2 and 4
outcomes_mis2 = zeros(1,2);
for x=1:2
    outcomes_mis2(x) = LocEntanglement4(rho_noisy,2,x+2);
end

% Here, we have measure 3 and 4
outcomes_mis3=LocEntanglement4(rho_noisy,3,4);

% Now, let's compare the distances from each instance:
d1=[outcomes_mis1(1), outcomes_mis2(1), outcomes_mis3]; % d=1
d2=[outcomes_mis1(2),outcomes_mis2(2),0];% d=2
d3=[outcomes_mis1(3),0,0];% d=3
distances = [d1;d2;d3];

LambdaErr_4qb = 2.041;
lengths_4qb = zeros(1,15);
% lengths_3qb(1) = 0.5*exp(-0.5/lambdaE)
for x=1:15
    lengths_4qb(x) = 0.5*exp(-x/LambdaErr_4qb);
end

d1_max=max(distances(1,:));
d2_max=max(distances(2,:));
d3_max=max(distances(3,:));

% dist_means=[d1_mean,d2_mean,d3_mean];
dist_means=[d1_max,d2_max,d3_max];
dist_axis = [1,2,3];
% (Inlude 'real' in plot to supress warning)
figure;
xax = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
plot(real(dist_axis),real(dist_means),'bo--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','green')
% hold on;
% plot(xax,lengths_4qb,'ro--','LineWidth',2,'markersize',...
%     10,'MarkerFaceColor','blue');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
%axis([0 15 0 0.5]);
%set(gca,'xtick',0:15);
set(gca,'FontSize',20)
grid minor;
%legend('Actual','Expected from Fit')
