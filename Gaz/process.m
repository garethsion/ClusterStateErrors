%=========================================================================
% Generate Process Matrix for the cluster state. There are three primary 
% sources s comes from Bialczak's I'm using for this:
% Nielson and Chuang.
% Beterov paper
% Bialczak's PhD Thesis (see link below)
%http://web.physics.ucsb.edu/~martinisgroup/theses/Bialczak2011.pdf
%=========================================================================

zero = [1;0];
one = [0;1];

I = [1,0;0,1];
X = [0,1;1,0];
Y = [0,-1i;1i,0];
Z = [1,0;0,-1];

H = zero;
V = one;
D = (1/sqrt(2)) * (zero + one);
R = (1/sqrt(2)) * (zero + 1i*one);

operation_basis_set = kron([H,V,D,R],[H,V,D,R]);

% The Chi matrix is recontstructed with a block matrix of the measured
% density matrices. See Beterov for description of the following
M = [1,0,0,0;0,0,1,0;0,1,0,0;0,0,0,1];
P = kron(I,(kron(M,I)));
Lambda = (1/4) * kron(kron(Z,I) + kron(X,X), kron(Z,I) + kron(X,X));
K = P*Lambda;

% Chi = transpose(K) * [p11,p12,p13,p14; p21,p22,p23,p24; p31,p31,p33,p34;...
%     p41,p42,p43,p44];

% Like single qubit tomography, we prepare two qubits in the bipartite
% physical basis rho_ab = {H,V,D,R}. To find Chi, we need to fid the
% density matrices p'ij after measurement of the final states p'ab of two
% qubits following the transformation in Beterov's paper

% The following large horrible matrix will transform the measured density
% matrices to ithe input density matrices:
a = 0.5*(1+1i); % transform parameter
%p_trans = [p11;p12;p13;p14;p21;p22;p23;p24;p31;p32;p33;p34;p41;p42;p43;p44];
ma = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
mb = [-a,-a,1,1i,0,0,0,0,0,0,0,0,0,0,0,0];
mc = [-a,0,0,0,-a,0,0,0,1,0,0,0,1i,0,0,0];
md = [1i/2,1i/2,-a,a',1i/2,1i/2,-a,a',-a,-a,1,1i,a',a',1i,-1];
me = [-a',-a',1,-1i,0,0,0,0,0,0,0,0,0,0,0,0];
mf = [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
mg = [0.5,0.5,-a,-a',0.5,0.5,-a,-a',-a',-a',1,-1i,-a,-a,1i,1];
mh = [0,-a,0,0,0,-a,0,0,0,1,0,0,0,1i,0,0];
mi = [-a',0,0,0,-a',0,0,0,1,0,0,0,-1i,0,0,0];
mj = [0.5,0.5,-a',-a,0.5,0.5,-a',-a,-a,-a,1,1i,-a',-a',-1i,1];
mk = [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
ml = [0,0,0,-a,-a,1,1i,0,0,0,0,0,0,0,0,0];
mm = [-1i/2,-1i/2,-a',-a,-1i/2,-1i/2,-a',a,-a',-a',1,-1i,a,a,-1i,-1];
mn = [0,-a',0,0,0,-a',0,0,0,1,0,0,0,-1i,0,0];
mo = [0,0,0,0,-a',-a',1,-1i,0,0,0,0,0,0,0,0];
mp = [0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
p_trans = [ma;mb;mc;md;me;mf;mg;mh;mi;mj;mk;ml;mm;mn;mo;mp];
