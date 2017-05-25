function cluster = Cluster(n)
    sigmaX = [0,1;1,0];
    sigmaY = [0,-1i;1i,0];
    sigmaZ = [1,0;0,-1];
    sigma0 = eye(2,2);

    X = 1/sqrt(2)*sigmaX;
    Y = 1/sqrt(2)*sigmaY;
    Z = 1/sqrt(2)*sigmaZ;
    I = 1/sqrt(2)*sigma0;

    plus = 1/sqrt(2) * [1;1];
    initial_state = kron(plus,[1;0]);
    %G = sigmaX.*-1i;
    G = 1/sqrt(2)*[1,1i;1i,1];
    CNOT = cnot();

    no_of_qubits = 4;

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
    rho_cycle = cycle*cycle';
    figure;bar3(real(rho_cycle));hold on; bar3(imag(rho_cycle));
end