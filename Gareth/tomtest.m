rho_noisy = rhoout5(:,:,10);

outcomes_mis1 = zeros(1,4);
outcomes_mis1t = zeros(1,4);
outcomes_mis2t = zeros(1,3);
outcomes_mis3t = zeros(1,2);

dis1=zeros(1,4);
dis2=zeros(1,3);
dis3=zeros(1,2);

dis1(1) = LocEntanglement5(rho_noisy,4,5);
dis1(2) = LocEntanglement5(rho_noisy,3,4);
dis1(3) = LocEntanglement5(rho_noisy,2,3);
dis1(4) = LocEntanglement5(rho_noisy,1,5);

dis2(1) = LocEntanglement5(rho_noisy,3,5);
dis2(1) = LocEntanglement5(rho_noisy,2,4);
dis2(1) = LocEntanglement5(rho_noisy,1,4);

dis3(1) = LocEntanglement5(rho_noisy,2,5);
dis3(1) = LocEntanglement5(rho_noisy,1,3);

d_4 = LocEntanglement5(rho_noisy,1,2);

d_1 = max(dis1);
d_2 = max(dis2);
d_3 = max(dis3);

distances = [d_1;d_2;d_3;d_4];

Elength_5 = Elength(distances, 50);
% Elengtht_5 = Elength(dist_meanst, 35);

elength = Elength(LE_tom, 25);

dist_x_axis=[1,2,3,4];
Elength_axis = linspace(1,25,25);
fig = figure;
plot(dist_x_axis,real(distances),'b-o','LineWidth',2); hold on;

%plot(Elength_axis, real(elength), 'b*--'); hold on;