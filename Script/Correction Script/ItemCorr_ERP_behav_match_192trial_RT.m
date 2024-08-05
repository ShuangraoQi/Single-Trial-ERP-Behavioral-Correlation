clear;
drive='m:\人工学习成人数据\';
epochlength=1401;
epochlength_base=1201;

alltemp=zeros(192*epochlength,31,47);
sub=[1:2 4:48];
for subid=1:length(sub)
    subid
    alltemp0=load(sprintf('%sallbrain\\singletrial_data_150\\match_sub%d.txt',drive,sub(subid)));
    alltemp(:,:,subid)=alltemp0';
end
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
for tid=1:length(trialid)%%[1 45 47 95 96 141:144 189 190]%%
    allPearson_result=[];
    trialid(tid)
    for channel=1:31
        Pearson_result=zeros(epochlength,1);
        validrt=[];
        condata=[];
        condata_count=1;
        for subid=1:length(sub)
            trial=load(sprintf('%s48artificialLearnERP\\BehaveAnalysis\\singletrial\\match_%d.txt',drive,sub(subid)));
            %subid,blockid,tasktrid,RT,acc,trialid,symb1,symb2
            for i=1:length(trial)
                if ( trial(i,5)==1 && trial(i,6)==trialid(tid) )  %%Only focusing on correct trials, index by trial id.
                    temp=alltemp((i-1)*epochlength+1:i*epochlength,channel,subid);
                    aa=find(isnan(temp));
                    if length(aa)==0
                        condata(:,condata_count)=temp;
                        validrt=cat(1,validrt,trial(i,4));
                        condata_count=condata_count+1;
                        break;
                    end
                end
            end
        end
        
        tt=find(mean(condata(1:epochlength,:))==0);
        condata(:,tt)=[];
        validrt(tt,:)=[];
        
        if length(validrt)>5
            for timepoint=1:epochlength
                [r_Pearson,t,p_Pearson] = Pearson(validrt,condata(timepoint,:),0);
                Pearson_result(timepoint,1)=r_Pearson;
            end
        else
            Pearson_result(:,:)=nan;
        end
        allPearson_result=cat(2,allPearson_result,Pearson_result);
    end
    save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_behav_match_192trial_RT\\item%d_corr.txt',drive,trialid(tid)),'allPearson_result','-ascii');
end

