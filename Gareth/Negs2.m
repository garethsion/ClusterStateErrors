function Negs2 = Negs2(rho)

    dis1 = zeros(1,3);
    dis2 = zeros(1,2);

    
    dis1(1) = LocEntanglement4(rho,3,4);
    dis1(2) = LocEntanglement4(rho,1,4);
    dis1(3) = LocEntanglement4(rho,2,3);
    dis2(1) = LocEntanglement4(rho,1,3);
    dis2(2) = LocEntanglement4(rho,2,4);
    dis3 = LocEntanglement4(rho,1,2);
%     dis1(1) = LocEntanglement4(rho,1,2);
%     dis1(2) = LocEntanglement4(rho,1,4);
%     dis1(3) = LocEntanglement4(rho,2,3);
%     dis2(1) = LocEntanglement4(rho,1,3);
%     dis2(2) = LocEntanglement4(rho,2,4);
%     dis3 = LocEntanglement4(rho,3,4);

    dist_1_100 = max(dis1);
    dist_2_100 = max(dis2);
    dist_3_100 = dis3;
    Negs2 = [dist_1_100, dist_2_100, dist_3_100];
end