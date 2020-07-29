v_30_freq = cell(40,32);

for j = 1:32
    for i = 1:40
        matr = cell2mat(v_30(i,j));        
        fr = zeros(40,4096);   
        
        for z = 1:40
            x = matr(z,:);
            x = smooth(x);
            t = (0:1/128:(63-seconds_to_cut)-1/128)';
            timeLimits = seconds([0 (63-seconds_to_cut)-1/128]); % seconds
            frequencyLimits = [0 64]; % Hz
            x = lowpass(x,45,128);     
            x = timetable(seconds(t),x);
            tt_Var1_ROI = x(:,'x');
            tt_Var1_ROI = tt_Var1_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);
            [ps, f]=pspectrum(tt_Var1_ROI, ...
                'FrequencyLimits',frequencyLimits);
            fr(z,:) = transpose(pow2db(ps));
            
        end
        v_30_freq(i,j) = mat2cell(fr,40,4096);       
       
        
    end
end
clear i j x z fr y tt_Var1_ROI ps f ;





