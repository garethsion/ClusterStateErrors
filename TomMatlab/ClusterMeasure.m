%Measures the Cluster State to leave a Bell-state%
%Outputs the density matrices of the produced Bell states (BellS(:,:,1-8))
%and of ClusterState Measured 32*32 double

function [BellS,rho]=ClusterMeasure(irho)
%%Block allows for efficiency
idim=log2(length(irho));
if idim-5 ~= 0
    lost=datasample(1:idim,(idim-5),'Replace',false);
    rho=PartialTrace(irho,lost,2*ones(1,idim));
else
    rho=irho;
end
%%

%%Block performs measurement on the clusterstate
%rho = RandomDensityMatrix(32);
dim=log2(length(rho));
Z0=[1,0;0,0];
Z1=[0,0;0,1];
X0=0.5*[1,1;1,1];
X1=0.5*[1,-1;-1,1];
%Z measure on qubits 1 and N%
Op1=kron(kron(Z0,eye(2^(dim-2))),Z0);
Op1(:,:,2)=kron(kron(Z0,eye(2^(dim-2))),Z1);
Op1(:,:,3)=kron(kron(Z1,eye(2^(dim-2))),Z0);
Op1(:,:,4)=kron(kron(Z1,eye(2^(dim-2))),Z1);
%X measure on qubits 3 to N-2% - EVENTUALLY
Op1(:,:,5)=kron(kron(eye(4),X0),eye(4));
Op1(:,:,6)=kron(kron(eye(4),X1),eye(4));

Op=eye(32);

for d1=1:4
    Op(:,:,d1)=Op1(:,:,5)*Op1(:,:,d1);
    Op(:,:,4+d1)=Op1(:,:,6)*Op1(:,:,d1);
end

Belltest=eye(32);
BellS=eye(4);

for d1=1:8
    Belltest(:,:,d1)=Op(:,:,d1)*rho*Op(:,:,d1);
    Belltest(:,:,d1)= Belltest(:,:,d1)*1/trace(Belltest(:,:,d1));
    BellS(:,:,d1)=PartialTrace(Belltest(:,:,d1),[1,3,5],[2,2,2,2,2]); %%FOR N=5
end