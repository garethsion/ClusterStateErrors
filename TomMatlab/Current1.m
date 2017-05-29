clear all
irho=ClusterMaker(8);
[BellS,rho]=ClusterMeasure(irho);
Fid=BellFid(BellS);

clear all
irho=ClusterMaker(5);
[BellS,rho]=ClusterMeasure(irho);
[CHSH,S1,S2]=CHSHtest(BellS)

% clear all
% irho=ClusterMaker(5);
% Fidel=ones(4,1001);
% Fidel2=1:1001;
% for p=0:1000
%     rho = (1-p/1000)*ClusterMaker(5)+(p/1000)*eye(32)/32;
%     Fidel(p+1)=Fidelity(ClusterMaker(5),rho);
%     [BellS,rho]=ClusterMeasure(irho);
%     CHSH(p+1)=CHSHtest(BellS);
%     Fidel(:,p+1)=BellFid(BellS);
%     Fidel2(p+1)=Fidelity(ClusterMaker(5),irho);
% end
% plot(0:0.001:1,nanmean(Fidel2),'.');
% hold on
% plot(0:0.001:1,CHSH)
% hold off

clear all
Fidel=1:1001;
Fidel2=ones(4,1001);
for p=0:1000
    rho = (1-p/1000)*ClusterMaker(5)+(p/1000)*eye(32)/32;
    Fidel(p+1)=Fidelity(ClusterMaker(5),rho);
    
    [BellS,rho]=ClusterMeasure(rho);
    Fidel2(:,p+1)=BellFid(BellS);
    CHSH(p+1)=(CHSHtest(BellS)-2)/(2*sqrt(2)-2);
end
plot(0:0.001:1,Fidel)
hold on
plot(0:0.001:1,Fidel2(1,:))
plot(0:0.001:1,CHSH)
ylim([0 1])
hold off