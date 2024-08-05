clear;
drive='m:\人工学习成人数据\';
epochlength=1401;
epochlength_base=1201;
allbeh(:,1)= xlsread([drive,'48artificialLearnERP\BehaveAnalysis\sub_allresults.xls'],'sub_allresults','AJ2:AJ48');
alltemp=zeros(144*epochlength,31,47);
sub=[1:2 4:48];
for subid=1:length(sub)
    alltemp0=load(sprintf('%sallbrain\\singletrial_data_150\\compare_sub%d.txt',drive,sub(subid)));
    alltemp(:,:,subid)=alltemp0';
end
for trialid=[1112:1114 1121 1123 1124 1131 1132 1134 1141:1143 1212:1214 1221 1223 1224 1231 1232 1234 1241:1243 2112:2114 2121 2123 2124 2131 2132 2134 2141:2143 2212:2214 2221 2223 2224 2231 2232 2234 2241:2243 3112:3114 3121 3123 3124 3131 3132 3134 3141:3143 3212:3214 3221 3223 3224 3231 3232 3234 3241:3243  4112:4114 4121 4123 4124 4131 4132 4134 4141:4143 4212:4214 4221 4223 4224 4231 4232 4234 4241:4243 5112:5114 5121 5123 5124 5131 5132 5134 5141:5143 5212:5214 5221 5223 5224 5231 5232 5234 5241:5243 6112:6114 6121 6123 6124 6131 6132 6134 6141:6143 6212:6214 6221 6223 6224 6231 6232 6234 6241:6243]
    trialid
    allPearson_result1=[];
    for channel=1:31
        Pearson_result=zeros(epochlength,1);
        valid=[];
        condata=[];
        condata_count=1;
        for subid=1:length(sub)
            trial=load(sprintf('%s48artificialLearnERP\\BehaveAnalysis\\resingletrial\\compar_%d.txt',drive,sub(subid)));
            %subid,blockid,tasktrid,RT,acc,trialid,symb1,symb2
            for i=1:length(trial)
                if ( trial(i,5)==1 && trial(i,6)==trialid )  %%Only focusing on correct trials, index by trial id.
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

%         tt=find(mean(condata(1:epochlength,:))==0);
%         condata(:,tt)=[];
%         valid(tt,:)=[];

        for con=1 %%beh
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
            end
        end

    end
    save(sprintf('%sallbrain\\Correlation_results\\ItemCorr_ERP_behav_compar_144trial_RTmean\\item%d_corr_rt.txt',drive,trialid),'allPearson_result1','-ascii');
end

