function [output] = plotIDbounds(M)
%%% Plot the upper and lower fidelity squared bounds given by the ID formalism, for
%%% the ID table with M rows, as a function of alpha.

for k = 1:100
    alpha(k) = M*(k-50)/50;
    F_ID_low(k) = idFidLower(alpha(k),M);
    F_ID_up(k) = idFidUpper(alpha(k),M);
end

figure;
hold on
plot(alpha,F_ID_low,'--b');
hold on
plot(alpha,F_ID_up,'--r');
xlabel('<alpha>');
ylabel('Fidelity squared');
legend('Lower bound','Upper bound','Location','southeast');
ylim([0 1]);