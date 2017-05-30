function [output] = plotIDbounds(M,varargin)
%%% Plot the upper and lower fidelity squared bounds given by the ID formalism, for
%%% the ID table with M rows, as a function of alpha.
%%% Second argument is a flag

nofigureflag = 0;
if nargin>1
    nofigureflag = varargin{1};
    display(['Yay!' num2str(nofigureflag)]);
end

for k = 1:100
    alpha(k) = M*(k-50)/50;
    F_ID_low(k) = idFidLower(alpha(k),M);
    F_ID_up(k) = idFidUpper(alpha(k),M);
end


if nofigureflag == 0
    figure;
else
    hold on
end
plot(alpha,F_ID_low,'--b');
hold on
plot(alpha,F_ID_up,'--r');

if nofigureflag == 0
    xlabel('<alpha>');
    ylabel('Fidelity squared');
    legend('Lower bound','Upper bound','Location','southeast');
    ylim([0 1]);
end