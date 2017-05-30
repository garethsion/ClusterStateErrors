%%% Script to make ID tables and generator sets
%%% 4-qubits
genTable4 = [{'X Z I I'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'I I Z X'}];

IDTable4 = [{'X Z I I'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'I I Z X'};
             {'Y X X Y'}];
         
IDTable4a = [{'X Z I I'};
             {'Y Y Z I'};
             {'I Z X Z'};
             {'I I Z X'};
             {'- Z Y X Y'}];
         
IDTable4b = [{'X Z I I'};
             {'Z X Z I'};
             {'X I X Z'};
             {'I I Z X'};
             {'- Z Y X Y'}];
         
IDTable4c = [{'X Z I I'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'X Z Z X'};
             {'- Z Y X Y'}];
         
IDTable4d = [{'X Z I I'};
             {'Y Y Z I'};
             {'X I X Z'};
             {'X Z Z X'};
             {'- Z Y X Y'}]; 
         
IDTable4e = [{'X Z I I'};
             {'Y Y Z I'};
             {'X I X Z'};
             {'I I Z X'};
             {'Y X X Y'}];

IDTable4f = [{'X Z I I'};
             {'Y Y Z I'};
             {'I Z X Z'};
             {'X Z Z X'};
             {'Y X X Y'}];
         
IDTable4f = [{'X Z I I'};
             {'Z X Z I'};
             {'X I X Z'};
             {'X Z Z X'};
             {'Y X X Y'}];
         
%%% 5-qubit cluster state
genTable5 = [{'X Z I I I'};
             {'Z X Z I I'};
             {'I Z X Z I'};
             {'I I Z X Z'};
             {'I I I Z X'}];
   
         
IDTable5 = [{'X Z I I I'};
             {'Z X Z I I'};
             {'I Z X Z I'};
             {'I I Z X Z'};
             {'I I I Z X'};
             {'- Y X X X Y'}];
         
         
genAntiTable5 = [{'- X Z I I I'};
             {'- Z X Z I I'};
             {'- I Z X Z I'};
             {'- I I Z X Z'};
             {'- I I I Z X'}];
         
genMinusTable5 = [{'- X Z I I I'};
             {'Z X Z I I'};
             {'I Z X Z I'};
             {'I I Z X Z'};
             {'I I I Z X'}];

%%% 6-qubits         
         
genTable6 = [{'X Z I I I I'};
             {'Z X Z I I I'};
             {'I Z X Z I I'};
             {'I I Z X Z I'};
             {'I I I Z X Z'};
             {'I I I I Z X'}];
   
         
IDTable6 = [{'X Z I I I I'};
             {'Z X Z I I I'};
             {'I Z X Z I I'};
             {'I I Z X Z I'};
             {'I I I Z X Z'};
             {'I I I I Z X'};
             {'Y X X X X Y'}];
      

genTable6a = [{'- X Z I I I I'};
             {'Z X Z I I I'};
             {'I Z X Z I I'};
             {'I I Z X Z I'};
             {'I I I Z X Z'};
             {'I I I I Z X'}];
         
genTable6b = [{'- X Z I I I I'};
             {'- Z X Z I I I'};
             {'I Z X Z I I'};
             {'I I Z X Z I'};
             {'I I I Z X Z'};
             {'I I I I Z X'}];
         
         
genTable6c = [{'- X Z I I I I'};
             {'- Z X Z I I I'};
             {'- I Z X Z I I'};
             {'I I Z X Z I'};
             {'I I I Z X Z'};
             {'I I I I Z X'}];
         