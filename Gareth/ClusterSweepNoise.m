function cycle = ClusterSweepNoise(int, init_state, ev1, ev2)
    % ClusterSweepNoise - Determines the ket of the cluster state with a
    % given degree of rotation error on X and Z.
    % USAGE: ClusterSweepError(no# photons, initial_state, 
    %        error bound X (-0.1 to 0.1), error bound Z (-0.1 to 0.1).
    
    sigmaX = [0,1;1,0];
    sigmaZ = [1,0;0,-1];
    initial_state = init_state;
   
    CNOT = cnot();
    no_of_qubits = int;
    G = zeros(22,22);

    iterator = 0.02; 
    eps_lower = -0.1; 
    eps_upper = 0.1; 
    theta = -pi/4;

    % Iterate over sweeping error values for the unitary matrix G.
    % Epsilon1 is error on sigmaX, and epsilon2 is error on sigmaZ.
    for epsilon1 =eps_lower:iterator:eps_upper
        % Establish a counter so that we can index a G array for varying
        % values of epsilon
        e1_tick1 = int8(((eps_lower-(epsilon1+iterator))*-100)-1);
        e1_tick2 = int8((eps_lower-(epsilon1+iterator))*-100);
        
        for epsilon2=eps_lower:iterator:eps_upper
            % As above, for indexing
            e2_tick1 = int8(((eps_lower-(epsilon2+iterator))*-100)-1);
            e2_tick2 = int8((eps_lower-(epsilon2+iterator))*-100);   
            % Apply error to G
            G(e1_tick1:e1_tick2,e2_tick1:e2_tick2) =...
                expm(-1i*(theta/2)*sigmaX);% +...
                %expm(-1i*(theta/2)*sigmaX) +...
                %expm(-1i*(theta/2)*sigmaZ);
%             G(e1_tick1:e1_tick2,e2_tick1:e2_tick2) = 1/sqrt(2)*[1,1i;1i,1]...
%                 +epsilon1*sigmaX + epsilon2*sigmaZ;
        end
    end
    % This allows us to index also, based on the error boundary values. The
    % type-casting int8(...) is just to supress a warning message, since
    % sometimes the output is floating zeros e.g. 1.0000
    ev1_1 = int8(((eps_lower-(ev1+iterator))*-100)-1);
    ev1_2 = int8((eps_lower-(ev1+iterator))*-100);
    
    ev2_1 = int8(((eps_lower-(ev2+iterator))*-100)-1);
    ev2_2 = int8((eps_lower-(ev2+iterator))*-100);
    
    for n=1:no_of_qubits
        if n == 1
            CNOT=blkdiag(eye(2),sigmaX);
            % Form cycle ket with errors
            cycle = kron(G(ev1_1:ev1_2 , ev2_1:ev2_2)/1.1,...
                eye(2^n))*CNOT*initial_state;
        else
            for nn=1:2^(n-2)
                CNOT = blkdiag(eye(2),CNOT,sigmaX);
            end
            space = kron(cycle,[1;0]);
            cycle= kron(G(ev1_1:ev1_2 , ev2_1:ev2_2)/1.1, eye(2^n))*CNOT*space;
        end
    end