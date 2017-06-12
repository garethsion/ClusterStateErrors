load('C:\Users\gjones\Dropbox\University College London\ClusterStateErrors\Gaz\Transformation2');
load('C:\Users\gjones\Dropbox\University College London\ClusterStateErrors\Gaz\two_photon_densities\two_sweep_precession.mat')

t_3ns = two_sweep_precession(:,:,1);
t_30ns = two_sweep_precession(:,:,270);
ideal = ClusterMaker(3);

t_3ns_fid = Fidelity(ideal,t_3ns);
t_30ns_fid = Fidelity(ideal,t_30ns);

swept_t_fid = zeros(269,1);
axis_x=linspace(3,30,269);

for x=1:269
    two_sweep_precession(:,:,x)= Transformation2*...
        two_sweep_precession(:,:,x)*Transformation2';
    swept_t_fid(x) = Fidelity(ideal,two_sweep_precession(:,:,x));
end
 
% LE1 = zeros(1,268);
% LE2 = zeros(1,268);
% LE3 = zeros(1,268);
% for x=1:268
%    LE1(x) = LocEntanglement3(two_sweep_precession(:,:,x),1);
%    LE2(x) = LocEntanglement3(two_sweep_precession(:,:,x),2);
%    LE3(x) = LocEntanglement3(two_sweep_precession(:,:,x),3);
% end
% LE = [LE1;LE2;LE3];

LE_3_1 = max(LE1(1),LE2(1)); LE_3 = [LE_3_1, LE3(1)];
LE_4_1 = max(LE1(23),LE2(23)); LE_4 = [LE_4_1, LE3(23)];
LE_5_1 = max(LE1(45),LE2(45)); LE_5 = [LE_5_1, LE3(45)];
LE_10_1 = max(LE1(90),LE2(90)); LE_10 = [LE_10_1,LE3(90)];
LE_15_1 = max(LE1(135),LE2(135)); LE_15 = [LE_15_1,LE3(135)];
LE_20_1 = max(LE1(180),LE2(180)); LE_20 = [LE_20_1,LE3(180)];
LE_25_1 = max(LE1(225),LE2(225)); LE_25 = [LE_25_1,LE3(225)];
LE_30_1 = max(LE1(268),LE2(268)); LE_30 = [LE_30_1,LE3(268)];

% LE_3 = [LE1(1),LE2(1)];
% LE_10 = [LE1(90),LE2(90)];
% LE_15 = [LE1(135),LE2(135)];
% LE_20 = [LE1(180),LE2(180)];
% LE_25 = [LE1(225),LE2(225)];
% LE_30 = [LE1(268),LE2(268)];

LambdaE_3ns = -1/(log(LE_3(2)/LE_3(1)));
LambdaE_4ns = -1/(log(LE_4(2)/LE_4(1)));
LambdaE_5ns = -1/(log(LE_5(2)/LE_5(1)));
LambdaE_10ns = -1/(log(LE_10(2)/LE_10(1)));
LambdaE_15ns = -1/(log(LE_15(2)/LE_15(1)));
LambdaE_20ns = -1/(log(LE_20(2)/LE_20(1)));
LambdaE_25ns = -1/(log(LE_25(2)/LE_25(1)));
LambdaE_30ns = -1/(log(LE_30(2)/LE_30(1)));
 
len_val = 400;

Elength_3ns = Elength(LE_3, len_val);
Elength_4ns = Elength(LE_4, len_val);
Elength_5ns = Elength(LE_5, len_val);
Elength_10ns = Elength(LE_10, len_val);
Elength_15ns = Elength(LE_15, len_val);
Elength_20ns = Elength(LE_20, len_val);
Elength_25ns = Elength(LE_25, len_val);
Elength_30ns = Elength(LE_30, len_val);

Elength_axis = linspace(1,len_val,len_val);
dist_x_axis = linspace(1,2,2);
%%% PLOT WITH INSET %%%%%

% Place axes at (0.1,0.1) with width and height of 0.8
fig = figure;
handaxes1 = axes('position', [0.1 0.1 0.8 0.8]);

plot(dist_x_axis,real(LE_3),'b-o','LineWidth',2); hold on;
%plot(dist_x_axis,real(LE_4),'r-o','LineWidth',2); hold on;
%plot(dist_x_axis,real(LE_5),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_10),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_20),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_30),'k-o','LineWidth',2); hold on;

plot(Elength_axis, real(Elength_3ns), 'b*--'); hold on;
%plot(Elength_axis, real(Elength_4ns), 'r*--'); hold on;
%plot(Elength_axis, real(Elength_5ns), 'g*--'); hold on;
plot(Elength_axis, real(Elength_10ns), 'r*--'); hold on;
%plot(Elength_axis, real(Elength_20ns), 'c*--'); hold on;
%plot(Elength_axis, real(Elength_30ns), 'm*--'); hold on;
title('LE with Swept DE Precession Time T=2\pi \\ \omega_2', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 len_val 0 0.5]); set(gca,'xtick',0:20:len_val); set(gca,'FontSize',20); grid minor;
legend('T = 3ns', '   = 10ns', '   = 20ns','   = 30ns');

% xlabel('t'); ylabel('sin(t)');
set(handaxes1, 'box', 'off');

% Adjust XY label font
handxlabel1 = get(gca, 'xlabel');
set(handxlabel1, 'fontsize', 20, 'fontweight', 'bold');
handylabel1 = get(gca, 'ylabel');
set(handylabel1, 'fontsize', 20, 'fontweight', 'bold');

% % Place second set of axes on same plot
% handaxes2 = axes('position', [0.58 0.2 0.3 0.3]);
% plot(axis_x,swept_t_fid, 'r','LineWidth',2);
% grid minor;
% set(handaxes2, 'box', 'off');
% xlabel('Precession Time (ns)', 'FontSize', 18);
% ylabel('Fidelity', 'FontSize', 18);
% title('Fidelity with Rising DE Precession Time', 'FontSize', 20);

% Place second set of axes on same plot
handaxes2 = axes('position', [0.3 0.4 0.4 0.4]);
plot(dist_x_axis,real(LE_3),'b-o','LineWidth',2); hold on;
%plot(dist_x_axis,real(LE_4),'r-o','LineWidth',2); hold on;
%plot(dist_x_axis,real(LE_5),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_10),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_20),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_30),'k-o','LineWidth',2); hold on;

xlabel('Distance Between Qubits', 'FontSize',20);
ylabel('Negativity', 'FontSize',20);
axis([0 3 0.38 0.43]); set(gca,'xtick',0:1:5); set(gca,'FontSize',18); grid minor;
legend('T = 3ns', '   = 10ns', '   = 20ns','   = 30ns');
% grid minor;