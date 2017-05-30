function locent = LocEntanglement(rho, num, m, n)
    % LocEntanglement - calculates the localisable entanglement between two
    % qubits of a cluster state.
    % At the moment, this will only work for a three qubit cluster state. I
    % need to generalise it. 
    % inputs:   rho - cluster state density matrix
    %           num - number of qubits in cluster state
    %           m - first qubit to keep entangled in cluster
    %           n - last qubit to keep entangled in cluster. All other
    %               qubits will be projectively measured.
    
    if num>6
        error('Program cannot handle this many qubits. Pleas choose 6 or less.');
    end
    
    if m>num || n>num
        error('The position of the qubit for which to measure entanglement must be at an integer position less than the number of physical qubits')
    end
    
    if m==n
        error('You cannot measure the same qubit twice')
    end
    % Choose a basis for projective measurements. Here, Z is chosen. 
    zero = [1;0];
    one = [0;1];
    I=eye(2);
    %rho = Cluster_State*Cluster_State';
    % Extend Hilbert space depending on size of input density matrix
%     space = zeros(length(rho)/2);
%     space(1) = 1;
    
    % The projector for our measurement is Pj=|0><0|
    %Pj = zeros(size(rho));    
    %Pj = kron(kron(zero*zero',I),I);
    
    if num==3
        Pj_zero = kron(kron(zero*zero',I),I);
        Pj_one = kron(kron(one*one',I),I);
    elseif num==4
        if m==3 && n==4
            Pj = kron(kron(zero*zero',zero*zero'),kron(I,I));
        elseif m==2 && n==4
            Pj = kron(kron(zero*zero',I),kron(I,zero*zero'));
        else m==2 && n==3
            Pj = kron(kron(I,I),kron(zero*zero',I));
        end
    elseif num==5
        if m==2 && n==3
            Pj = kron(kron(kron(zero*zero',I),kron(I,zero*zero')),zero*zero');
        elseif m==2 && n==4
            Pj = kron(kron(kron(zero*zero',I),kron(zero*zero',I')),I);
        elseif m==2 && n==5
            Pj = kron(kron(kron(zero*zero',I),kron(zero*zero',zero*zero')),I);
        elseif m==3 && n==4
            Pj = kron(kron(kron(zero*zero',zero*zero'),kron(I,I)),zero*zero');
        elseif m==3 && n==5
            Pj = kron(kron(kron(zero*zero',zero*zero'),kron(I,zero*zero')),I);
        else m==4 && n==5
            Pj = kron(kron(kron(zero*zero',zero*zero'),kron(zero*zero',I)),I);
        end
    end
    
    % Ps is the probability of obtaining the measurement outcom s for a
    % given measurement basis.
    pjcluster_zero = Pj_zero*rho;
    Ps_zero = trace(pjcluster_zero);
    pjcluster_one = Pj_one*rho;
    Ps_one = trace(pjcluster_one);
    
    %figure;bar3(real(pjcluster));hold on; bar3(imag(pjcluster));

    %rho_reduced = (1/Ps) * trace(pjcluster)
    rho_reduced_zero = (1/Ps_zero) * PartialTrace(pjcluster_zero,2,length(rho),-1);
    rho_reduced_one = (1/Ps_one) * PartialTrace(pjcluster_one,2,length(rho),-1);
    %rho_reduced = (1/Ps) * ptrace(pjcluster, [1 2]);
    figure;bar3(real(rho_reduced_zero));hold on; bar3(imag(rho_reduced_zero));
    locent = max(Negativity(rho_reduced_zero,length(rho_reduced_zero)),Negativity(rho_reduced_one,length(rho_reduced_one)));
end