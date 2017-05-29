function Fid=BellFid(BellS)

%BellS=ClusterMeasure(rho);

PureBell=eye(4);
%%PureBells defined 00+, 00-, 01+, 01- %%

for d=1:4
    PureBell(:,:,d)=Bell(d-1)*Bell(d-1)';
end

Fid=1;

Fid(1)=0.5*(Fidelity(BellS(:,:,1),PureBell(:,:,1))+Fidelity(BellS(:,:,4),PureBell(:,:,1)));
Fid(2)=0.5*(Fidelity(BellS(:,:,2),PureBell(:,:,2))+Fidelity(BellS(:,:,3),PureBell(:,:,2)));
Fid(3)=0.5*(Fidelity(BellS(:,:,5),PureBell(:,:,3))+Fidelity(BellS(:,:,8),PureBell(:,:,3)));
Fid(4)=0.5*(Fidelity(BellS(:,:,6),PureBell(:,:,4))+Fidelity(BellS(:,:,7),PureBell(:,:,4)));