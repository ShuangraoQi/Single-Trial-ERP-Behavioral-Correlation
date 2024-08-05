clear;
drive='m:\人工学习成人数据\allbrain\';
epochlength=3201;
epochlength_base=3001;
conname={'first3run','second3run'};
conbehname={'matchRT','matchERR','comparRT','comparERR','raven','dot','sub','math'};
outpath=sprintf('%s/Correlation_results/ItemCorr_ERP_m_cbehav_learn_2run_Group/',drive);
% if isdir(outpath);rmdir(outpath,'s');end;mkdir(outpath);  
trialid=[];
  for block=1:6
      for order=1:2
          for loc=1:2
              for rep=1:2
                  for id=1:4
                      trialid=cat(1,trialid,block*10000+order*1000+loc*100+rep*10+id);
                  end
              end
          end
      end
  end

% for conbeh=8%%5:8
%  
%    r_result=zeros(epochlength,31);
%    p_result=zeros(epochlength,31);   
%    t_result=zeros(epochlength,31);
%    t_result_05=zeros(epochlength,31);
%    t_result_005=zeros(epochlength,31);
%    t_result_001=zeros(epochlength,31);
%    
% 
%   for channel=1:31
%       channel
%        condata=[];
%        condata_count=1;
%        for tid=[1:96]
%             filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_%s.txt',drive,trialid(tid),conbehname{conbeh});                  
%             if exist(filename)
% 				alltemp=load(filename);
% 				temp=alltemp(:,channel);
% 				aa=find(isnan(temp));
% 				if length(aa)<epochlength 
%                     condata(:,condata_count)=temp;
%                     condata_count=condata_count+1;
% 				end
% 			end
%        end          
%        
%        for timepoint=1:epochlength
%             [~,p,~,s]=ttest(condata(timepoint,:));
%             t_result(timepoint,channel)=s.tstat;
% 			p_result(timepoint,channel)=p;
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
%        end
%        
%   end
%           save(sprintf('%s\\learn_first3run_corr_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
%           save(sprintf('%s\\learn_first3run_corr_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
%           save(sprintf('%s\\learn_first3run_corr_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
%           save(sprintf('%s\\learn_first3run_corr_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
%           save(sprintf('%s\\learn_first3run_corr_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
%           save(sprintf('%s\\learn_first3run_corr_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
% end

  for conbeh=8%%5:8
 
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
       for tid=[97:192]
            filename=sprintf('%sCorrelation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_%s.txt',drive,trialid(tid),conbehname{conbeh});                  
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
          save(sprintf('%s\\learn_second3run_corr_%s_r_result.txt',outpath,conbehname{conbeh}),'r_result','-ascii');
          save(sprintf('%s\\learn_second3run_corr_%s_p_result.txt',outpath,conbehname{conbeh}),'p_result','-ascii');
          save(sprintf('%s\\learn_second3run_corr_%s_t_result.txt',outpath,conbehname{conbeh}),'t_result','-ascii');
          save(sprintf('%s\\learn_second3run_corr_%s_t_result_05.txt',outpath,conbehname{conbeh}),'t_result_05','-ascii');
          save(sprintf('%s\\learn_second3run_corr_%s_t_result_005.txt',outpath,conbehname{conbeh}),'t_result_005','-ascii');
          save(sprintf('%s\\learn_second3run_corr_%s_t_result_001.txt',outpath,conbehname{conbeh}),'t_result_001','-ascii');
end