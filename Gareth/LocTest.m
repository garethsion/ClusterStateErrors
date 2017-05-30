zero = [1;0];
one = [0;1];
I=eye(2);

Pj0 = zero*zero';
Pj1 = one*one';

% Choose Z measurement basis, so Pj=|0><0| and |1><1|. We have a three 
% qubit cluster state, so we will measure qubit one for now:
% Pj_zero = kron(kron(Pj0,I),I);
% Pj_one = kron(kron(Pj1,I),I);

% Pj_zero = kron(kron(I,Pj0),I);
% Pj_one = kron(kron(I,Pj1),I);

Pj_zero = kron(kron(I,I),Pj0);
Pj_one = kron(kron(I,I),Pj1);

Ps_zero = trace(Pj_zero*rho_cluster);
Ps_one = trace(Pj_one*rho_cluster);

% rho_reduced_zero = (1/Ps_zero) * PartialTrace(Pj_zero*rho_cluster,1,[2,2,2]);
% rho_reduced_one = (1/Ps_one) * PartialTrace(Pj_one*rho_cluster,1,[2,2,2]);
rho_reduced_zero = (1/Ps_zero) * ptrace(Pj_zero*rho_cluster,3,[2,2,2]);
rho_reduced_one = (1/Ps_one) * ptrace(Pj_one*rho_cluster,3,[2,2,2]);

% locent = max ((Ps_zero*Negativity(rho_reduced_zero)*(number_of_photons-1))...
%     +(Ps_one*Negativity(rho_reduced_one)*(number_of_photons-1)))

Ps_zero*Negativity(rho_reduced_one)

locent = max(Ps_zero*Negativity(rho_reduced_zero,1) +...
    Ps_one*Negativity(rho_reduced_one))

figure;bar3(real(rho_reduced_zero));hold on;bar3(imag(rho_reduced_zero));



% Negativity(rho_reduced_one)
