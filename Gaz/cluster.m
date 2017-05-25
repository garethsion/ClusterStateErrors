Cluster = cstate(2);
rho_cluster = Cluster * Cluster';
figure;bar3(real(rho_cluster));hold on; bar3(imag(rho_cluster));