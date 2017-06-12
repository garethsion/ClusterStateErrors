function loc4 = LocEntanglement4(rho,m,n)
    
    if m>n
        error('m must be smaller than n')
    end
    
    zero = [1;0];
    one = [0;1];
    I=eye(2);

    %%% STATE MEASUREMENT BASES FOR PROJECTORS %%%%%
    Px0 = (1/2)*[1,1;1,1]; Px1 = (1/2)*[1,-1;-1,1];  % X basis
    Py0=(1/2)*[1, -1i; 1i, 1]; Py1=(1/2)*[1, 1i; -1i, 1]; % Y basis
    Pz0 = zero*zero'; Pz1 = one*one'; % Z basis
  
    % Build measurement basis space for qubits
    if m==1 && n==2
        Px_00 = kron(kron(kron(Px0,Px0),I),I);Px_01 = kron(kron(kron(Px0,Px1),I),I);
        Px_10 = kron(kron(kron(Px1,Px0),I),I);Px_11 = kron(kron(kron(Px1,Px1),I),I);
    
        Py_00 = kron(kron(kron(Py0,Py0),I),I);Py_01 = kron(kron(kron(Py0,Py1),I),I);
        Py_10 = kron(kron(kron(Py1,Py0),I),I);Py_11 = kron(kron(kron(Py1,Py1),I),I);
    
        Pz_00 = kron(kron(kron(Pz0,Pz0),I),I);Pz_01 = kron(kron(kron(Pz0,Pz1),I),I);
        Pz_10 = kron(kron(kron(Pz1,Pz0),I),I);Pz_11 = kron(kron(kron(Pz1,Pz1),I),I);
    
    elseif m==1 && n==3
        Px_00 = kron(kron(kron(Px0,I),Px0),I);Px_01 = kron(kron(kron(Px0,I),Px1),I);
        Px_10 = kron(kron(kron(Px1,I),Px0),I);Px_11 = kron(kron(kron(Px1,I),Px1),I);
    
        Py_00 = kron(kron(kron(Py0,I),Py0),I);Py_01 = kron(kron(kron(Py0,I),Py1),I);
        Py_10 = kron(kron(kron(Py1,I),Py0),I);Py_11 = kron(kron(kron(Py1,I),Py1),I);
    
        Pz_00 = kron(kron(kron(Pz0,I),Pz0),I);Pz_01 = kron(kron(kron(Pz0,I),Pz1),I);
        Pz_10 = kron(kron(kron(Pz1,I),Pz0),I);Pz_11 = kron(kron(kron(Pz1,I),Pz1),I);

    elseif m==1 && n==4
        Px_00 = kron(kron(kron(Px0,I),I),Px0);Px_01 = kron(kron(kron(Px0,I),I),Px1);
        Px_10 = kron(kron(kron(Px1,I),I),Px0);Px_11 = kron(kron(kron(Px1,I),I),Px1);

        Py_00 = kron(kron(kron(Py0,I),I),Py0);Py_01 = kron(kron(kron(Py0,I),I),Py1);
        Py_10 = kron(kron(kron(Py1,I),I),Py0);Py_11 = kron(kron(kron(Py1,I),I),Py1);
    
        Pz_00 = kron(kron(kron(Pz0,I),I),Pz0);Pz_01 = kron(kron(kron(Pz0,I),I),Pz1);
        Pz_10 = kron(kron(kron(Pz1,I),I),Pz0);Pz_11 = kron(kron(kron(Pz1,I),I),Pz1);
    
    elseif m==2 && n==3
        Px_00 = kron(kron(kron(I,Px0),Px0),I);Px_01 = kron(kron(kron(I,Px0),Px1),I);
        Px_10 = kron(kron(kron(I,Px1),Px0),I);Px_11 = kron(kron(kron(I,Px1),Px1),I);
    
        Py_00 = kron(kron(kron(I,Py0),Py0),I);Py_01 = kron(kron(kron(I,Py0),Py1),I);
        Py_10 = kron(kron(kron(I,Py1),Py0),I);Py_11 = kron(kron(kron(I,Py1),Py1),I);
    
        Pz_00 = kron(kron(kron(I,Pz0),Pz0),I);Pz_01 = kron(kron(kron(I,Pz0),Pz1),I);
        Pz_10 = kron(kron(kron(I,Pz1),Pz0),I);Pz_11 = kron(kron(kron(I,Pz1),Pz1),I);

    elseif m==2 && n==4
        Px_00 = kron(kron(kron(I,Px0),I),Px0);Px_01 = kron(kron(kron(I,Px0),I),Px0);
        Px_10 = kron(kron(kron(I,Px1),I),Px0);Px_11 = kron(kron(kron(I,Px1),I),Px0);
    
        Py_00 = kron(kron(kron(I,Py0),I),Py0);Py_01 = kron(kron(kron(I,Py0),I),Py0);
        Py_10 = kron(kron(kron(I,Py1),I),Py0);Py_11 = kron(kron(kron(I,Py1),I),Py0);
    
        Pz_00 = kron(kron(kron(I,Pz0),I),Pz0);Pz_01 = kron(kron(kron(I,Pz0),I),Pz0);
        Pz_10 = kron(kron(kron(I,Pz1),I),Pz0);Pz_11 = kron(kron(kron(I,Pz1),I),Pz0);
    
    elseif m==3 && n==4
        Px_00 = kron(kron(kron(I,I),Px0),Px0);Px_01 = kron(kron(kron(I,I),Px0),Px1);
        Px_10 = kron(kron(kron(I,I),Px1),Px0);Px_11 = kron(kron(kron(I,I),Px1),Px1);
    
        Py_00 = kron(kron(kron(I,I),Py0),Py0);Py_01 = kron(kron(kron(I,I),Py0),Py1);
        Py_10 = kron(kron(kron(I,I),Py1),Py0);Py_11 = kron(kron(kron(I,I),Py1),Py1);
    
        Pz_00 = kron(kron(kron(I,I),Pz0),Pz0);Pz_01 = kron(kron(kron(I,I),Pz0),Pz1);
        Pz_10 = kron(kron(kron(I,I),Pz1),Pz0);Pz_11 = kron(kron(kron(I,I),Pz1),Pz1);
    end
    
    % Determine probability of measurement outcome for given basis 
    Ps_x00 = trace(Px_00*rho);    Ps_x01 = trace(Px_01*rho);
    Ps_x10 = trace(Px_10*rho);    Ps_x11 = trace(Px_11*rho);

    Ps_y00 = trace(Py_00*rho);    Ps_y01 = trace(Py_01*rho);
    Ps_y10 = trace(Py_10*rho);    Ps_y11 = trace(Py_11*rho);
    
    Ps_z00 = trace(Pz_00*rho);    Ps_z01 = trace(Pz_01*rho);
    Ps_z10 = trace(Pz_10*rho);    Ps_z11 = trace(Pz_11*rho);
    
    % Find reduced density matrices for each basis
    rho_reduced_x00 = (1/Ps_x00) * PartialTrace((Px_00)*rho,[m,n],[2,2,2,2]);
    rho_reduced_x01 = (1/Ps_x01) * PartialTrace((Px_01)*rho,[m,n],[2,2,2,2]);
    rho_reduced_x10 = (1/Ps_x10) * PartialTrace((Px_10)*rho,[m,n],[2,2,2,2]);
    rho_reduced_x11 = (1/Ps_x11) * PartialTrace((Px_11)*rho,[m,n],[2,2,2,2]);
    
    rho_reduced_y00 = (1/Ps_y00) * PartialTrace((Py_00)*rho,[m,n],[2,2,2,2]);
    rho_reduced_y01 = (1/Ps_y01) * PartialTrace((Py_01)*rho,[m,n],[2,2,2,2]);
    rho_reduced_y10 = (1/Ps_y01) * PartialTrace((Py_10)*rho,[m,n],[2,2,2,2]);
    rho_reduced_y11 = (1/Ps_y11) * PartialTrace((Py_11)*rho,[m,n],[2,2,2,2]);
    
    rho_reduced_z00 = (1/Ps_z00) * PartialTrace((Pz_00)*rho,[m,n],[2,2,2,2]);
    rho_reduced_z01 = (1/Ps_z01) * PartialTrace((Pz_01)*rho,[m,n],[2,2,2,2]);
    rho_reduced_z10 = (1/Ps_z10) * PartialTrace((Pz_10)*rho,[m,n],[2,2,2,2]);
    rho_reduced_z11 = (1/Ps_z11) * PartialTrace((Pz_11)*rho,[m,n],[2,2,2,2]);
    
    array = [Ps_x00*Negativity(rho_reduced_x00,[2,2]),Ps_x01*Negativity(rho_reduced_x01,[2,2]),... 
        Ps_x10*Negativity(rho_reduced_x10,[2,2]),Ps_x11*Negativity(rho_reduced_x11,[2,2]);...
        Ps_y00*Negativity(rho_reduced_y00,[2,2]),Ps_y01*Negativity(rho_reduced_y01,[2,2]),... 
        Ps_y10*Negativity(rho_reduced_y10,[2,2]),Ps_y11*Negativity(rho_reduced_y11,[2,2]);...
        Ps_z00*Negativity(rho_reduced_z00,[2,2]),Ps_z01*Negativity(rho_reduced_z01,[2,2]),...
        Ps_z10*Negativity(rho_reduced_z10,[2,2]),Ps_z11*Negativity(rho_reduced_z11,[2,2])];

    array2 = [sum(array(1,:)),sum(array(2,:)),sum(array(3,:))] ;

    loc4 = max(array2);
end