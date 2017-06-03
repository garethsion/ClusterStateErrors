%%%%% Make tables for measurement sequences %%%%

%% Single qubit

Z_measure = {'Z0';'Z1'}

%%% Four-qubit, 1 and 4

measure4Q_1_4_XX = {'I X0 X0 I';
                    'I X0 X1 I';
                    'I X1 X0 I';
                    'I X1 X1 I'};
             
measure4Q_1_4_XY = {'I X0 Y0 I';
                    'I X0 Y1 I';
                    'I X1 Y0 I';
                    'I X1 Y1 I'};
                
measure4Q_1_4_YX = {'I Y0 X0 I';
                    'I Y0 X1 I';
                    'I Y1 X0 I';
                    'I Y1 X1 I'};
                 
measure4Q_1_4_YY = {'I Y0 Y0 I';
                    'I Y0 Y1 I';
                    'I Y1 Y0 I';
                    'I Y1 Y1 I'}

                 