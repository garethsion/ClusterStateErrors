function [CHSH,S1,S2]=CHSHtest(BellS)
%0 Deg
Z0=[1;0];
Z1=[0;1];

%45 Deg
X0=[1;1]/sqrt(2);
X1=[1;-1]/sqrt(2);

%22.5 Deg %
XZa0=(X0+Z0)/norm(X0+Z0);
XZa1=[XZa0(2);-XZa0(1)];

%67.5 Deg %
XZb0=(X0+Z1)/norm(X0+Z1);
XZb1=[XZb0(2);-XZb0(1)];

BellBasisA0=Tensor(Z0,Z0');
BellBasisA1=Tensor(Z1,Z1');
BellBasisA0(:,:,2)=Tensor(X0,X0');
BellBasisA1(:,:,2)=Tensor(X1,X1');

BellBasisB0=Tensor(XZa0,XZa0');
BellBasisB1=Tensor(XZa1,XZa1');
BellBasisB0(:,:,2)=Tensor(XZb0,XZb0');
BellBasisB1(:,:,2)=Tensor(XZb1,XZb1');

S1=zeros(1,8);
S2=zeros(1,8);
for cc=1:8
    rho=BellS(:,:,cc);
    for aa=1:2
        for bb=1:2
            Npp(aa,bb)=trace(LRProject(rho,kron(BellBasisA0(:,:,aa),BellBasisB0(:,:,bb))));
            Nmm(aa,bb)=trace(LRProject(rho,kron(BellBasisA1(:,:,aa),BellBasisB1(:,:,bb))));
            Nmp(aa,bb)=trace(LRProject(rho,kron(BellBasisA1(:,:,aa),BellBasisB0(:,:,bb))));
            Npm(aa,bb)=trace(LRProject(rho,kron(BellBasisA0(:,:,aa),BellBasisB1(:,:,bb))));
        end
    end

    Expec=Npp+Nmm-Npm-Nmp;
    S1(cc)=Expec(1,1)-Expec(1,2)+Expec(2,1)+Expec(2,2);
    S2(cc)=-Expec(1,1)+Expec(1,2)+Expec(2,1)+Expec(2,2);
end
CHSH=meanabs(S1)+meanabs(S2);