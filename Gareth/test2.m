    zero = [1;0];
    I=eye(2);
    rho = Cluster_State*Cluster_State';
    % Extend Hilbert space depending on size of input density matrix
    space = zeros(length(rho)/2);
    space(1) = 1;
    
    m = 2;
    n = 3;
    % The projector for our measurement is Pj=|0><0|
    %Pj = zeros(size(rho));    
%     Pj = kron
    Pj = kron(kron(zero*zero',I),I);
    
    if num==3
        Pj = kron(kron(zero*zero',I),I);
    elseif num==4
        if m==3 && n==4
            Pj = kron(kron(zero*zero',zero*zero'),kron(I,I));
        elseif m==2 && n==4
            Pj = kron(kron(zero*zero',I),kron(I,zero*zero'));
        elseif m==2 && n==3
            Pj = kron(kron(I,I),kron(zero*zero',I));
        end
    end
    