%%%%%%%% Script to evaluate many states %%%%%
clear eval_results header_row nicetable
%%%%INPUTS%%%%
states = Tsweep_100_5000_correct_30ns_prec; % 3D array of density matrices
data_set_name = 'two_sweep_dephasing_100_5000_prec_30ns'; %
path_name = 'C:\Users\jseddon\Documents\GitHub\clusterfun\results\';
N = 3; % Number of qubits.
IDTable = IDTable3; % Identity product table.
BTable = BTable3; % Table giving triplet of B observables.
measure_table = measure3Qlist_1_3; % Measurement settings for LE.
tolerance = 0.000001; % Tolerance for checking trace(rho) = 1.
parameter_name = 'Dephasing time (ns)'; % name of variable in parameter sweep.
parameter_bounds = [100 5000] ; % range to sweep between


%%%%%
time = clock;
timestamp = [num2str(time(1)) '-' num2str(time(2)) '-'  num2str(time(3))...
             '-' num2str(time(4)) '-' num2str(time(5))];
         
file_name = [path_name data_set_name '_' timestamp '.csv'];

param_range = parameter_bounds(2) - parameter_bounds(1);
number_states = size(states,3);
step = param_range/(number_states - 1);

%%%%%%%%%%%%%%
% [rho_fidelity, alpha, ID_lower_fidsquared, ID_upper_fidsquared,...
%             ID_lower_fid, ID_upper_fid,...
%             local_entanglement,...
%             C_ZXZ, C_gen, C_alpha, C_triplet,...
%             generator_exvals];


header_row = {parameter_name,...
              'Fidelity','alpha','F^2 lower bound','F^2 upper bound',...
              'F lower bound','F upper bound','LE measured',...
              'C_{\langle ZXZ\rangle}','C_{gen}','C_{\alpha}','C_B'};

columns = length(header_row);

for j = 1:N
    header_row{1,columns + j} = ['Generator exval ' num2str(j)];
end



for k = 1:number_states
    display(['Processing state number ' num2str(k) '.']);
    this_state = states(:,:,k);
    if (abs(trace(this_state)-1)>=tolerance)
        display(['State number ' num2str(k) ' is bad. Skipping...'])
        continue
    end
    param_value = parameter_bounds(1)+step*(k-1);
    eval_results(k,:) = [param_value,...
                         real(evaluateStateBounds(IDTable,N,this_state,...
                                        'Localise',measure_table,...
                                        'Triplet',BTable))];;
end

nicetable = vertcat(header_row,num2cell(eval_results));
num_rows = size(nicetable,1);


fid = fopen(file_name,'w');
  fprintf(fid,['%s, %s, %s, %s, %s, %s, %s,'...
               ' %s, %s, %s, %s, %s, %s, %s, %s\n'],nicetable{1,:});
  for m = 2:(num_rows)
      fprintf(fid,['%f, %f, %f, %f, %f, %f, %f,'...
               ' %f, %f, %f, %f, %f, %f, %f, %f\n'],nicetable{m,:});
  end
  fclose(fid);
