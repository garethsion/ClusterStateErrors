%%% Script to make ID tables and generator sets
%%% Three Qubits
genTable3 = [{'X Z I'};
             {'Z X Z'};
             {'I Z X'}];

IDTable3 =  [{'X Z I'};
             {'Z X Z'};
             {'I Z X'};
             {'- Y X Y'}];         

BTable3 = [{'Z X Z'};
           {'X I X'};
           {'- Y X Y'}];

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
         
IDTable4g = [{'X Z I I'};
             {'Z X Z I'};
             {'X I X Z'};
             {'X Z Z X'};
             {'Y X X Y'}];
         
IDTable4h = [{'X Z I I'};
             {'Z X Z I'};
             {'Z Y Y Z'};
             {'I I Z X'};
             {'X I Y Y'}];
         
IDTable4i = [{'Y Y Z I'};
             {'Z X Z I'};
             {'Z Y Y Z'};
             {'I I Z X'};
             {'Y X X Y'}];
         
IDTable4j = [{'Y Y Z I'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'I I Z X'};
             {'X I Y Y'}];

IDTable4k = [{'X I X Z'};
             {'Z X Z I'};
             {'Z Y Y Z'};
             {'I I Z X'};
             {'X Z Z X'}];
         
IDTable4l = [{'Y Y Z I'};
             {'Z Y Y Z'};
             {'I Z X Z'};
             {'I I Z X'};
             {'X Z Z X'}];
         
IDTable4m = [{'X Z I I'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'Z X I X'};
             {'X I Y Y'}];
             
IDTable4n = [{'X Z Z X'};
             {'Z X I X'};
             {'I Z X Z'};
             {'I I Z X'};
             {'Y X X Y'}];

IDTable4o = [{'X Z Z X'};
             {'Z X I X'};
             {'Z Y Y Z'};
             {'I I Z X'};
             {'X I Y Y'}];
             
IDTable4p = [{'X I X Z'};
             {'Z X Z I'};
             {'I Z X Z'};
             {'Z X I X'};
             {'X Z Z X'}];

IDTable4q = [{'X Z I I'};
             {'Z X I X'};
             {'Z Y Y Z'};
             {'I I Z X'};
             {'X I X Z'}];
             
IDTable4r = [{'Y Y Z I'};
             {'Z Y Y Z'};
             {'Z X I X'};
             {'Z X Z I'};
             {'X I Y Y'}];
             
IDTable4s = [{'I Z Y Y'};
             {'Z X I X'};
             {'Y Y Z I'};
             {'Y Y I X'};
             {'- Z Y X Y'}];
             
         
fourQubitList = {IDTable4,'4 qubit cluster initial table';
              IDTable4a,'4 qubit cluster table A';
              IDTable4b,'4 qubit cluster table B';
              IDTable4c,'4 qubit cluster table C';
              IDTable4d,'4 qubit cluster table D';
              IDTable4e,'4 qubit cluster table E';
              IDTable4f,'4 qubit cluster table F';
              IDTable4g,'4 qubit cluster table G';
              IDTable4h,'4 qubit cluster table H';
              IDTable4i,'4 qubit cluster table I';
              IDTable4j,'4 qubit cluster table J';
              IDTable4k,'4 qubit cluster table K';
              IDTable4l,'4 qubit cluster table L';
              IDTable4m,'4 qubit cluster table M';
              IDTable4n,'4 qubit cluster table N';
              IDTable4o,'4 qubit cluster table O';
              IDTable4p,'4 qubit cluster table P';
              IDTable4q,'4 qubit cluster table Q';
              IDTable4r,'4 qubit cluster table R';
              IDTable4s,'4 qubit cluster table S'
              };
         
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
         
         