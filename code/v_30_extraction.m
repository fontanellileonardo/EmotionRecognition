function v_30 = v_30_extraction(seconds_to_cut, sensor_length)
    first_seconds = seconds_to_cut*128;
    j=1;
    v_30 = cell(40,32);
    struct_array_of_matfiles = transpose( dir( '.\data\*.mat' ) );

    for sa = struct_array_of_matfiles 
        struct_of_data = load( fullfile( sa.name ) );
        for i = 1:40
            temp = squeeze(struct_of_data.data(i,:,:));
            temp = normalize(temp);
            v_30(i,j) = mat2cell(temp(:, first_seconds+1:8064),40,sensor_length);
        end
        j= j+1;
    end

%clear i j struct_of_data struct_array_of_matfiles sa;


end


