[m, feature_number] = size(ff_features_selection);
[m, sens_number] = size(ff_sens_selection);
include_array = zeros(1280,feature_number*sens_number);
columns_to_remove = setdiff(1:40, ff_sens_selection);
tt = columns_to_remove;
for i = 1:f_window_number-1
    columns_to_remove = columns_to_remove + 40;
    tt = cat(2,tt,columns_to_remove);
end

if (any(ff_features_selection(:) == 1))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                                         
                       for t = 1:f_window_number                          
                          include_array(k,(z-1)*f_window_number + t) = mean(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end

if (any(ff_features_selection(:) == 2))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*f_window_number + t) = var(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end

if (any(ff_features_selection(:) == 3))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*f_window_number + t) = median(temp(z,start_index:end_index));
                          start_index = start_index +f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end
if (any(ff_features_selection(:) == 4))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*window_number + t) = min(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end
if (any(ff_features_selection(:) == 5))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*window_number + t) = max(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end
if (any(ff_features_selection(:) == 6))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*f_window_number + t) = skewness(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end
if (any(ff_features_selection(:) == 7))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          include_array(k,(z-1)*f_window_number + t) = std(temp(z,start_index:end_index));
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end

if (any(ff_features_selection(:) == 8))
   k=1;
   start_index = 1;
   end_index = f_window_size;   
       for i = 1:32
           for j = 1:40               
               temp = cell2mat(v_30_freq(j,i)); 
               [m, n] = size(temp);
               for z = 1:m
                   
                       for t = 1:f_window_number
                          arr = temp(z,start_index:end_index);                          
                          include_array(k,(z-1)*f_window_number + t) = trapz(arr);
                          start_index = start_index + f_window_size;
                          end_index = end_index + f_window_size;                            
                       end
                       start_index = 1;
                       end_index = f_window_size;
                   
               end
               k=k+1;
               
           end
       end
       include_array(:,tt) = [];
       sensor_matrix = [sensor_matrix include_array];
end



clear i j z k include_array t temp start_index end_index feature_number m n feature_number freq_features_selection freq_sens_selection ff_features_selection ff_sens_selection f_window_number f_window_size seconds_to_cut sens_number columns_to_remove tt arr;