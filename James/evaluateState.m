function [output] = evaluateState(IDTableList,rho)
%%% Evaluate a state rho using a list of ID tables.
%%% (see Greganti et. al. (2015) doi:10.1103/PhysRevA.91.022325)
%%% Takes input, e.g.:
%%% IDTableList = {IDTable_1,{'name_1'};
%%%                IDTable_2,{'name_2'};
%%%                IDTable_3,{'name_3'};
%%%                ...
%%%                IDTable_N,{'name_N'};
%%% where each IDTable_i has form, e.g.:
%%% IDTableN = [ {'X Z I'};
%%%             {'Z X Z'};
%%%             {'I Z X'};
%%%             {'Y X Y'}]
%%% Output is:
%%% { Tablename_1, [alpha_1, observable_1_1, observable_1_2, ...,
%%%                     observable_M], lower_bound, upper_bound,
%%%                     sqrt(lower_bound),sqrt(upper_bound);
%%%   Tablename_2, alpha_2,...
%%%   ...
%%%   Tablename_N, ...}

numberTables = length(IDTableList);

for k = 1:numberTables
    currentTableName = IDTableList{k,2};
    currentTable = IDTableList{k,1};
    M = length(currentTable);
    currentObservable = real(idObservable(currentTable,rho));
    currentAlpha = currentObservable(1);
    currentLower = real(idFidLower(currentAlpha,M));
    currentUpper = real(idFidUpper(currentAlpha,M));
    Results(k,:) = {currentTableName, currentObservable, currentLower,...
                    currentUpper,sqrt(currentLower),sqrt(currentUpper)};
end
best_lower  = max(cell2mat(Results(:,5)));
best_upper = min(cell2mat(Results(:,6)));

[output] = {Results, best_lower, best_upper}
    