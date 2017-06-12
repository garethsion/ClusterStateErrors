function transformed = TransRho(rho)
    %perfect_3=importdata('C:\Users\gjones\Dropbox\University College London\Group C density matrices\perfect_3')
    perfect_3=importdata('C:\Users\Gareth\Dropbox\University College London\Group C density matrices\perfect_3.mat');
    rounded=round(perfect_3*(16));
    roundedV=0.25*rounded(:,1);
    [p4,v4]=ClusterMaker(4);
    factors=v4./roundedV;
    Trans=diag(factors);
    Test=Trans*rounded*Trans';
    Test2=(p4*16)-Test;
    perfect_3_basis=Trans*perfect_3*Trans';
    Fidelity(ClusterMaker(4),perfect_3_basis);
    transformed = Trans*rho*Trans';
end
