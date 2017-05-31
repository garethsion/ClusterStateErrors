zero = [1;0];
one = [0;1];
I=eye(2);
format compact;

Pz0 = zero*zero';
Pz1 = one*one';

% Choose Z measurement basis, so Pj=|0><0| and |1><1|. We have a three 
% qubit cluster state, so we will measure qubit one for now:
% Pj_z0 = kron(kron(kron(Pz0,Pz0),I),I);
% Pj_z1 = kron(kron(kron(Pz1,Pz1),I),I);

Pz_z0 = kron(kron(kron(Pz0,I),Pz0),I);
Pz_z1 = kron(kron(kron(Pz1,I),Pz1),I);

% Pj_z0 = kron(kron(kron(I,I),Pz0),Pz0);
% Pj_z1 = kron(kron(kron(I,I),Pz1),Pz1);


Ps_z0 = trace(Pz_z0*rho_cluster);
Ps_z1 = trace(Pz_z1*rho_cluster);

% rho_reduced_zero = (1/Ps_zo) * PartialTrace(Pz_zero*Pz_zero*Pz_zero*rho_cluster,[1,2],[2,2,2,2],-1);
% rho_reduced_one = (1/Ps_z1) * PartialTrace(Pz_one*Pz_one*Pz_one*rho_cluster,[1,2],[2,2,2,2],-1);

rho_reduced_zero = (1/Ps_z0) * ptrace(Pz_z0*rho_cluster,[2,3],[2,2,2,2]);
rho_reduced_one = (1/Ps_z1) * ptrace(Pz_z1*rho_cluster,[2,3],[2,2,2,2]);

%Negativity(rho_reduced_zero);

locent = max ((Ps_z0*Negativity(rho_reduced_zero)*(number_of_photons-1))...
    +(Ps_z1*Negativity(rho_reduced_one)*(number_of_photons-1)))

% locent = max(Ps_zero*Negativity(rho_reduced_zero) + Ps_zero*Negativity(rho_reduced_zero)+...
%     Ps_one*Negativity(rho_reduced_one)+Ps_one*Negativity(rho_reduced_one))

% locent = max(Ps_zero*Negativity(rho_reduced_zero,length(rho_reduced_zero)) +...
%     Ps_one*Negativity(rho_reduced_one,length(rho_reduced_one)))
% 
% figure;bar3(real(rho_reduced_zero));



% Negativity(rho_reduced_one)
