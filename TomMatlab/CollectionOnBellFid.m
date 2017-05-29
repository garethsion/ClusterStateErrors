clear all
for idim=5:10
    for ii=1:100
        Current1
        TotalFid(idim-4,ii)=mean(Fid);
        TotalFid2(idim-4,ii)= Fid2;
    end
end
figure
%plot(TotalFid,'*')
hold on
plot(mean(TotalFid'))
%plot(Fid2,'*')
plot(nanmean(TotalFid2'))
hold off