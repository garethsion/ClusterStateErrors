pH = [1,0;0,0];
pV = [0,0;0,1];
pD = 0.5 * [1,1;1,1];
pR = 0.5 * [1,-1i;1i,1];

rho_HH = kron(pH,pH); rho_HV = kron(pH,pV); rho_HD = kron(pH,pD); rho_HR = kron(pH,pR);
rho_VH = kron(pV,pH); rho_VV = kron(pV,pV); rho_VD = kron(pV,pD); rho_VR = kron(pV,pR);
rho_DH = kron(pD,pH); rho_DV = kron(pD,pV); rho_DD = kron(pD,pD); rho_DR = kron(pD,pR); 
rho_RH = kron(pR,pH); rho_RV = kron(pR,pV); rho_RD = kron(pR,pD); rho_RR = kron(pR,pR);

out1  = Cluster(1,rho_HH); 
out2  = Cluster(1,rho_HV); 
out3  = Cluster(1,rho_HD);
out4  = Cluster(1,rho_HR); 
out5  = Cluster(1,rho_VH); 
out6  = Cluster(1,rho_VV);
out7  = Cluster(1,rho_VD); 
out8  = Cluster(1,rho_VR); 
out9  = Cluster(1,rho_DH);
out10 = Cluster(1,rho_DV); 
out11 = Cluster(1,rho_DD); 
out12 = Cluster(1,rho_DR);
out13 = Cluster(1,rho_RH); 
out14 = Cluster(1,rho_RV); 
out15 = Cluster(1,rho_RD);
out16 = Cluster(1,rho_RR);

out1n  = ClusterNoise(1,rho_HH); 
out2n  = ClusterNoise(1,rho_HV); 
out3n  = ClusterNoise(1,rho_HD);
out4n  = ClusterNoise(1,rho_HR); 
out5n  = ClusterNoise(1,rho_VH); 
out6n  = ClusterNoise(1,rho_VV);
out7n  = ClusterNoise(1,rho_VD); 
out8n  = ClusterNoise(1,rho_VR); 
out9n  = ClusterNoise(1,rho_DH);
out10n = ClusterNoise(1,rho_DV);
out11n = ClusterNoise(1,rho_DD); 
out12n = ClusterNoise(1,rho_DR);
out13n = ClusterNoise(1,rho_RH); 
out14n = ClusterNoise(1,rho_RV); 
out15n = ClusterNoise(1,rho_RD);
out16n = ClusterNoise(1,rho_RR);

%%% PERFORM CONVERSION, DETAILEd IN WHITE'S PAPER
a = 0.5*(1+1i);

Erho_11 = out1;
Erho_12 = -a*out1 + -a*out2 + out3 + 1i*out4;
Erho_13 = -a*out1 + -a*out5 + 1*out9 + 1i*out13;
Erho_14 = 1i/2*out1 + 1i/2*out2 + -a*out3 + a'*out4 + 1i/2*out5 +...
    1i/2*out6 + -a*out7 + a'*out8 + -a*out9 + -a*out10 + out11 +...
    1i*out12 + a'*out13 + a'*out14 + 1i*out15 + - out16;
Erho_21 = -a'*out1 -a'*out2 + out3 -1i*out4;
Erho_22 = out6;
Erho_23 = 1/2*out1 + 1/2*out2 -a*out3 -a'*out4 + 1/2*out5 + 1/2*out6...
    -a*out7 -a'*out8 -a'*out9 -a'*out10 + out11 -1i*out12 -a*out13...
    -a*out14 + 1i*out15 *out16;
Erho_24 = -a*out2 -a*out6 + 1*out10 + 1i*out14;
Erho_31 = -a'*out1 -a'*out5 + out9 -1i*out13;
Erho_32 = 1/2*out1 + 1/2*out2 -a'*out3 -a*out4 + 1/2*out5 + 1/2*out6...
    -a'*out7 -a*out8 -a*out9 -a*out10 +out11 + 1i*out12 -a'*out13...
    -a'*out14 -1i*out15 +out16;
Erho_33 = out4;
Erho_34 = -a*out4 -a*out5 + out6 + 1i*out7;
Erho_41 = -1i/2*out1 -1i/2*out2 -a'*out3 + a*out4 -1i/2*out5 -1i/2*out6...
    -a'*out7 + a*out8 -a'*out9 -a'*out10 + out11 -1i*out12 + a*out13...
    + a*out14 -1i*out15 -out16;
Erho_42 = -a'*out2 -a'*out6 + out10 -1i*out14;
Erho_43 = -a'*out5 -a'*out6 +out7 -1i*out8;
Erho_44 = out6;

Erho_11n = out1n;
Erho_12n = -a*out1n + -a*out2n + out3n + 1i*out4n;
Erho_13n = -a*out1n + -a*out5n + 1*out9n + 1i*out13n;
Erho_14n = 1i/2*out1n + 1i/2*out2n + -a*out3n + a'*out4n + 1i/2*out5n +...
    1i/2*out6n + -a*out7n + a'*out8n + -a*out9n + -a*out10n + out11n +...
    1i*out12n + a'*out13n + a'*out14n + 1i*out15n + - out16n;
Erho_21n = -a'*out1n -a'*out2n + out3n -1i*out4n;
Erho_22n = out6n;
Erho_23n = 1/2*out1n + 1/2*out2n -a*out3n -a'*out4n + 1/2*out5n + 1/2*out6n...
    -a*out7n -a'*out8n -a'*out9n -a'*out10n + out11n -1i*out12n -a*out13n...
    -a*out14n + 1i*out15n *out16n;
Erho_24n = -a*out2n -a*out6n + 1*out10n + 1i*out14n;
Erho_31n = -a'*out1n -a'*out5n + out9n -1i*out13n;
Erho_32n = 1/2*out1n + 1/2*out2n -a'*out3n -a*out4n + 1/2*out5n + 1/2*out6n...
    -a'*out7n -a*out8n -a*out9n -a*out10n +out11n + 1i*out12n -a'*out13n...
    -a'*out14n -1i*out15n +out16n;
Erho_33n = out4n;
Erho_34n = -a*out4n -a*out5n + out6n + 1i*out7n;
Erho_41n = -1i/2*out1n -1i/2*out2n -a'*out3n + a*out4n -1i/2*out5n -1i/2*out6n...
    -a'*out7n + a*out8n -a'*out9n -a'*out10n + out11n -1i*out12n + a*out13n...
    + a*out14n -1i*out15n -out16n;
Erho_42n = -a'*out2n -a'*out6n + out10n -1i*out14n;
Erho_43n = -a'*out5n -a'*out6n +out7n -1i*out8n;
Erho_44n = out6n;


%%% FORM BLOCK MATRIX ELEMENTS
rho_11 = rho_HH;
rho_12 = -a*rho_HH + -a*rho_HV + rho_HD + 1i*rho_HR;
rho_13 = -a*rho_HH + -a*rho_VH + 1*rho_DH + 1i*rho_RH;
rho_14 = 1i/2*rho_HH + 1i/2*rho_HV + -a*rho_HD + a'*rho_HR + 1i/2*rho_VH +...
    1i/2*rho_VV + -a*rho_VD + a'*rho_VR + -a*rho_DH + -a*rho_DV + rho_DD +...
    1i*rho_DR + a'*rho_RH + a'*rho_RV + 1i*rho_RD + - rho_RR;
rho_21 = -a'*rho_HH -a'*rho_HV + rho_HD -1i*rho_HR;
rho_22 = rho_VV;
rho_23 = 1/2*rho_HH + 1/2*rho_HV -a*rho_HD -a'*rho_HR + 1/2*rho_VH + 1/2*rho_VV...
    -a*rho_VD -a'*rho_VR -a'*rho_DH -a'*rho_DV + rho_DD -1i*rho_DR -a*rho_RH...
    -a*rho_RV + 1i*rho_RD *rho_RR;
rho_24 = -a*rho_HV -a*rho_VV + 1*rho_DV + 1i*rho_RV;
rho_31 = -a'*rho_HH -a'*rho_VH + rho_DH -1i*rho_RH;
rho_32 = 1/2*rho_HH + 1/2*rho_HV -a'*rho_HD -a*rho_HR + 1/2*rho_VH + 1/2*rho_VV...
    -a'*rho_VD -a*rho_VR -a*rho_DH -a*rho_DV +rho_DD + 1i*rho_DR -a'*rho_RH...
    -a'*rho_RV -1i*rho_RD +rho_RR;
rho_33 = rho_HR;
rho_34 = -a*rho_HR -a*rho_VH + rho_VV + 1i*rho_VD;
rho_41 = -1i/2*rho_HH -1i/2*rho_HV -a'*rho_HD + a*rho_HR -1i/2*rho_VH -1i/2*rho_VV...
    -a'*rho_VD + a*rho_VR -a'*rho_DH -a'*rho_DV + rho_DD -1i*rho_DR + a*rho_RH...
    + a*rho_RV -1i*rho_RD -rho_RR;
rho_42 = -a'*rho_HV -a'*rho_VV + rho_DV -1i*rho_RV;
rho_43 = -a'*rho_VH -a'*rho_VV +rho_VD -1i*rho_VR;
rho_44 = rho_VV;

outmatrix = [Erho_11,Erho_12,Erho_13,Erho_14; Erho_21,Erho_22,Erho_23,Erho_24;...
    Erho_31,Erho_32,Erho_33,Erho_34; Erho_41,Erho_42,Erho_43,Erho_44]; 

outmatrixn = [Erho_11n,Erho_12n,Erho_13n,Erho_14n; Erho_21n,Erho_22n,Erho_23n,Erho_24n;...
    Erho_31n,Erho_32n,Erho_33n,Erho_34n; Erho_41n,Erho_42n,Erho_43n,Erho_44n]; 

I=eye(2,2);
X = [0,1;1,0];
Z = [1,0;0,-1];

P=kron(kron(I,(rho_11+rho_23+rho_32+rho_44)),I);
Lambda = kron(0.25 * (kron(Z,I)+kron(X,X)) , (kron(Z,I) + kron(X,X)));
K = P*Lambda;
Chi = K' * outmatrix * K;
Chin = K' * outmatrixn * K;

figure;

bar3(real(Chi));%hold on; bar3(imag(Chi));
title(sprintf('Ideal Process Matrix for\n a Two Qubit Cluster State'), 'FontSize', 30);

set(gca,'XTickLabel', {'HH', 'HV', 'HD', 'HR', 'VH', 'VV', 'VD', 'VR', 'DH',...
    'DV', 'DD', 'DR', 'RH', 'RV', 'RD', 'RR'}, 'FontSize', 10);
set(gca,'ytick',1:1:16)
set(gca,'YTickLabel', {'HH', 'HV', 'HD', 'HR', 'VH', 'VV', 'VD', 'VR', 'DH',...
    'DV', 'DD', 'DR', 'RH', 'RV', 'RD', 'RR'}, 'FontSize', 13);


figure;
bar3(real(Chin));%hold on; bar3(imag(Chi));
title(sprintf('Noisy Process Matrix for\n a Two Qubit Cluster State'), 'FontSize', 30);
set(gca,'XTickLabel', {'HH', 'HV', 'HD', 'HR', 'VH', 'VV', 'VD', 'VR', 'DH',...
    'DV', 'DD', 'DR', 'RH', 'RV', 'RD', 'RR'}, 'FontSize', 10);
set(gca,'ytick',1:1:16)
set(gca,'YTickLabel', {'HH', 'HV', 'HD', 'HR', 'VH', 'VV', 'VD', 'VR', 'DH',...
    'DV', 'DD', 'DR', 'RH', 'RV', 'RD', 'RR'}, 'FontSize', 13);