function [labels_arousal , labels_valence] = labels_extraction()
struct_array_of_matfiles = transpose( dir( '.\data\*.mat' ) );

labels_valence = zeros(1280,1);
labels_arousal = zeros(1280,1);
j=1;

for sa = struct_array_of_matfiles
    struct_of_data = load( fullfile( sa.name ) );
    for i = 1:40
        labels_valence(j) = struct_of_data.labels(i,1);
        labels_arousal(j) = struct_of_data.labels(i,2);
        j=j+1;
    end
end

clear i j struct_of_data struct_array_of_matfiles sa; 
end

