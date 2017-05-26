function [output] = randSuperposition(state1,state2,min_1)
%%% Generates a random superposition of two states. min_1 specifies the
%%% minimum value that the mod squared amplitude of state 1 should have.

raw_amp_1 = randn(1)+1i*randn(1);
raw_amp_2 = randn(1)+1i*randn(1);

raw_amp_1_mod = abs(raw_amp_1);
raw_amp_2_mod = abs(raw_amp_2);

p = sqrt(min_1)/abs(raw_amp_1);

q = sqrt(1 - min_1)/abs(raw_amp_2);

amp = p*raw_amp_1*state1 + q*raw_amp_2*state2;

normaliser = sqrt(amp'*amp);

amp_final = amp/normaliser;

output = amp_final;