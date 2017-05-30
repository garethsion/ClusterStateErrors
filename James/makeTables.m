%%% Script to make ID tables and generator sets

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
         