zero = [1;0];
one = [0;1];
I=eye(2);

%%% STATE MEASUREMENT BASES FOR PROJECTORS %%%%%
% X basis
Px0 = (1/2)*[1,1;1,1];
Px1 = (1/2)*[1,-1;-1,1];
% Y basis
Py0=(1/2)*[1, -1i; 1i, 1];
Py1=(1/2)*[1, 1i; -1i, 1];
% Z basis
Pz0 = zero*zero'; 
Pz1 = one*one';
  
% Build measurement basis space for qubits
% Px_0 = kron(kron(Px0,I),I);
% Px_1 = kron(kron(Px1,I),I);
% Py_0 = kron(kron(Py0,I),I);
% Py_1 = kron(kron(Py1,I),I);
% Pz_0 = kron(kron(Pz0,I),I);
% Pz_1 = kron(kron(Pz1,I),I);

% Px_0 = kron(kron(I,Px0),I);
% Px_1 = kron(kron(I,Px1),I);
% Py_0 = kron(kron(I,Py0),I);
% Py_1 = kron(kron(I,Py1),I);
% Pz_0 = kron(kron(I,Pz0),I);
% Pz_1 = kron(kron(I,Pz1),I);

Px_0 = kron(kron(I,I),Px0);
Px_1 = kron(kron(I,I),Px1);
Py_0 = kron(kron(I,I),Py0);
Py_1 = kron(kron(I,I),Py1);
Pz_0 = kron(kron(I,I),Pz0);
Pz_1 = kron(kron(I,I),Pz1);

% Determine probability of measurement outcome for given basis 
Ps_x0 = trace(Px_0*rho_cluster);
Ps_x1 = trace(Px_1*rho_cluster);
Ps_y0 = trace(Py_0*rho_cluster);
Ps_y1 = trace(Py_1*rho_cluster);
Ps_z0 = trace(Pz_0*rho_cluster);
Ps_z1 = trace(Pz_1*rho_cluster);

% Find reduced density matrices for each basis
rho_reduced_x0 = (1/Ps_x0) * PartialTrace(Px_0*rho_cluster,3,[2,2,2]);
rho_reduced_x1 = (1/Ps_x1) * PartialTrace(Px_1*rho_cluster,3,[2,2,2]);
rho_reduced_y0 = (1/Ps_y0) * PartialTrace(Py_0*rho_cluster,3,[2,2,2]);
rho_reduced_y1 = (1/Ps_y1) * PartialTrace(Py_1*rho_cluster,3,[2,2,2]);
rho_reduced_z0 = (1/Ps_z0) * PartialTrace(Pz_0*rho_cluster,3,[2,2,2]);
rho_reduced_z1 = (1/Ps_z1) * PartialTrace(Pz_1*rho_cluster,3,[2,2,2]);

array = [Ps_x0*Negativity(rho_reduced_x0), Ps_x1*Negativity(rho_reduced_x1);
    Ps_y0*Negativity(rho_reduced_y0), Ps_y1*Negativity(rho_reduced_y1);
    Ps_z0*Negativity(rho_reduced_z0), Ps_z1*Negativity(rho_reduced_z1)]

locent = max(array(1,:))+max(array(2,:))+max(array(3,:))

