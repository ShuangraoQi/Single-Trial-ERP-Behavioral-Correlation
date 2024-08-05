clear;
drive='m:\人工学习成人数据\';
epochlength=3201;
epochlength_base=3001;
allbeh(:,1:2)= xlsread([drive,'48artificialLearnERP\BehaveAnalysis\sub_allresults.xls'],'sub_allresults','V2:W48');
allbeh(:,3:4)= xlsread([drive,'48artificialLearnERP\BehaveAnalysis\sub_allresults.xls'],'sub_allresults','AJ2:AK48');
allbeh(:,5:8)= xlsread([drive,'48artificialLearnERP\BehaveAnalysis\sub_allresults.xls'],'sub_allresults','AF2:AI48');
alltemp=zeros(192*epochlength,31,47);
sub=[1:2 4:48];
for subid=1:length(sub)
    subid
   alltemp0=load(sprintf('%sallbrain\\singletrial_data_150\\learning_sub%d.txt',drive,sub(subid)));
    alltemp(:,:,subid)=alltemp0';  
end 
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
for tid=1:length(trialid)
    tid
     allPearson_result1=[];
     allPearson_result2=[];
     allPearson_result3=[];
     allPearson_result4=[];
     allPearson_result5=[];
     allPearson_result6=[];
     allPearson_result7=[];
     allPearson_result8=[];
	 for channel=1:31  
       
        valid=[];
        condata=[];
        condata_count=1;
        for subid=1:length(sub)
            trial=load(sprintf('%s\\48artificialLearnERP\\BehaveAnalysis\\singletrial\\learn_%d.txt',drive,sub(subid)));
            %subid,blockid,tasktrid,RT,acc,trialid,symb1,symb2		
            for i=1:length(trial)
                if ( trial(i,6)==trialid(tid))  %%index by trial id.
                    temp=alltemp((i-1)*epochlength+1:i*epochlength,channel,subid);
					aa=find(isnan(temp));
                    if length(aa)==0       
                        condata(:,condata_count)=temp;
                        valid=cat(1,valid,allbeh(subid,:));
                        condata_count=condata_count+1;
						break;
                    end
                end
            end
        end 
        
        tt=find(mean(condata(1:epochlength,:))==0);
        condata(:,tt)=[];
        valid(tt,:)=[];
        
        
        for con=8%%1:8
            Pearson_result=zeros(epochlength,1); 
            if length(valid)>5 
                for timepoint=1:epochlength
                    [r_Pearson,t,p_Pearson] = Pearson(valid(:,con),condata(timepoint,:),0);
                    Pearson_result(timepoint,1)=r_Pearson;
                end
            else 
                Pearson_result(:,:)=nan;
            end
            if con==1
                allPearson_result1=cat(2,allPearson_result1,Pearson_result);
            elseif con==2
                allPearson_result2=cat(2,allPearson_result2,Pearson_result);
            elseif con==3
                allPearson_result3=cat(2,allPearson_result3,Pearson_result);
            elseif con==4
                allPearson_result4=cat(2,allPearson_result4,Pearson_result);
            elseif con==5
                allPearson_result5=cat(2,allPearson_result5,Pearson_result);
            elseif con==6
                allPearson_result6=cat(2,allPearson_result6,Pearson_result);
            elseif con==7
                allPearson_result7=cat(2,allPearson_result7,Pearson_result);
            elseif con==8
                allPearson_result8=cat(2,allPearson_result8,Pearson_result);
            end
        end
     end
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_matchRT.txt',drive,trialid(tid)),'allPearson_result1','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_matchERR.txt',drive,trialid(tid)),'allPearson_result2','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_comparRT.txt',drive,trialid(tid)),'allPearson_result3','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_comparERR.txt',drive,trialid(tid)),'allPearson_result4','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_raven.txt',drive,trialid(tid)),'allPearson_result5','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_dot.txt',drive,trialid(tid)),'allPearson_result6','-ascii');
%      save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_sub.txt',drive,trialid(tid)),'allPearson_result7','-ascii');
       save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_m_cbehav_learn_192trial\\item%d_corr_math.txt',drive,trialid(tid)),'allPearson_result8','-ascii');
end

