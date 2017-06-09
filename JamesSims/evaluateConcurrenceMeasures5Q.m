%%%% Evaluate Nutz bound and Concurrence based LE for a dataset. %%%%

%%%%% INPUTS %%%%%%
input_data = fourQubitMixedResults_3000;
numberQubits = 5;
plotTitle = ['Four qubits, cluster state mixed with '...
                'random state'];
LE_measure_list = measure4Qlist_1_4;
qubit_1 = 1; %% first target qubit for LE
qubit_2 = 5; %% second target qubit for LE
keep_all_LE_results = true;

%%%%%%%%%%%%%%%%%%%

clear generatorMeasurements LE_bound_min LE_bound_all newResults;
clear LE_concurrence LE_results LE_bound_alpha;

lastIndex = numberQubits + 1;

cellRows = length(input_data);
found_data = false;
found_fidelity = false;
found_states = false;


for k = 1:cellRows;
    if strcmp(input_data{k,1},'Full results')
        ID_data = input_data{k,2};
        found_data = true;
    end
    if strcmp(input_data{k,1},'Fidelity')
        fidelity = input_data{k,2};
        found_fidelity = true;
    end
    if strcmp(input_data{k,1},'states')
        state_data = input_data{k,2};
        found_states = true
    end
    
end

if ~found_data
    msg = 'Could not find observable data';
    error(msg);
end

numberOfStates = length(ID_data);

if found_states
    for k=1:numberOfStates
        display(['Calculating localisable entanglement for state '...
                    'number ' num2str(k)]);
        this_density_matrix = state_data(:,:,k);
        LE_output = localEntanglement(LE_measure_list,...
            this_density_matrix,qubit_1,qubit_2);
        LE_concurrence(k) = LE_output{1};
        if keep_all_LE_results
            LE_results(k) = {LE_output{2}};
        end
    end
end
    



for m = 1:numberOfStates
    thisStateData = ID_data{m};
    thisState_ID_observables = thisStateData{1,2};
    these_measurements = thisState_ID_observables(2:lastIndex);
    generatorMeasurements(:,m) = these_measurements';
    [LE_bound_min(m),LE_bound_all(m)] = nutzBound(numberQubits,...
                                        these_measurements,true);
    alpha = thisState_ID_observables(1);
    LE_bound_alpha(m) = fourQubitLEbound(alpha);
    
end

newResults = input_data;

newResults{cellRows+1,1} = 'Generator measurements';
newResults{cellRows+1,2} = generatorMeasurements;
newResults{cellRows+2,1} = ['Localisable entanglement bound'...
                                ' (Nutz, minimal)'];
newResults{cellRows+2,2} = LE_bound_min;
newResults{cellRows+3,1} = 'Localisable entanglement bound (Nutz, all)';
newResults{cellRows+3,2} = LE_bound_all;
newResults{cellRows+4,1} = ['Localisable entanglement bound'...
                                ' (five qubit alpha)'];
newResults{cellRows+4,2} = LE_bound_all;
if found_states
    newResults{cellRows+5,1} = ['Localisable entanglement '...
                                    'bound (concurrence)'];
    newResults{cellRows+5,2} = LE_concurrence;
    if keep_all_LE_results
        newResults{cellRows+6,1} = ['Localisable entanglement '...
                                    'detail (concurrence)'];
        newResults{cellRows+6,2} = LE_results;
    end
end

if found_fidelity
    figure;
    plot(fidelity,LE_bound_min,'.k');
    xlabel('Fidelity');
    ylabel('Localisable entanglement bound');
    hold on
    plot(fidelity,LE_bound_all,'.g');
    plot(fidelity,LE_bound_alpha,'.b');
    title(plotTitle);
    xlim([0,1]);
    ylim([0,1]);
    legend('Nutz bound (minimal)','Nutz bound (all measurements)',...
            'ID table bound','Location','northwest');
    if found_states
        plot(fidelity,LE_concurrence,'.r');
        legend('Nutz bound (minimal)','Nutz bound (all measurements)',...
            'ID table bound','Measured LE','Location','northwest');
    end
else
    display('No fidelity found to plot against.');
end



