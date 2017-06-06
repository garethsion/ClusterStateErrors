function rho_out = transform_2(rho_in)

Z = [1,0;0,-1];
Y = [0,-1i;1i,0];
X = [0,1;1,0];
sqrt_Z = sqrtm(Z);
hadamard = 1/sqrt(2) * [1,1;1,-1];

rotation = kron(sqrt_Z,kron(hadamard*sqrt_Z,hadamard*Z));

rho_out = rotation * rho_in * rotation';

