function loc5 = LocEntanglement5(rho,m,n)
    
    if m>n
        error('m must be smaller than n')
    end
    
    zero = [1;0];
    one = [0;1];
    I=eye(2);

    %%% STATE MEASUREMENT BASES FOR PROJECTORS %%%%%
    Px0 = (1/2)*[1,1;1,1]; 
    Px1 = (1/2)*[1,-1;-1,1];  % X basis
    Py0=(1/2)*[1, -1i; 1i, 1]; 
    Py1=(1/2)*[1, 1i; -1i, 1]; % Y basis
    Pz0 = zero*zero'; Pz1 = one*one'; % Z basis
  
    % Build measurement basis space for qubits
    if m==1 && n==2
        Px_000 = kron(kron(kron(kron(I,I),Px0),Px0),Px0);
        Px_001 = kron(kron(kron(kron(I,I),Px0),Px0),Px1);
        Px_010 = kron(kron(kron(kron(I,I),Px0),Px1),Px0);
        Px_011 = kron(kron(kron(kron(I,I),Px0),Px1),Px1);
        Px_100 = kron(kron(kron(kron(I,I),Px1),Px0),Px0);
        Px_101 = kron(kron(kron(kron(I,I),Px1),Px0),Px1);
        Px_110 = kron(kron(kron(kron(I,I),Px1),Px1),Px0);
        Px_111 = kron(kron(kron(kron(I,I),Px1),Px1),Px1);
    
        Py_000 = kron(kron(kron(kron(I,I),Py0),Py0),Py0);
        Py_001 = kron(kron(kron(kron(I,I),Py0),Py0),Py1);
        Py_010 = kron(kron(kron(kron(I,I),Py0),Py1),Py0);
        Py_011 = kron(kron(kron(kron(I,I),Py0),Py1),Py1);
        Py_100 = kron(kron(kron(kron(I,I),Py1),Py0),Py0);
        Py_101 = kron(kron(kron(kron(I,I),Py1),Py0),Py1);
        Py_110 = kron(kron(kron(kron(I,I),Py1),Py1),Py0);
        Py_111 = kron(kron(kron(kron(I,I),Py1),Py1),Py1);
        
        Pz_000 = kron(kron(kron(kron(I,I),Pz0),Pz0),Pz0);
        Pz_001 = kron(kron(kron(kron(I,I),Pz0),Pz0),Pz1);
        Pz_010 = kron(kron(kron(kron(I,I),Pz0),Pz1),Pz0);
        Pz_011 = kron(kron(kron(kron(I,I),Pz0),Pz1),Pz1);
        Pz_100 = kron(kron(kron(kron(I,I),Pz1),Pz0),Pz0);
        Pz_101 = kron(kron(kron(kron(I,I),Pz1),Pz0),Pz1);
        Pz_110 = kron(kron(kron(kron(I,I),Pz1),Pz1),Pz0);
        Pz_111 = kron(kron(kron(kron(I,I),Pz1),Pz1),Pz1);
        
        m2=3; n2=4; o2=5;
    
    elseif m==1 && n==3
        Px_000 = kron(kron(kron(kron(I,Px0),I),Px0),Px0);
        Px_001 = kron(kron(kron(kron(I,Px0),I),Px0),Px1);
        Px_010 = kron(kron(kron(kron(I,Px0),I),Px1),Px0);
        Px_011 = kron(kron(kron(kron(I,Px0),I),Px1),Px1);
        Px_100 = kron(kron(kron(kron(I,Px1),I),Px0),Px0);
        Px_101 = kron(kron(kron(kron(I,Px1),I),Px0),Px1);
        Px_110 = kron(kron(kron(kron(I,Px1),I),Px1),Px0);
        Px_111 = kron(kron(kron(kron(I,Px1),I),Px1),Px1);
        
        Py_000 = kron(kron(kron(kron(I,Py0),I),Py0),Py0);
        Py_001 = kron(kron(kron(kron(I,Py0),I),Py0),Py1);
        Py_010 = kron(kron(kron(kron(I,Py0),I),Py1),Py0);
        Py_011 = kron(kron(kron(kron(I,Py0),I),Py1),Py1);
        Py_100 = kron(kron(kron(kron(I,Py1),I),Py0),Py0);
        Py_101 = kron(kron(kron(kron(I,Py1),I),Py0),Py1);
        Py_110 = kron(kron(kron(kron(I,Py1),I),Py1),Py0);
        Py_111 = kron(kron(kron(kron(I,Py1),I),Py1),Py1);
        
        Pz_000 = kron(kron(kron(kron(I,Pz0),I),Pz0),Pz0);
        Pz_001 = kron(kron(kron(kron(I,Pz0),I),Pz0),Pz1);
        Pz_010 = kron(kron(kron(kron(I,Pz0),I),Pz1),Pz0);
        Pz_011 = kron(kron(kron(kron(I,Pz0),I),Pz1),Pz1);
        Pz_100 = kron(kron(kron(kron(I,Pz1),I),Pz0),Pz0);
        Pz_101 = kron(kron(kron(kron(I,Pz1),I),Pz0),Pz1);
        Pz_110 = kron(kron(kron(kron(I,Pz1),I),Pz1),Pz0);
        Pz_111 = kron(kron(kron(kron(I,Pz1),I),Pz1),Pz1);
        
        m2=2; n2=4; o2=5;
    elseif m==1 && n==4
        Px_000 = kron(kron(kron(kron(I,Px0),Px0),I),Px0);
        Px_001 = kron(kron(kron(kron(I,Px0),Px0),I),Px1);
        Px_010 = kron(kron(kron(kron(I,Px0),Px1),I),Px0);
        Px_011 = kron(kron(kron(kron(I,Px0),Px1),I),Px1);
        Px_100 = kron(kron(kron(kron(I,Px1),Px0),I),Px0);
        Px_101 = kron(kron(kron(kron(I,Px1),Px0),I),Px1);
        Px_110 = kron(kron(kron(kron(I,Px1),Px1),I),Px0);
        Px_111 = kron(kron(kron(kron(I,Px1),Px1),I),Px1);
    
        Py_000 = kron(kron(kron(kron(I,Py0),Py0),I),Py0);
        Py_001 = kron(kron(kron(kron(I,Py0),Py0),I),Py1);
        Py_010 = kron(kron(kron(kron(I,Py0),Py1),I),Py0);
        Py_011 = kron(kron(kron(kron(I,Py0),Py1),I),Py1);
        Py_100 = kron(kron(kron(kron(I,Py1),Py0),I),Py0);
        Py_101 = kron(kron(kron(kron(I,Py1),Py0),I),Py1);
        Py_110 = kron(kron(kron(kron(I,Py1),Py1),I),Py0);
        Py_111 = kron(kron(kron(kron(I,Py1),Py1),I),Py1);
        
        Pz_000 = kron(kron(kron(kron(I,Pz0),Pz0),I),Pz0);
        Pz_001 = kron(kron(kron(kron(I,Pz0),Pz0),I),Pz1);
        Pz_010 = kron(kron(kron(kron(I,Pz0),Pz1),I),Pz0);
        Pz_011 = kron(kron(kron(kron(I,Pz0),Pz1),I),Pz1);
        Pz_100 = kron(kron(kron(kron(I,Pz1),Pz0),I),Pz0);
        Pz_101 = kron(kron(kron(kron(I,Pz1),Pz0),I),Pz1);
        Pz_110 = kron(kron(kron(kron(I,Pz1),Pz1),I),Pz0);
        Pz_111 = kron(kron(kron(kron(I,Pz1),Pz1),I),Pz1);
        
        m2=2; n2=3; o2=5;
        
    elseif m==1 && n==5
        Px_000 = kron(kron(kron(kron(I,Px0),Px0),Px0),I);
        Px_001 = kron(kron(kron(kron(I,Px0),Px0),Px1),I);
        Px_010 = kron(kron(kron(kron(I,Px0),Px1),Px0),I);
        Px_011 = kron(kron(kron(kron(I,Px0),Px1),Px1),I);
        Px_100 = kron(kron(kron(kron(I,Px1),Px0),Px0),I);
        Px_101 = kron(kron(kron(kron(I,Px1),Px0),Px1),I);
        Px_110 = kron(kron(kron(kron(I,Px1),Px1),Px0),I);
        Px_111 = kron(kron(kron(kron(I,Px1),Px1),Px1),I);
        
        Py_000 = kron(kron(kron(kron(I,Py0),Py0),Py0),I);
        Py_001 = kron(kron(kron(kron(I,Py0),Py0),Py1),I);
        Py_010 = kron(kron(kron(kron(I,Py0),Py1),Py0),I);
        Py_011 = kron(kron(kron(kron(I,Py0),Py1),Py1),I);
        Py_100 = kron(kron(kron(kron(I,Py1),Py0),Py0),I);
        Py_101 = kron(kron(kron(kron(I,Py1),Py0),Py1),I);
        Py_110 = kron(kron(kron(kron(I,Py1),Py1),Py0),I);
        Py_111 = kron(kron(kron(kron(I,Py1),Py1),Py1),I);
       
        Pz_000 = kron(kron(kron(kron(I,Pz0),Pz0),Pz0),I);
        Pz_001 = kron(kron(kron(kron(I,Pz0),Pz0),Pz1),I);
        Pz_010 = kron(kron(kron(kron(I,Pz0),Pz1),Pz0),I);
        Pz_011 = kron(kron(kron(kron(I,Pz0),Pz1),Pz1),I);
        Pz_100 = kron(kron(kron(kron(I,Pz1),Pz0),Pz0),I);
        Pz_101 = kron(kron(kron(kron(I,Pz1),Pz0),Pz1),I);
        Pz_110 = kron(kron(kron(kron(I,Pz1),Pz1),Pz0),I);
        Pz_111 = kron(kron(kron(kron(I,Pz1),Pz1),Pz1),I);
    
        m2=2; n2=3; o2=4;
    elseif m==2 && n==3        
        Px_000 = kron(kron(kron(kron(Px0,I),I),Px0),Px0);
        Px_001 = kron(kron(kron(kron(Px0,I),I),Px0),Px1);
        Px_010 = kron(kron(kron(kron(Px0,I),I),Px1),Px0);
        Px_011 = kron(kron(kron(kron(Px0,I),I),Px1),Px1);
        Px_100 = kron(kron(kron(kron(Px1,I),I),Px0),Px0);
        Px_101 = kron(kron(kron(kron(Px1,I),I),Px0),Px1);
        Px_110 = kron(kron(kron(kron(Px1,I),I),Px1),Px0);
        Px_111 = kron(kron(kron(kron(Px1,I),I),Px1),Px1);
        
        Py_000 = kron(kron(kron(kron(Py0,I),I),Py0),Py0);
        Py_001 = kron(kron(kron(kron(Py0,I),I),Py0),Py1);
        Py_010 = kron(kron(kron(kron(Py0,I),I),Py1),Py0);
        Py_011 = kron(kron(kron(kron(Py0,I),I),Py1),Py1);
        Py_100 = kron(kron(kron(kron(Py1,I),I),Py0),Py0);
        Py_101 = kron(kron(kron(kron(Py1,I),I),Py0),Py1);
        Py_110 = kron(kron(kron(kron(Py1,I),I),Py1),Py0);
        Py_111 = kron(kron(kron(kron(Py1,I),I),Py1),Py1);
        
        Pz_000 = kron(kron(kron(kron(Pz0,I),I),Pz0),Pz0);
        Pz_001 = kron(kron(kron(kron(Pz0,I),I),Pz0),Pz1);
        Pz_010 = kron(kron(kron(kron(Pz0,I),I),Pz1),Pz0);
        Pz_011 = kron(kron(kron(kron(Pz0,I),I),Pz1),Pz1);
        Pz_100 = kron(kron(kron(kron(Pz1,I),I),Pz0),Pz0);
        Pz_101 = kron(kron(kron(kron(Pz1,I),I),Pz0),Pz1);
        Pz_110 = kron(kron(kron(kron(Pz1,I),I),Pz1),Pz0);
        Pz_111 = kron(kron(kron(kron(Pz1,I),I),Pz1),Pz1);
        
        m2=1; n2=4; o2=5;
        
    elseif m==2 && n==4        
        Px_000 = kron(kron(kron(kron(Px0,I),Px0),I),Px0);
        Px_001 = kron(kron(kron(kron(Px0,I),Px0),I),Px1);
        Px_010 = kron(kron(kron(kron(Px0,I),Px1),I),Px0);
        Px_011 = kron(kron(kron(kron(Px0,I),Px1),I),Px1);
        Px_100 = kron(kron(kron(kron(Px1,I),Px0),I),Px0);
        Px_101 = kron(kron(kron(kron(Px1,I),Px0),I),Px1);
        Px_110 = kron(kron(kron(kron(Px1,I),Px1),I),Px0);
        Px_111 = kron(kron(kron(kron(Px1,I),Px1),I),Px1);
        
        Py_000 = kron(kron(kron(kron(Py0,I),Py0),I),Py0);
        Py_001 = kron(kron(kron(kron(Py0,I),Py0),I),Py1);
        Py_010 = kron(kron(kron(kron(Py0,I),Py1),I),Py0);
        Py_011 = kron(kron(kron(kron(Py0,I),Py1),I),Py1);
        Py_100 = kron(kron(kron(kron(Py1,I),Py0),I),Py0);
        Py_101 = kron(kron(kron(kron(Py1,I),Py0),I),Py1);
        Py_110 = kron(kron(kron(kron(Py1,I),Py1),I),Py0);
        Py_111 = kron(kron(kron(kron(Py1,I),Py1),I),Py1);
        
        Pz_000 = kron(kron(kron(kron(Pz0,I),Pz0),I),Pz0);
        Pz_001 = kron(kron(kron(kron(Pz0,I),Pz0),I),Pz1);
        Pz_010 = kron(kron(kron(kron(Pz0,I),Pz1),I),Pz0);
        Pz_011 = kron(kron(kron(kron(Pz0,I),Pz1),I),Pz1);
        Pz_100 = kron(kron(kron(kron(Pz1,I),Pz0),I),Pz0);
        Pz_101 = kron(kron(kron(kron(Pz1,I),Pz0),I),Pz1);
        Pz_110 = kron(kron(kron(kron(Pz1,I),Pz1),I),Pz0);
        Pz_111 = kron(kron(kron(kron(Pz1,I),Pz1),I),Pz1);
        
        m2=1; n2=3; o2=5;
        
    elseif m==2 && n==5        
        Px_000 = kron(kron(kron(kron(Px0,I),Px0),Px0),I);
        Px_001 = kron(kron(kron(kron(Px0,I),Px0),Px1),I);
        Px_010 = kron(kron(kron(kron(Px0,I),Px1),Px0),I);
        Px_011 = kron(kron(kron(kron(Px0,I),Px1),Px1),I);
        Px_100 = kron(kron(kron(kron(Px1,I),Px0),Px0),I);
        Px_101 = kron(kron(kron(kron(Px1,I),Px0),Px1),I);
        Px_110 = kron(kron(kron(kron(Px1,I),Px1),Px0),I);
        Px_111 = kron(kron(kron(kron(Px1,I),Px1),Px1),I);
        
        Py_000 = kron(kron(kron(kron(Py0,I),Py0),Py0),I);
        Py_001 = kron(kron(kron(kron(Py0,I),Py0),Py1),I);
        Py_010 = kron(kron(kron(kron(Py0,I),Py1),Py0),I);
        Py_011 = kron(kron(kron(kron(Py0,I),Py1),Py1),I);
        Py_100 = kron(kron(kron(kron(Py1,I),Py0),Py0),I);
        Py_101 = kron(kron(kron(kron(Py1,I),Py0),Py1),I);
        Py_110 = kron(kron(kron(kron(Py1,I),Py1),Py0),I);
        Py_111 = kron(kron(kron(kron(Py1,I),Py1),Py1),I);
        
        Pz_000 = kron(kron(kron(kron(Pz0,I),Pz0),Pz0),I);
        Pz_001 = kron(kron(kron(kron(Pz0,I),Pz0),Pz1),I);
        Pz_010 = kron(kron(kron(kron(Pz0,I),Pz1),Pz0),I);
        Pz_011 = kron(kron(kron(kron(Pz0,I),Pz1),Pz1),I);
        Pz_100 = kron(kron(kron(kron(Pz1,I),Pz0),Pz0),I);
        Pz_101 = kron(kron(kron(kron(Pz1,I),Pz0),Pz1),I);
        Pz_110 = kron(kron(kron(kron(Pz1,I),Pz1),Pz0),I);
        Pz_111 = kron(kron(kron(kron(Pz1,I),Pz1),Pz1),I);
        
        m2=1; n2=3; o2=4;
    elseif m==3 && n==4
        Px_000 = kron(kron(kron(kron(Px0,Px0),I),I),Px0);
        Px_001 = kron(kron(kron(kron(Px0,Px0),I),I),Px1);
        Px_010 = kron(kron(kron(kron(Px0,Px1),I),I),Px0);
        Px_011 = kron(kron(kron(kron(Px0,Px1),I),I),Px1);
        Px_100 = kron(kron(kron(kron(Px1,Px0),I),I),Px0);
        Px_101 = kron(kron(kron(kron(Px1,Px0),I),I),Px1);
        Px_110 = kron(kron(kron(kron(Px1,Px1),I),I),Px0);
        Px_111 = kron(kron(kron(kron(Px1,Px1),I),I),Px1);
        
        Py_000 = kron(kron(kron(kron(Py0,Py0),I),I),Py0);
        Py_001 = kron(kron(kron(kron(Py0,Py0),I),I),Py1);
        Py_010 = kron(kron(kron(kron(Py0,Py1),I),I),Py0);
        Py_011 = kron(kron(kron(kron(Py0,Py1),I),I),Py1);
        Py_100 = kron(kron(kron(kron(Py1,Py0),I),I),Py0);
        Py_101 = kron(kron(kron(kron(Py1,Py0),I),I),Py1);
        Py_110 = kron(kron(kron(kron(Py1,Py1),I),I),Py0);
        Py_111 = kron(kron(kron(kron(Py1,Py1),I),I),Py1);
        
        Pz_000 = kron(kron(kron(kron(Pz0,Pz0),I),I),Pz0);
        Pz_001 = kron(kron(kron(kron(Pz0,Pz0),I),I),Pz1);
        Pz_010 = kron(kron(kron(kron(Pz0,Pz1),I),I),Pz0);
        Pz_011 = kron(kron(kron(kron(Pz0,Pz1),I),I),Pz1);
        Pz_100 = kron(kron(kron(kron(Pz1,Pz0),I),I),Pz0);
        Pz_101 = kron(kron(kron(kron(Pz1,Pz0),I),I),Pz1);
        Pz_110 = kron(kron(kron(kron(Pz1,Pz1),I),I),Pz0);
        Pz_111 = kron(kron(kron(kron(Pz1,Pz1),I),I),Pz1);
        m2=1; n2=2; o2=5;
        
    elseif m==3 && n==5
        Px_000 = kron(kron(kron(kron(Px0,Px0),I),Px0),I);
        Px_001 = kron(kron(kron(kron(Px0,Px0),I),Px1),I);
        Px_010 = kron(kron(kron(kron(Px0,Px1),I),Px0),I);
        Px_011 = kron(kron(kron(kron(Px0,Px1),I),Px1),I);
        Px_100 = kron(kron(kron(kron(Px1,Px0),I),Px0),I);
        Px_101 = kron(kron(kron(kron(Px1,Px0),I),Px1),I);
        Px_110 = kron(kron(kron(kron(Px1,Px1),I),Px0),I);
        Px_111 = kron(kron(kron(kron(Px1,Px1),I),Px1),I);
        
        Py_000 = kron(kron(kron(kron(Py0,Py0),I),Py0),I);
        Py_001 = kron(kron(kron(kron(Py0,Py0),I),Py1),I);
        Py_010 = kron(kron(kron(kron(Py0,Py1),I),Py0),I);
        Py_011 = kron(kron(kron(kron(Py0,Py1),I),Py1),I);
        Py_100 = kron(kron(kron(kron(Py1,Py0),I),Py0),I);
        Py_101 = kron(kron(kron(kron(Py1,Py0),I),Py1),I);
        Py_110 = kron(kron(kron(kron(Py1,Py1),I),Py0),I);
        Py_111 = kron(kron(kron(kron(Py1,Py1),I),Py1),I);
        
        Pz_000 = kron(kron(kron(kron(Pz0,Pz0),I),Pz0),I);
        Pz_001 = kron(kron(kron(kron(Pz0,Pz0),I),Pz1),I);
        Pz_010 = kron(kron(kron(kron(Pz0,Pz1),I),Pz0),I);
        Pz_011 = kron(kron(kron(kron(Pz0,Pz1),I),Pz1),I);
        Pz_100 = kron(kron(kron(kron(Pz1,Pz0),I),Pz0),I);
        Pz_101 = kron(kron(kron(kron(Pz1,Pz0),I),Pz1),I);
        Pz_110 = kron(kron(kron(kron(Pz1,Pz1),I),Pz0),I);
        Pz_111 = kron(kron(kron(kron(Pz1,Pz1),I),Pz1),I);
        
        m2=1; n2=2; o2=4;
    elseif m==4 && n==5
        Px_000 = kron(kron(kron(kron(Px0,Px0),Px0),I),I);
        Px_001 = kron(kron(kron(kron(Px0,Px0),Px1),I),I);
        Px_010 = kron(kron(kron(kron(Px0,Px1),Px0),I),I);
        Px_011 = kron(kron(kron(kron(Px0,Px1),Px1),I),I);
        Px_100 = kron(kron(kron(kron(Px1,Px0),Px0),I),I);
        Px_101 = kron(kron(kron(kron(Px1,Px0),Px1),I),I);
        Px_110 = kron(kron(kron(kron(Px1,Px1),Px0),I),I);
        Px_111 = kron(kron(kron(kron(Px1,Px1),Px0),I),I);
        
        Py_000 = kron(kron(kron(kron(Py0,Py0),Py0),I),I);
        Py_001 = kron(kron(kron(kron(Py0,Py0),Py1),I),I);
        Py_010 = kron(kron(kron(kron(Py0,Py1),Py0),I),I);
        Py_011 = kron(kron(kron(kron(Py0,Py1),Py1),I),I);
        Py_100 = kron(kron(kron(kron(Py1,Py0),Py0),I),I);
        Py_101 = kron(kron(kron(kron(Py1,Py0),Py1),I),I);
        Py_110 = kron(kron(kron(kron(Py1,Py1),Py0),I),I);
        Py_111 = kron(kron(kron(kron(Py1,Py1),Py0),I),I);
        
        Pz_000 = kron(kron(kron(kron(Pz0,Pz0),Pz0),I),I);
        Pz_001 = kron(kron(kron(kron(Pz0,Pz0),Pz1),I),I);
        Pz_010 = kron(kron(kron(kron(Pz0,Pz1),Pz0),I),I);
        Pz_011 = kron(kron(kron(kron(Pz0,Pz1),Pz1),I),I);
        Pz_100 = kron(kron(kron(kron(Pz1,Pz0),Pz0),I),I);
        Pz_101 = kron(kron(kron(kron(Pz1,Pz0),Pz1),I),I);
        Pz_110 = kron(kron(kron(kron(Pz1,Pz1),Pz0),I),I);
        Pz_111 = kron(kron(kron(kron(Pz1,Pz1),Pz0),I),I);
        
        m2=1; n2=2; o2=3;
    end
    
    % Determine probability of measurement outcome for given basis 
    Ps_x000 = trace(Px_000*rho);    
    Ps_x001 = trace(Px_001*rho);
    Ps_x010 = trace(Px_010*rho);
    Ps_x011 = trace(Px_011*rho);
    Ps_x100 = trace(Px_100*rho);
    Ps_x101 = trace(Px_101*rho);
    Ps_x110 = trace(Px_110*rho);
    Ps_x111 = trace(Px_111*rho);
    
    Ps_y000 = trace(Py_000*rho);    
    Ps_y001 = trace(Py_001*rho);
    Ps_y010 = trace(Py_010*rho);
    Ps_y011 = trace(Py_011*rho);
    Ps_y100 = trace(Py_100*rho);
    Ps_y101 = trace(Py_101*rho);
    Ps_y110 = trace(Py_110*rho);
    Ps_y111 = trace(Py_111*rho);
    
    Ps_z000 = trace(Pz_000*rho);    
    Ps_z001 = trace(Pz_001*rho);
    Ps_z010 = trace(Pz_010*rho);
    Ps_z011 = trace(Pz_011*rho);
    Ps_z100 = trace(Pz_100*rho);
    Ps_z101 = trace(Pz_101*rho);
    Ps_z110 = trace(Pz_110*rho);
    Ps_z111 = trace(Pz_111*rho);
    
    % Find reduced density matrices for each basis
    rho_reduced_x000 = (1/Ps_x000) * PartialTrace((Px_000)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x001 = (1/Ps_x001) * PartialTrace((Px_001)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x010 = (1/Ps_x010) * PartialTrace((Px_010)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x011 = (1/Ps_x011) * PartialTrace((Px_011)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x100 = (1/Ps_x100) * PartialTrace((Px_100)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x101 = (1/Ps_x101) * PartialTrace((Px_101)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x110 = (1/Ps_x110) * PartialTrace((Px_110)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_x111 = (1/Ps_x111) * PartialTrace((Px_111)*rho,[m2,n2,o2],[2,2,2,2,2]);
    
    rho_reduced_y000 = (1/Ps_y000) * PartialTrace((Py_000)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y001 = (1/Ps_y001) * PartialTrace((Py_001)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y010 = (1/Ps_y010) * PartialTrace((Py_010)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y011 = (1/Ps_y011) * PartialTrace((Py_011)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y100 = (1/Ps_y100) * PartialTrace((Py_100)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y101 = (1/Ps_y101) * PartialTrace((Py_101)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y110 = (1/Ps_y110) * PartialTrace((Py_110)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_y111 = (1/Ps_y111) * PartialTrace((Py_111)*rho,[m2,n2,o2],[2,2,2,2,2]);
    
    rho_reduced_z000 = (1/Ps_z000) * PartialTrace((Pz_000)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z001 = (1/Ps_z001) * PartialTrace((Pz_001)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z010 = (1/Ps_z010) * PartialTrace((Pz_010)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z011 = (1/Ps_z011) * PartialTrace((Pz_011)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z100 = (1/Ps_z100) * PartialTrace((Pz_100)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z101 = (1/Ps_z101) * PartialTrace((Pz_101)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z110 = (1/Ps_z110) * PartialTrace((Pz_110)*rho,[m2,n2,o2],[2,2,2,2,2]);
    rho_reduced_z111 = (1/Ps_z111) * PartialTrace((Pz_111)*rho,[m2,n2,o2],[2,2,2,2,2]);
    
% 	Negativity(rho_reduced_z010,[2,2])
    
    array = [Ps_x000*Negativity(rho_reduced_x000,[2,2]), Ps_x001*Negativity(rho_reduced_x001,[2,2]),...
        Ps_x010*Negativity(rho_reduced_x010,[2,2]), Ps_x011*Negativity(rho_reduced_x011,[2,2]),...
        Ps_x100*Negativity(rho_reduced_x100,[2,2]), Ps_x101*Negativity(rho_reduced_x101,[2,2]),...
        Ps_x110*Negativity(rho_reduced_x110,[2,2]), Ps_x111*Negativity(rho_reduced_x111,[2,2]);...
        Ps_y000*Negativity(rho_reduced_y000,[2,2]), Ps_y001*Negativity(rho_reduced_y001,[2,2]),...
        Ps_y010*Negativity(rho_reduced_y010,[2,2]), Ps_y011*Negativity(rho_reduced_y011,[2,2]),...
        Ps_y100*Negativity(rho_reduced_y100,[2,2]), Ps_y101*Negativity(rho_reduced_y101,[2,2]),...
        Ps_y110*Negativity(rho_reduced_y110,[2,2]), Ps_y111*Negativity(rho_reduced_y111,[2,2]);...
        Ps_z000*Negativity(rho_reduced_z000,[2,2]), Ps_z001*Negativity(rho_reduced_z001,[2,2]),...
        Ps_z010*Negativity(rho_reduced_z010,[2,2]), Ps_z011*Negativity(rho_reduced_z011,[2,2]),...
        Ps_z100*Negativity(rho_reduced_z100,[2,2]), Ps_z101*Negativity(rho_reduced_z101,[2,2]),...
        Ps_z110*Negativity(rho_reduced_z110,[2,2]), Ps_z111*Negativity(rho_reduced_z111,[2,2])];

    array2 = [sum(array(1,:)),sum(array(2,:)),sum(array(3,:))] ;

    loc5 = max(array2);
end

