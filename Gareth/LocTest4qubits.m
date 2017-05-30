zero = [1;0];
one = [0;1];
I=eye(2);
format compact;

Pj0 = zero*zero';
Pj1 = one*one';

% Choose Z measurement basis, so Pj=|0><0| and |1><1|. We have a three 
% qubit cluster state, so we will measure qubit one for now:

prompt = 'Which measurement option would you like?';
promp = input(prompt)
if promp==1
    Pj_zero = kron(kron(kron(kron(Pj0,Pj0),Pj0),I),I);
    Pj_one = kron(kron(kron(kron(Pj1,Pj1),Pj1),I),I);
elseif promp==2
    Pj_zero = kron(kron(kron(kron(Pj0,Pj0),I),Pj0),I);
    Pj_one = kron(kron(kron(kron(Pj1,Pj1),I),Pj1),I);
elseif promp==3
    Pj_zero = kron(kron(kron(kron(Pj0,I),Pj0),Pj0),I);
    Pj_one = kron(kron(kron(kron(Pj1,I),Pj1),Pj1),I);
else
    error('Try again');
end
 
    
Ps_zero = trace(Pj_zero*rho_cluster);
Ps_one = trace(Pj_one*rho_cluster);
if promp==1
    rho_reduced_zero = (1/Ps_zero) * PartialTrace(Pj_zero*Pj_zero*Pj_zero*...
    rho_cluster,[1,2,3],[2,2,2,2,2],-1);
    rho_reduced_one = (1/Ps_one) * PartialTrace(Pj_one*Pj_one*Pj_one*...
    rho_cluster,[1,2,3],[2,2,2,2,2],-1);
elseif promp==2
    rho_reduced_zero = (1/Ps_zero) * PartialTrace(Pj_zero*Pj_zero*Pj_zero*...
    rho_cluster,[1,2,4],[2,2,2,2,2],-1);
    rho_reduced_one = (1/Ps_one) * PartialTrace(Pj_one*Pj_one*Pj_one*...
    rho_cluster,[1,2,4],[2,2,2,2,2],-1);
elseif promp==3
    rho_reduced_zero = (1/Ps_zero) * PartialTrace(Pj_zero*Pj_zero*Pj_zero*...
    rho_cluster,[1,3,4],[2,2,2,2,2],-1);
    rho_reduced_one = (1/Ps_one) * PartialTrace(Pj_one*Pj_one*Pj_one*...
    rho_cluster,[1,3,4],[2,2,2,2,2],-1);
else
    error('Try again')
end
%Negativity(rho_reduced_zero);

locent = max ((Ps_zero*Negativity(rho_reduced_zero)*number_of_photons)...
    +(Ps_one*Negativity(rho_reduced_one)*number_of_photons))

% locent = max(Ps_zero*Negativity(rho_reduced_zero) + Ps_zero*Negativity(rho_reduced_zero)...
%     +Ps_zero*Negativity(rho_reduced_zero)+Ps_zero*Negativity(rho_reduced_zero)...
%     +Ps_one*Negativity(rho_reduced_one)+Ps_one*Negativity(rho_reduced_one)...
%     +Ps_one*Negativity(rho_reduced_one)+Ps_one*Negativity(rho_reduced_one))

% locent = max(Ps_zero*Negativity(rho_reduced_zero,length(rho_reduced_zero)) +...
%     Ps_one*Negativity(rho_reduced_one,length(rho_reduced_one)))
% 
% figure;bar3(real(rho_reduced_zero));



% Negativity(rho_reduced_one)
