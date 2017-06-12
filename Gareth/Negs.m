function negs = Negs(rho)

    neg_mis1 = zeros(1,3);
    
    for x=1:3
        neg_mis1(x) = LocEntanglement4(rho,1,x+1);
    end

    % Here, we have measure 2 and 3 and 2 and 4
    neg_mis2 = zeros(1,2);
    for x=1:2
        neg_mis2(x) = LocEntanglement4(rho,2,x+2);
    end

    % Here, we have measure 3 and 4
    neg_mis3=LocEntanglement4(rho,3,4);

    d1=[neg_mis1(1), neg_mis1(3), neg_mis3]; % d=1
    d2=[neg_mis1(2),neg_mis2(2),0];% d=2
    d3=[neg_mis2(1),0,0];% d=3
    dist = [d1;d2;d3];
    d1_max=max(dist(1,:));
    d2_max=max(dist(2,:));
    d3_max=max(dist(3,:));
    negs = [d1_max,d2_max,d3_max];
end