zero = [1;0];
one = [0;1];
R = zero;
L = one;

Z = [1,0;0,-1];
I = eye(2);
c2 = kron(kron(zero,R) + kron(one,L),R) + kron(kron(-zero,R)+kron(one,L),L);
one*ctranspose(-one);

% n = PartialTrace(rho_cluster)
% LE = max(Negativity(n))
new_state = kron(Z,kron(I,I))*rho_cluster
rho2 = new_state*new_state';
Negativity(rho2,8)