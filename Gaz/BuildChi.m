function process = BuildChi(rho0, rho1, rho2, rho3, dim)
%%% Function BuildChi builds a process matrix Chi out of the four input
%%% density matrices. dim refers to the dimension of the density matrices.

sigmaX = [0,1;1,0];
I = eye(dim,dim);

p1 = rho0;
p4 = rho1;
p3 = rho2 - 1i*rho3 - (1-1i)*(p1+p4)/2;
p2 = rho2 + 1i*rho3 - (1+1i)*(p1+p4)/2;

if dim > 2
    Lambda = 1/2 * [I, kron(sigmaX,eye(dim/2)); kron(sigmaX,eye(dim/2)), -1*I];

else
    Lambda = 1/2 * [I, sigmaX; sigmaX, -1*I];
end

process = Lambda * [p1, p2; p3, p4] * Lambda;
end

