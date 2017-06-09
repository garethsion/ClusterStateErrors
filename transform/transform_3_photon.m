function rho_out = transform_3_photon(rho_in)

permuter = eye(16);
permuter(2,2)= 0;
permuter(4,4)= 0;
permuter(5,5)= 0;
permuter(7,7)= 0;
permuter(10,10)= 0;
permuter(12,12)= 0;
permuter(13,13)= 0;
permuter(15,15)= 0;

permuter(2,5)= 1;
permuter(4,7)= 1;
permuter(5,2)= 1;
permuter(7,4)= 1;
permuter(10,13)= 1;
permuter(12,15)= 1;
permuter(13,10)= 1;
permuter(15,12)= 1;

Z = [1,0;0,-1];
Y = [0,-1i;1i,0];
X = [0,1;1,0];
sqrt_Z = sqrtm(Z);
hadamard = 1/sqrt(2) * [1,1;1,-1];

rotation_3 = -kron(Z*sqrt_Z,kron(X,kron(X,Z*sqrt_Z)));

permuted_rho = permuter * rho_in * permuter';

rho_out = rotation_3 * permuted_rho * rotation_3';
