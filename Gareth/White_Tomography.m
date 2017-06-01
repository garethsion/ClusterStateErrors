pH = [1,0;0,0];
pV = [0,0;0,1];
pD = 0.5 * [1,1;1,1];
pR = 0.5 * [1,-1i;1i,1];

rho_HH = kron(pH,pH);
rho_HV = kron(pH,pV);
rho_HD = kron(pH,pD);
rho_HR = kron(pH,pR);
rho_VH = kron(pV,pH);
rho_VV = kron(pV,pV);
rho_VD = kron(pV,pD);
rho_VR = kron(pV,pR);
rho_DH = kron(pD,pH);
rho_DV = kron(pD,pV);
rho_DD = kron(pD,pD);
rho_DR = kron(pD,pR); 
rho_RH = kron(pR,pH);
rho_RV = kron(pR,pV);
rho_RD = kron(pR,pD);
rho_RR = kron(pR,pR);

