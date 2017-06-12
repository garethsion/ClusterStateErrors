minus = kron(1/sqrt(2) * [1;-1],[1;0]);
ideal_cluster = Cluster(3,minus);

fid_table = zeros(1,22);

eps_lower = -0.1;
eps_upper = 0.1;
iterator = 0.02;

noisy_cluster = ClusterSweepNoise(3,minus,-0.1,-0.1);
rho_ideal = ideal_cluster*ideal_cluster';
rho_noisy = noisy_cluster*noisy_cluster';

fidel = Fidelity(rho_ideal,rho_noisy);
for x=-0.1:iterator:0.1
    noisy_cluster = ClusterSweepNoise(3,minus,x,x);
    rho_ideal = ideal_cluster*ideal_cluster';
    rho_noisy = noisy_cluster*noisy_cluster';

    counter = int8(((eps_lower-(x+iterator))*-100)-1);
    fid_table(counter) = Fidelity(rho_ideal,rho_noisy);
end
    