%%%%%%%%%%%%%% plot concurrence results %%%%%%%%%%%%%
clear legend_parts

result_table = eval_results;
parameter_column = 1;
parameter_name = nicetable{1,1};
y_axis_label = 'Fidelity';

y_value_columns = [2,6,7];
% LE_column = 8;
% C_ZXZ_column = 9;
% C_gen_column = 10;
% C_alpha_column = 11;
% C_triplet_column = 12;

num_quantities = length(y_value_columns);

param_values = result_table(:,parameter_column);

figure;


for j = 1:num_quantities
    y_values = result_table(:,y_value_columns(j));
    legend_parts{1,j} = nicetable{1,y_value_columns(j)};
    plot(param_values,y_values);
    hold on;
end

xlabel(parameter_name);
ylabel(y_axis_label);
legend(legend_parts);
