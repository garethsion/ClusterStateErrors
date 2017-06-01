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
LE_ideal = LocEntanglement3(Clust,1);

outcomes_072 = zeros(3,1);
outcomes_072(1) = LocEntanglement3(transformed_072,1);
outcomes_072(2) = LocEntanglement3(transformed_072,2);
outcomes_072(3) = LocEntanglement3(transformed_072,3);

outcomes_100 = zeros(3,1);
outcomes_100(1) = LocEntanglement3(transformed_100,1);
outcomes_100(2) = LocEntanglement3(transformed_100,2);
outcomes_100(3) = LocEntanglement3(transformed_100,3);

% This forms a matrix of the LE for distance between qubits. Here, we have
% measure qubits 1 and 2, 1 and 3, and 1 and 4;
% outcomes_mis1 = zeros(1,3);
% for x=1:3
%     LE_noisy = LocEntanglement4(transformed,1,x+1);
%     outcomes_mis1(x) = LE_noisy;
% end
% 
% % Here, we have measure 2 and 3 and 2 and 4
% outcomes_mis2 = zeros(1,2);
% for x=1:2
%     LE_noisy = LocEntanglement4(transformed,2,x+2);
%     outcomes_mis2(x) = LE_noisy;
% end
% 
% % Here, we have measure 3 and 4
% outcomes_mis3=LocEntanglement4(transformed,3,4);
% 
% % Now, let's compare the distances from each instance:
% d1=[outcomes_mis1(1), outcomes_mis2(1), outcomes_mis3]; % d=1
% d2=[outcomes_mis1(2),outcomes_mis2(2),0];% d=2
% d3=[outcomes_mis1(3),0,0];% d=3
% 
% distances = [d1;d2;d3];
% d1_mean=mean(distances(1));
% d2_mean=mean(distances(2));
% d3_mean=mean(distances(3));
% 
% dist_means=[d1_mean,d2_mean,d3_mean];
% dist_axis = [1,2,3];
% (Inlude 'real' in plot to supress warning)

% dist
% dist_means = [
% out_axis=[outcomes(1),outcomes(1),outcomes(1)]

dist_axis=[1,2];
out_axis_072 = [outcomes_072(1),outcomes_072(2)];
out_axis_100 = [outcomes_100(1),outcomes_100(2)];

figure;plot(real(dist_axis),real(out_axis_072),'b*-');
hold on;
plot(real(dist_axis), real(out_axis_100),'r*-');

title('Localisable Entanglement with Distance', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 3 0 0.5]);
set(gca,'xtick',0:4);
set(gca,'FontSize',20);
grid minor;
legend(init_success_prob_072, init_success_prob_100)