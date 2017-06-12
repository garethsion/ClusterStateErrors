load('C:\Users\gjones\Dropbox\University College London\ClusterStateErrors\Gaz\Transformation2');
load('C:\Users\gjones\Dropbox\University College London\ClusterStateErrors\Gaz\two_072_sweepT_100_10000')

delta_100 = two_072_sweepT_100_10000(:,:,1);
delta_1000 = two_072_sweepT_100_10000(:,:,46);
delta_10000 = two_072_sweepT_100_10000(:,:,499);
ideal = ClusterMaker(3);

del_100_fid = Fidelity(ideal,delta_100);
del_1000_fid = Fidelity(ideal,delta_1000);
del_10000_fid = Fidelity(ideal,delta_10000);

swept_del_fid = zeros(499,1);
axis_x=linspace(100,10000,499);

for x=1:499
    two_072_sweepT_100_10000(:,:,x)= Transformation2*...
        two_072_sweepT_100_10000(:,:,x)*Transformation2';
    swept_del_fid(x) = Fidelity(ideal,two_072_sweepT_100_10000(:,:,x));
end

% 
% LE1 = zeros(1,499);
% LE2 = zeros(1,499);
% LE3 = zeros(1,499);
% for x=1:499
%    LE1(x) = LocEntanglement3(two_072_sweepT_100_10000(:,:,x),1);
%    LE2(x) = LocEntanglement3(two_072_sweepT_100_10000(:,:,x),2);
%    LE3(x) = LocEntanglement3(two_072_sweepT_100_10000(:,:,x),3);
% end
% LE = [LE1;LE2;LE3];

LE_100_1 = max(LE1(1),LE2(1)); LE_100 = [LE_100_1, LE3(1)];
LE_200_1 = max(LE1(6),LE2(6)); LE_200 = [LE_200_1,LE3(6)];
LE_300_1 = max(LE1(11),LE2(11)); LE_300 = [LE_300_1,LE3(11)];
LE_400_1 = max(LE1(16),LE2(16)); LE_400 = [LE_400_1,LE3(16)];
LE_500_1 = max(LE1(21),LE2(21)); LE_500 = [LE_500_1,LE3(21)];
LE_1000_1 = max(LE1(56),LE2(56)); LE_1000 = [LE_1000_1,LE3(56)];
LE_2000_1 = max(LE1(146),LE2(146)); LE_2000 = [LE_2000_1,LE3(146)];
LE_5000_1 = max(LE1(249),LE2(249)); LE_5000 = [LE_5000_1,LE3(249)];
LE_10000_1 = max(LE1(499),LE2(499)); LE_10000 = [LE_10000_1,LE3(499)];

LambdaE_3_100 = -1/(log(LE_100(2)/LE_100(1)));
% LambdaE_3_100 = 3.15;
LambdaE_3_200 = 2.12;

No_3_100 = LE_100(1);
No_3_200 = LE_200(1);

Elength_3_100 = Elength(LE_100, 50);
Elength_3_200 = Elength(LE_200, 50);
Elength_3_300 = Elength(LE_300, 50);
Elength_3_400 = Elength(LE_400, 50);
Elength_3_500 = Elength(LE_500, 50);
Elength_3_1000 = Elength(LE_1000, 50);
Elength_3_2000 = Elength(LE_2000, 50);
Elength_3_5000 = Elength(LE_5000, 50);
Elength_3_10000 = Elength(LE_10000, 50);

dist_x_axis = [1,2];
Elength_axis = linspace(1,50,50);

%%% PLOT WITH INSET %%%%%

% Place axes at (0.1,0.1) with width and height of 0.8
fig = figure;
handaxes1 = axes('position', [0.1 0.1 0.8 0.8]);

plot(dist_x_axis,real(LE_100),'b-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_200),'c-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_300),'r-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_400),'g-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_500),'y-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_1000),'k-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_2000),'b-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_5000),'c-o','LineWidth',2); hold on;
plot(dist_x_axis,real(LE_10000),'r-o','LineWidth',2); hold on;

plot(Elength_axis, real(Elength_3_100), 'b*--'); hold on;
plot(Elength_axis, real(Elength_3_200), 'c*--'); hold on;
plot(Elength_axis, real(Elength_3_300), 'r*--'); hold on;
plot(Elength_axis, real(Elength_3_400), 'g*--'); hold on;
plot(Elength_axis, real(Elength_3_500), 'y*--'); hold on;
plot(Elength_axis, real(Elength_3_1000), 'k*--'); hold on;
plot(Elength_axis, real(Elength_3_2000), 'bd--'); hold on;
plot(Elength_axis, real(Elength_3_5000), 'cd--'); hold on;
plot(Elength_axis, real(Elength_3_10000), 'rd--'); hold on;
title('LE with Swept DE Dephasing Times', 'FontSize', 30);
xlabel('Distance Between Qubits', 'FontSize',26);
ylabel('Negativity', 'FontSize',26);
axis([0 50 0 0.5]); set(gca,'xtick',0:5:50); set(gca,'FontSize',20); grid minor;
legend('DE T^*_2 = 100ns', '           = 200ns', '           = 300ns',...
    '           = 400ns', '           = 500ns', '           = 1000ns',...
    '           = 2000ns', '           = 5000ns', '           = 10000ns');

% xlabel('t'); ylabel('sin(t)');
set(handaxes1, 'box', 'off');

% Adjust XY label font
handxlabel1 = get(gca, 'xlabel');
set(handxlabel1, 'fontsize', 20, 'fontweight', 'bold');
handylabel1 = get(gca, 'ylabel');
set(handylabel1, 'fontsize', 20, 'fontweight', 'bold');

% Place second set of axes on same plot
handaxes2 = axes('position', [0.3 0.4 0.4 0.4]);
plot(axis_x,swept_del_fid, 'r','LineWidth',2);
grid minor;
set(handaxes2, 'box', 'off');
xlabel('Dephasing Time (ns)', 'FontSize', 22);
ylabel('Fidelity', 'FontSize', 22);
set(gca,'FontSize',22)
%title('Fidelity with Rising DE Precession Time', 'FontSize', 20);