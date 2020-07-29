 if not(exist('old_sensor_matrix'))     
       old_sensor_matrix = sensor_matrix;
       old_labels_arousal = labels_arousal;
       old_labels_valence = labels_valence;
 end



test_mat = transpose(sensor_matrix);
[m,n] = size(test_mat);
covar_matrix = zeros(m,m);
for i = 1:m
    for j = 1:m
        arr1 = test_mat(i,:);
        arr2 = test_mat(j,:);
        R = corrcoef(arr1,arr2);
        covar_matrix(j,i) = R(1,2);
    end
end
corr = [];
for i = 1:m
    for j = 1:i
        if (abs((covar_matrix(i,j) >= 0.95 )) && (i ~= j))
            corr = [corr i];
        end
    end
end
corr = unique(corr);
test_mat(corr, :) = [];
sensor_matrix = transpose(test_mat);

clear corr test_mat i j R arr1 arr2 covar_matrix m n;