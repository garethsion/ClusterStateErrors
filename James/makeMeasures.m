%%%%% Make tables for measurement sequences %%%%

%%% Single qubit

Z_measure = {'Z0';'Z1'};

%%% Three qubits, 1 and 3
measure3Q_1_3_X = {'I X0 I';
                   'I X1 I'};
               
measure3Q_1_3_Y = {'I Y0 I';
                   'I Y1 I'};

measure3Qlist_1_3 = {'I X I', measure3Q_1_3_X;
                     'I Y I', measure3Q_1_3_Y};

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
                    'I Y1 Y1 I'};
                
measure4Qlist_1_4 = {'I X X I', measure4Q_1_4_XX;
                     'I X Y I', measure4Q_1_4_XY;
                     'I Y X I', measure4Q_1_4_YX;
                     'I Y Y I', measure4Q_1_4_YY};


                 