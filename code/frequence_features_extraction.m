v_30_pow = cell(40,32);
v_30_flow = cell(40,32);
v_30_fhi = cell(40,32);
v_30_bw = cell(40,32);
v_30_mf = cell(40,32);
v_30_peak = cell(40,32);
v_30_peakfreq = cell(40,32);

for j = 1:32
    for i = 1:40
        matr = cell2mat(v_30(i,j));        
        pow = zeros(40,4);
        flow = zeros(40,4);
        fhi = zeros(40,4);
        bw = zeros(40,4);
        mf = zeros(40,4);
        p = zeros(40,4);        
        pf = zeros(40,4);       
        
        for z = 1:40
            x = matr(z,:);
            t = (0:1/128:(63-seconds_to_cut)-1/128)';
            timeLimits = seconds([0 (63-seconds_to_cut)-1/128]); % seconds
            frequencyLimits = [0 64]; % Hz
            
            theta = bandpass(x,[4 8],128);
            alpha = bandpass(x,[8 13],128);
            beta = bandpass(x,[13 30],128);
            gamma = bandpass(x,[36 44],128);
            
            [bwz,flowz,fhiz,powz] = obw(theta,128);
            bw(z,1) = bwz;
            flow(z,1) = flowz;
            fhi(z,1) = fhiz;
            pow(z,1) = powz;
            mf(z,1) = meanfreq(theta,128);
            theta = timetable(seconds(t),theta');
            tt_Var1_ROI = theta(:,'Var1');
            tt_Var1_ROI = tt_Var1_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);
            [ps, f]=pspectrum(tt_Var1_ROI, ...
                'FrequencyLimits',frequencyLimits);
            [pks,loc] = findpeaks(pow2db(ps),128,'NPeaks',1);
            p(z,1) = pks;
            pf(z,1) = loc;
           
            
            [bwz,flowz,fhiz,powz] = obw(alpha,128);
            bw(z,2) = bwz;
            flow(z,2) = flowz;
            fhi(z,2) = fhiz;
            pow(z,2) = powz;
            mf(z,2) = meanfreq(alpha,128);
            alpha = timetable(seconds(t),alpha');
            tt_Var1_ROI = alpha(:,'Var1');
            tt_Var1_ROI = tt_Var1_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);
            [ps, f]=pspectrum(tt_Var1_ROI, ...
                'FrequencyLimits',frequencyLimits);
            [pks,loc] = findpeaks(pow2db(ps),128,'NPeaks',1);
            p(z,2) = pks;
            pf(z,2) = loc;
            
            [bwz,flowz,fhiz,powz] = obw(beta,128);
            bw(z,3) = bwz;
            flow(z,3) = flowz;
            fhi(z,3) = fhiz;
            pow(z,3) = powz;
            mf(z,3) = meanfreq(beta,128);
            beta = timetable(seconds(t),beta');
            tt_Var1_ROI = beta(:,'Var1');
            tt_Var1_ROI = tt_Var1_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);
            [ps, f]=pspectrum(tt_Var1_ROI, ...
                'FrequencyLimits',frequencyLimits);
            [pks,loc] = findpeaks(pow2db(ps),128,'NPeaks',1);
            p(z,3) = pks;
            pf(z,3) = loc;
            
            [bwz,flowz,fhiz,powz] = obw(gamma,128);
            bw(z,4) = bwz;
            flow(z,4) = flowz;
            fhi(z,4) = fhiz;
            pow(z,4) = powz;
            mf(z,4) = meanfreq(gamma,128);
            gamma = timetable(seconds(t),gamma');
            tt_Var1_ROI = gamma(:,'Var1');
            tt_Var1_ROI = tt_Var1_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);
            [ps, f]=pspectrum(tt_Var1_ROI, ...
                'FrequencyLimits',frequencyLimits);
            [pks,loc] = findpeaks(pow2db(ps),128,'NPeaks',1);
            p(z,4) = pks;
            pf(z,4) = loc;
        end
        v_30_pow(i,j) = mat2cell(pow,40,4);
        v_30_flow(i,j) = mat2cell(flow,40,4);
        v_30_fhi(i,j) = mat2cell(fhi,40,4);
        v_30_bw(i,j) = mat2cell(bw,40,4);
        v_30_mf(i,j) = mat2cell(mf,40,4);
        v_30_peak(i,j) = mat2cell(p,40,4);
        v_30_peakfreq(i,j) = mat2cell(pf,40,4);
       
        
    end
end
clear i j pow flow fhi bw matr mf p1 pf1 p2 pf2 p3 pf3 theta alpha beta gamma bwz f fhiz flowz frequencyLimits loc p pf pks powz ps seconds_to_cut t timeLimits tt_Var1_ROI x z;
