function Elength = Elength(LE_tab, dist)
    
    No = LE_tab(1);
    LambdaE = -1/(log(LE_tab(2)/LE_tab(1)));

    Elength = zeros(1,dist);
    Elength(1) = No;

    for x=1:(dist-1)
        Elength(x+1) = No*exp(-x/LambdaE);
    end
end