%Outputs the density matrix of the clusterstate of dimension dim%
function [rho,ket]=ClusterMaker(dim)
v=ones([2^dim,1]);
v=v/norm(v);
CPhase=[
    1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 -1];
Op=eye(2^dim);
for d = 0:(dim-2)
    Op=Op*(kron(kron(eye(2^d),CPhase),eye(2^(dim-2-d))));
end
ket=Op*v;
rho=kron(ket,ket');
