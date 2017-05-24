function process = BuildChi(rho0, rho1, rho2, rho3)

sigmaX = [0,1;1,0];
I = eye(2,2);

p1 = rho0;
p4 = rho1;
p3 = rho2 - 1i*rho3 - (1-1i)*(p1+p4)/2;
p2 = rho2 + 1i*rho3 - (1+1i)*(p1+p4)/2;
    
Lambda = 1/2 * [I, sigmaX; sigmaX, -1*I];
process = Lambda * [p1, p2; p3, p4] * Lambda;
end

