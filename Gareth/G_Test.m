minus = kron(1/sqrt(2) * [1;-1],[1;0]);
clust_noise_G = ClusterNoise(3,minus);
rho_noise_G = clust_noise_G*clust_noise_G';

clust_ideal = Cluster(3,minus);
rho_ideal = clust_ideal*clust_ideal';

test_fid = Fidelity(rho_ideal, rho_noise_G);

LE_G = Negs2(rho_noise_G);
Elength_G= Elength(LE_G, 25);

dist_x_axis = [1,2,3];
Elength_4_axis = linspace(1,25,25);
figure;

plot(dist_x_axis,real(LE_G),'b-o','LineWidth',2); hold on;
plot(Elength_4_axis, real(Elength_G), 'b*--'); hold on;
grid minor;
title(['LE with Induced Noise - Fidelity = ', num2str(test_fid)], 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 25 0 0.5]); set(gca,'xtick',0:25);