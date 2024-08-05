clear;
drive='m:\人工学习成人数据\allbrain\';
epochlength=1401;
epochlength_base=1201;
conbehname={'raven','dot','sub','math'};
outpath=sprintf('%s/Correlation_results/ItemCorr_ERP_behav_compar_144trial_2run_Duowei_Group/',drive);
if isdir(outpath);rmdir(outpath,'s');end;mkdir(outpath);

for conbeh=1:4
    r_result=zeros(epochlength,31);
    p_result=zeros(epochlength,31);
    t_result=zeros(epochlength,31);
    t_result_05=zeros(epochlength,31);
    t_result_005=zeros(epochlength,31);
    t_result_001=zeros(epochlength,31);
    
    for channel=1:31
        channel
        condata=[];
        condata_count=1;
        for trialid=[1112:1114 1121 1123 1124 1131 1132 1134 1141:1143 1212:1214 1221 1223 1224 1231 1232 1234 1241:1243 2112:2114 2121 2123 2124 2131 2132 2134 2141:2143 2212:2214 2221 2223 2224 2231 2232 2234 2241:2243 3112:3114 3121 3123 3124 3131 3132 3134 3141:3143 3212:3214 3221 3223 3224 3231 3232 3234 3241:3243]
            filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_behav_compar_144trial_Duowei\\item%d_corr_%s.txt',drive,trialid,conbehname{conbeh});
            if exist(filename)
                alltemp=load(filename);
                temp=alltemp(:,channel);
                aa=find(isnan(temp));
                if length(aa)<epochlength
                    condata(:,condata_count)=temp;
                    condata_count=condata_count+1;
                end
            end
        end
        
        for timepoint=1:epochlength
            [~,p,~,s]=ttest(condata(timepoint,:));
            t_result(timepoint,channel)=s.tstat;
            p_result(timepoint,channel)=p;
            if p<.05
                t_result_05(timepoint,channel)=s.tstat;
            end
            if p<.005
                t_result_005(timepoint,channel)=s.tstat;
            end
            if p<.001
                t_result_001(timepoint,channel)=s.tstat;
            end
            r_result(timepoint,channel)=mean(condata(timepoint,:));
        end
        
    end
    save(sprintf('%s\\compar_corr_first3run_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
    save(sprintf('%s\\compar_corr_first3run_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
    save(sprintf('%s\\compar_corr_first3run_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
    save(sprintf('%s\\compar_corr_first3run_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
    save(sprintf('%s\\compar_corr_first3run_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
    save(sprintf('%s\\compar_corr_first3run_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
end

for conbeh=1:4
    r_result=zeros(epochlength,31);
    p_result=zeros(epochlength,31);
    t_result=zeros(epochlength,31);
    t_result_05=zeros(epochlength,31);
    t_result_005=zeros(epochlength,31);
    t_result_001=zeros(epochlength,31);
    
    for channel=1:31
        channel
        condata=[];
        condata_count=1;
        for trialid=[4112:4114 4121 4123 4124 4131 4132 4134 4141:4143 4212:4214 4221 4223 4224 4231 4232 4234 4241:4243 5112:5114 5121 5123 5124 5131 5132 5134 5141:5143 5212:5214 5221 5223 5224 5231 5232 5234 5241:5243 6112:6114 6121 6123 6124 6131 6132 6134 6141:6143 6212:6214 6221 6223 6224 6231 6232 6234 6241:6243]
            filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_behav_compar_144trial_Duowei\\item%d_corr_%s.txt',drive,trialid,conbehname{conbeh});
            if exist(filename)
                alltemp=load(filename);
                temp=alltemp(:,channel);
                aa=find(isnan(temp));
                if length(aa)<epochlength
                    condata(:,condata_count)=temp;
                    condata_count=condata_count+1;
                end
            end
        end
        
        for timepoint=1:epochlength
            [~,p,~,s]=ttest(condata(timepoint,:));
            t_result(timepoint,channel)=s.tstat;
            p_result(timepoint,channel)=p;
            if p<.05
                t_result_05(timepoint,channel)=s.tstat;
            end
            if p<.005
                t_result_005(timepoint,channel)=s.tstat;
            end
            if p<.001
                t_result_001(timepoint,channel)=s.tstat;
            end
            r_result(timepoint,channel)=mean(condata(timepoint,:));
        end
        
    end
    save(sprintf('%s\\compar_corr_second3run_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
    save(sprintf('%s\\compar_corr_second3run_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
    save(sprintf('%s\\compar_corr_second3run_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
    save(sprintf('%s\\compar_corr_second3run_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
    save(sprintf('%s\\compar_corr_second3run_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
    save(sprintf('%s\\compar_corr_second3run_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
    
end