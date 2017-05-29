idim=6;
Fid=1:6;
Fid2=1:6;
irho = ClusterMaker(idim);
for lost=1:6
    rho=PartialTrace(irho,lost,2*ones(1,idim));
    BellS=ClusterMeasure(rho);
    Fid(lost)= mean(BellFid(BellS));
    Fid2(lost)= Fidelity(rho,ClusterMaker(5));
end
figure
plot(Fid,'r')
hold on
plot(Fid2,'b')
hold off