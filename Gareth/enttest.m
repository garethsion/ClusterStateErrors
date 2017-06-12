load('Transformation2.mat');
filename1=('C:\Users\Gareth\Dropbox\University College London\Group C density matrices\two_072_100.mat');
filename2=('C:\Users\Gareth\Dropbox\University College London\Group C density matrices\two_100_100.mat');
rho_noisy_072=importdata(filename1);
rho_noisy_100=importdata(filename2);
[pathstr,name,ext] = fileparts(filename1);
name1 = name;
[pathstr,name,ext] = fileparts(filename2);
name2 = name;

transformed_072 = Transformation2*rho_noisy_072*Transformation2';
transformed_100 = Transformation2*rho_noisy_100*Transformation2';

init_success_prob_072 = strsplit(name1,'_');
init_success_prob_072 = init_success_prob_072(2);
init_success_prob_072=char(init_success_prob_072);

init_success_prob_100 = strsplit(name2,'_');
init_success_prob_100 = init_success_prob_100(2);
init_success_prob_100=char(init_success_prob_100);

Clust = ClusterMaker(3);
clust_fidelity_072 = Fidelity(Clust,transformed_072);
clust_fidelity_100 = Fidelity(Clust,transformed_100);

figure;
subplot(1,3,1);
bar3(real(Clust));hold on; bar3(imag(Clust));
title('Ideal Cluster State Density Matrix', 'FontSize',24)
subplot(1,3,2);
bar3(real(transformed_072));hold on; bar3(imag(transformed_072));
title(sprintf(['Noisy Cluster\n State Density Matrix: \n Fidelity = '...
    num2str(clust_fidelity_072) '\n Initialisation Success\n Probability = '...
    init_success_prob_072, ' %%']), 'FontSize',20);
subplot(1,3,3);
bar3(real(transformed_100));hold on; bar3(imag(transformed_100));
title(sprintf(['Noisy Cluster\n State Density Matrix: \n Fidelity = '...
    num2str(clust_fidelity_100) '\n Initialisation Success\n Probability = '...
    init_success_prob_100, ' %%']), 'FontSize',20);

% LE_ideal = LocEntanglement4(rho_cluster)
% LE_noisy = LocEntanglement4(transformed)
minus = kron(1/sqrt(2) * [1;-1],[1;0]);
clust = ClusterSweepNoise(2,minus,-0.1,-0.1);
ideal = ClusterMaker(3);
rho_no = clust*clust';
LE = LocEntanglement3(rho_no,3);
LE_ideal = LocEntanglement3(Clust,1);

outcomes_072 = zeros(3,1);
outcomes_072(1) = LocEntanglement3(transformed_072,1);
outcomes_072(2) = LocEntanglement3(transformed_072,2);
outcomes_072(3) = LocEntanglement3(transformed_072,3);

outcomes_100 = zeros(3,1);
outcomes_100(1) = LocEntanglement3(transformed_100,1);
outcomes_100(2) = LocEntanglement3(transformed_100,2);
outcomes_100(3) = LocEntanglement3(transformed_100,3);

dist_axis=[1,2];
out_axis_072 = [outcomes_072(1),outcomes_072(2)];
out_axis_100 = [outcomes_100(1),outcomes_100(2)];

% %lambdaE = (log(out_axis_100(1)/0.5))/-2; % Find entanglement length
% % lambdaE = 2.7; %100
% lambdaE=2.17; %072
% 
% lengths_3qb = zeros(1,13);
% % lengths_3qb(1) = 0.5*exp(-0.5/lambdaE)
% for x=1:13
%     lengths_3qb(x) = 0.5*exp(-x/lambdaE);
% end

%lambdaE = (log(out_axis_100(1)/0.5))/-2; % Find entanglement length
% lambdaE = 2.7; %100
lambdaE=2.74; %072

lengths_3qb = zeros(1,13);
No = 0.1984;
lengths_3qb(1) = No;
% lengths_3qb(1) = 0.5*exp(-0.5/lambdaE)
for x=1:12
    lengths_3qb(x+1) = No*exp(-x/lambdaE);
end

lambdaE_100=1.94; %072

lengths_3qb_100 = zeros(1,13);
No_100 = 0.2387;
lengths_3qb_100(1) = No_100;
% lengths_3qb(1) = 0.5*exp(-0.5/lambdaE)
for x=1:12
    lengths_3qb_100(x+1) = No_100*exp(-x/lambdaE_100);
end

figure;plot(real(dist_axis),real(out_axis_072),'b*-');
hold on;
plot(real(dist_axis), real(out_axis_100),'r*-');
hold on;
xaxlab = [1,2,3,4,5,6,7,8,9,10,11,12,13];
plot(xaxlab,lengths_3qb,'ro--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','blue');
hold on;
plot(xaxlab,lengths_3qb_100,'yo--','LineWidth',2,'markersize',...
    10,'MarkerFaceColor','green');
title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 13 0 0.5]);
set(gca,'xtick',0:13);
set(gca,'FontSize',20);
grid minor;
legend(init_success_prob_072, init_success_prob_100);
hold on;

% xaxlab = [1,2,3,4,5,6];
% figure;plot(xaxlab,lengths_3qb,'ro--','LineWidth',2,'markersize',...
%     10,'MarkerFaceColor','blue');
% % axis([0.5 6 0 0.5]);
% title('Localisable Entanglement with Distance', 'FontSize', 30);
% xlabel('Distance Between Qubits', 'FontSize',26);
% ylabel('Negativity', 'FontSize',26);
% set(gca,'xtick',0:13);
% set(gca,'FontSize',20);
% grid minor;