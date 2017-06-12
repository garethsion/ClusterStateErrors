function cluster_noise = ClusterNoise(int, init_state)
    % CLUSTER - Generates an N dimensional cluster state, following Linder
    % and Rudolph technique
    % Usage: cstate = Cluster(no_of_photons, initial_state) 
    
    sigmaX = [0,1;1,0];
    sigmaZ = [1,0;0,-1];
    initial_state = init_state;
    %G = 1/sqrt(2)*[0.98,0.98i;0.92i,0.5] %+ -5*1/sqrt(2)*[1,1i;1i,1] %+ 7.86*sigmaZ;
    %G = 1/sqrt(2)*[1,1i;1i,1] + 6.41*sigmaX + 8.86*sigmaZ;
    %G = 1/sqrt(2)*[1,1i;1i,1] + 0*sigmaX + 0*sigmaZ;
    G = 1/sqrt(2)*[1,1i;1i,1] + [-0.1, -0.54;-0.365,-0.4]  ; % Unitary evolution of state 
    CNOT = cnot();

    no_of_qubits = int;

    for n=1:no_of_qubits
        if n == 1
            CNOT=blkdiag(eye(2),sigmaX);
            cycle = kron(G, eye(2^n))*CNOT*initial_state;
        else
            for nn=1:2^(n-2)
                CNOT = blkdiag(eye(2),CNOT,sigmaX);
            end
            space = kron(cycle,[1;0]);
            cycle = kron(G, eye(2^n))*CNOT*space;
        end
    end
    cluster_noise = cycle;
end