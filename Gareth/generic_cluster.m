
sigmaX=[0 1;1 0];
sigmaZ=[1 0;0 -1];
sigmaY=[0,-1i;1i,0];

N = 2;

start=0;
for n=1:N-2;
  zxz=kron(kron(sigmaZ,sigmaY),sigmaZ);
  start=start-kron(kron(eye(2^(n-1)),zxz),eye(2^(N-n-2)));
end %for
start=start-kron(kron(sigmaY,sigmaZ),eye(2^(N-2)));
start=start-kron(eye(2^(N-2)),kron(sigmaZ,sigmaX));
[vertical,diagonal]=eig(start);
[junk,index]=min(diag(diagonal));
c=vertical(:,index(1));
c=c/sqrt(c'*c);

rho_c = c*c';
figure;bar3(rho_c)