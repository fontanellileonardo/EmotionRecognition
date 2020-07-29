old_sensor_matrix = sensor_matrix;
old_labels_arousal = labels_arousal;
old_labels_valence = labels_valence;

[m,n] = size(sensor_matrix);

sensor_matrix = [sensor_matrix labels_arousal labels_valence];
rowtodelete = [];
sorted = sortrows(sensor_matrix,[n+1 n+2]);

sensor_matrix_2 = [];
sensor_matrix_2 = [sensor_matrix_2 ; sorted(1,:)];


for i = 1: 1279
    [r c] = size(sensor_matrix_2);
    redundant = false;
    for j = 1:r
        if(abs(sensor_matrix_2(j,n+1) - sorted(i,n+1)) + abs(sensor_matrix_2(j,n+2) - sorted(i,n+2)) <=0.5)
            redundant = true;
        end
    end
    if (~redundant)
        sensor_matrix_2 = [sensor_matrix_2; sorted(i,:)];
    end
end

sensor_matrix = sensor_matrix_2(:, 1:n);
labels_arousal = sensor_matrix_2(:, n+1);
labels_valence = sensor_matrix_2(:, n+2);

clear sensor_matrix_2 r c i j redundant rowtodelete sorted m n;