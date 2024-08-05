clear;
drive='m:\人工学习成人数据\allbrain\';
epochlength=1401;
epochlength_base=1201;
conbehname={'raven','dot','sub','math'};
outpath=sprintf('%s/Correlation_results/ItemCorr_ERP_behav_match_2run_Duowei_Group/',drive);
% if isdir(outpath);rmdir(outpath,'s');end;mkdir(outpath);

trialid=[];
for order=1:2
    for mat=1:2
        for block=1:6
            for rep=1:2
                for id=1:4
                    trialid=cat(1,trialid,order*10000+mat*1000+block*100+rep*10+id);
                end
            end
        end
    end
end
% for conbeh=1:4
%     r_result=zeros(epochlength,31);
%     p_result=zeros(epochlength,31);
%     t_result=zeros(epochlength,31);
%     t_result_05=zeros(epochlength,31);
%     t_result_005=zeros(epochlength,31);
%     t_result_001=zeros(epochlength,31);
%     
%     for channel=1:31
%         channel
%         condata=[];
%         condata_count=1;
%         for tid=[1:24 49:72 97:120 145:168]
%             filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_behav_match_192trial_Duowei\\item%d_corr_%s.txt',drive,trialid(tid),conbehname{conbeh});
%             if exist(filename)
%                 alltemp=load(filename);
%                 temp=alltemp(:,channel);
%                 aa=find(isnan(temp));
%                 if length(aa)<epochlength
%                     condata(:,condata_count)=temp;
%                     condata_count=condata_count+1;
%                 end
%             end
%         end
%         
%         for timepoint=1:epochlength
%             [~,p,~,s]=ttest(condata(timepoint,:));
%             t_result(timepoint,channel)=s.tstat;
%             p_result(timepoint,channel)=p;
%             if p<.05
%                 t_result_05(timepoint,channel)=s.tstat;
%             end
%             if p<.005
%                 t_result_005(timepoint,channel)=s.tstat;
%             end
%             if p<.001
%                 t_result_001(timepoint,channel)=s.tstat;
%             end
%             r_result(timepoint,channel)=mean(condata(timepoint,:));
%         end
%         
%     end
%     save(sprintf('%s\\match_corr_first3run_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
%     save(sprintf('%s\\match_corr_first3run_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
%     save(sprintf('%s\\match_corr_first3run_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
%     save(sprintf('%s\\match_corr_first3run_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
%     save(sprintf('%s\\match_corr_first3run_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
%     save(sprintf('%s\\match_corr_first3run_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
% end

for conbeh=4%%1:4
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
        for tid=[25:48 73:96 121:144 169:192]
            filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_behav_match_192trial_Duowei\\item%d_corr_%s.txt',drive,trialid(tid),conbehname{conbeh});
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
    save(sprintf('%s\\match_corr_second3run_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
    save(sprintf('%s\\match_corr_second3run_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
    save(sprintf('%s\\match_corr_second3run_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
    save(sprintf('%s\\match_corr_second3run_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
    save(sprintf('%s\\match_corr_second3run_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
    save(sprintf('%s\\match_corr_second3run_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
    
end