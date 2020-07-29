
[m,freq_number] = size(freq_features_selection);
[m,sens_number] = size(freq_sens_selection);

remove_sens = setdiff(1:40, freq_sens_selection);
load('.\data\freq\freq_mat.mat');

k = 1;
for i = 1:32
    for j = 1:40
        sens_array = [];
        bw = cell2mat(v_30_bw(j,i));            %1
            bw(remove_sens, :)=[];
            bw = normalize(bw);
        fhi = cell2mat(v_30_fhi(j,i));          %2
            fhi(remove_sens, :)=[];
            fhi = normalize(fhi);
        flow = cell2mat(v_30_flow(j,i));        %3
            flow(remove_sens, :)=[];
            flow = normalize(flow);
        mf = cell2mat(v_30_mf(j,i));            %4
            mf(remove_sens, :)=[];
            mf = normalize(mf);
        pk = cell2mat(v_30_peak(j,i));          %5
            pk(remove_sens, :)=[];
            pk = normalize(pk);
        pkf = cell2mat(v_30_peakfreq(j,i));     %6
            pkf(remove_sens, :)=[];
            pkf = normalize(pkf);
        pow = cell2mat(v_30_pow(j,i));          %7
            pow(remove_sens, :)=[];
            pow = normalize(pow);
            
        if (any(freq_features_selection(:) == 1))
            sens_array = [sens_array transpose(bw(:))];
        end
        if (any(freq_features_selection(:) == 2))
            sens_array = [sens_array transpose(fhi(:))];
        end
        if (any(freq_features_selection(:) == 3))
            sens_array = [sens_array transpose(flow(:))];
        end
        if (any(freq_features_selection(:) == 4))
            sens_array = [sens_array transpose(mf(:))];
        end
        if (any(freq_features_selection(:) == 5))
            sens_array = [sens_array transpose(pk(:))];
        end        
        if (any(freq_features_selection(:) == 6))
            sens_array = [sens_array transpose(pkf(:))];
        end
        if (any(freq_features_selection(:) == 7))
            sens_array = [sens_array transpose(pow(:))];
        end
        sensor_matrix(k,:) = sens_array;
        k=k+1;
    end
end
clear bw fhi flow i j k m mf mfq mqq msq mtq pk pkf pow remove_sens sens_array freq_number sens_number ;

