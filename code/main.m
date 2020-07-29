%   General data
    seconds_to_cut = 15;
    sensor_length = 8064 - seconds_to_cut*128;
    valence_repetitions = 1;
    arousal_repetitions = 1;
    valence_features = 20;
    arousal_features = 20;
    
%   Features windows
    window_number = 4;
    window_size = sensor_length/window_number;    
    f_window_number = 4;
    f_window_size = 4096/f_window_number;

%   Check for feature matrix
    
    % v_30 is the matrix with all the sensor values
    if not(exist('v_30'))     
        v_30 = v_30_extraction(seconds_to_cut, sensor_length);
    end
    
    % v_30_bw is the matrix with 4 different bandwidths features
    if not(exist('v_30_bw'))     
        frequence_features_extraction;
    end
    
  
     if not(exist('v_30_freq'))     
        v_30_freq_creation;
    end
    
    sensor_matrix = [];
    
%   Frequence Features
%
%   1 - Bandwith 99% power
%   2 - High frequence 99% power
%   3 - Low frequence 99% power
%   4 - Mean frequence
%   5 - Highest peak value
%   6 - Highest peak frequence
%   7 - 99% power (dB)
%
%   EEG sensor selection

freq_features_selection = [1:7];
freq_sens_selection = [1:32];

add_frequence_features;

%   Frequence function 
%
%   1 - Mean
%   2 - Var
%   3 - Median
%   4 - Min
%   5 - Max
%   6 - Skewness
%   7 - Std
%   8 - Area
%
%   Frequence function selection

ff_features_selection = [1:8];
ff_sens_selection = [1:40];
add_freq_function;

%   Time-domain features
%
%   1 - Mean
%   2 - Var
%   3 - Median
%   4 - Min
%   5 - Max
%   6 - Skewness
%   7 - Std
%   8 - Area
%
%   Time domain selection

time_features_selection = [1:8];
time_sens_selection = [1:40];

add_time_features;

%   Labels creation

if not(exist('labels_arousal') | exist('labels_valence') )     
    [labels_arousal , labels_valence]= labels_extraction(); 
end

%   Uncomment to create a target-balanced set
%reduce_set

%   Target normalization
labels_arousal= normalize(transpose(labels_arousal));
labels_arousal = transpose(labels_arousal);
labels_valence= normalize(transpose(labels_valence));
labels_valence = transpose(labels_valence);

%   Uncomment to remove columns that have a covariance value >= 0.95
%covariance_remove

%sensor_matrix = normalize(sensor_matrix);
[sensor_row, sensor_column] = size(sensor_matrix);

% Feature Selection %

    opt=statset('display','iter');
    
    %Valence%    
    fs_valence = zeros(10,sensor_column);
    for i= 1:valence_repetitions
    [fs_valence(i,:)]=sequentialfs(@myfun,sensor_matrix,labels_valence,'cv','none','opt', opt,'nfeatures', valence_features);
    end
    
    valence_sum = sum(fs_valence, 1); % Vector with occurence number
    valence_fs_in = zeros(1,sensor_column);
    for j=1:valence_features
        [M,I] = max(valence_sum);
       valence_fs_in(I)=1;
       valence_sum(I)=0;
    end
    
    %Arousal%
    
    
    fs_arousal = zeros(10,sensor_column);
    for i= 1:arousal_repetitions
    [fs_arousal(i,:)]=sequentialfs(@myfun,sensor_matrix,labels_arousal,'cv','none','opt', opt,'nfeatures', arousal_features);
    end
    
    arousal_sum = sum(fs_arousal, 1); % Vector with occurence number
    arousal_fs_in = zeros(1,sensor_column);
    for j=1:arousal_features
        [M,I] = max(arousal_sum);
       arousal_fs_in(I)=1;
       arousal_sum(I)=0;
    end
clear arousal_sum valence_sum fs_arousal fs_valence i I j M opt; 

% Select only the most picked columns

sensor_arousal = zeros(sensor_row, arousal_features);
j=1;
for i=1:sensor_column
    if(arousal_fs_in(1, i)==1)
        sensor_arousal(:, j) = sensor_matrix(:, i);
        j=j+1;
    end
end
clear i j;

if (exist('old_sensor_matrix'))
    old_sensor_arousal = zeros(sensor_row, arousal_features);
    j=1;
    for i=1:sensor_column
        if(arousal_fs_in(1, i)==1)
           old_sensor_arousal(:, j) = sensor_matrix(:, i);
           j=j+1;
        end
    end
clear i j;
end

sensor_valence = zeros(sensor_row, arousal_features);
j=1;
for i=1:sensor_column
    if(valence_fs_in(1, i)==1)
        sensor_valence(:, j) = sensor_matrix(:, i);
        j=j+1;
    end
end

if (exist('old_sensor_matrix'))
    old_sensor_valence = zeros(sensor_row, valence_features);
    j=1;
    for i=1:sensor_column
        if(valence_fs_in(1, i)==1)
           old_sensor_valence(:, j) = sensor_matrix(:, i);
           j=j+1;
        end
    end
clear i j;
end

clear i j arousal_features arousal_fs_in arousal_repetitions sensor_column sensor_row valence_features valence_fs_in valence_repetitions;



% Neural Network test %





