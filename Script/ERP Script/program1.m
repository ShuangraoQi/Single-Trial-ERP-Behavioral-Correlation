clc
clear
cd 'm:\人工学习成人数据';
validTrialNum=[];

for sub=1%%[1:2 4:48]
    sub
    channel=31;
    samplingrate=1;
    if sub<=2
        samplingrate=50;
    end

    marker = load(['48artificialLearnERP\data\sub' int2str(sub) '.txt']);
    eeg=load(['allbrain\sub' int2str(sub) '.mat']);
    alllearingeeg=zeros(channel,3201*32*6);
    allmatcheeg=zeros(channel,1401*32*6);
    allcompaeeg=zeros(channel,1401*24*6);

    learn1=zeros(channel,3201);
    learn2=zeros(channel,3201);
    match1=zeros(channel,1401);
    match2=zeros(channel,1401);
    compeeg1=zeros(channelnum,1401);
    compeeg2=zeros(channelnum,1401);


    for channelnum=[1:31]


        learn1num=0;
        learn2num=0;
        match1num=0;
        match2num=0;
        compnum1=0;
        compnum2=0;
        %
        lnum=0;
        mfnum=0;
        mnum=0;
        cnum=0;
        for i=1:length(marker)
            %             %%learning-singeltrial
            if marker(i,7)~=0
                lnum=lnum+1;
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+3000) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                alllearingeeg(channelnum,lnum*3201-3200:lnum*3201)=targetdata;
            end
            %% match-singeltrial
            if marker(i,8)~=0
                mnum=mnum+1;
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                allmatcheeg(channelnum,mnum*1401-1400:mnum*1401)=targetdata;
            end

            %% compar-singeltrial
            if marker(i,5)~=0
                cnum=cnum+1;
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                allcompaeeg(channelnum,cnum*1401-1400:cnum*1401)=targetdata;
            end
            %
            %         %%% first3run
            if marker(i,7)~=0 && marker(i,2)<=3
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+3000) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                learn1(channelnum,:)=learn1(channelnum,:)+targetdata;
                learn1num=learn1num+1;
            end
            %%second3run
            if marker(i,7)~=0 && marker(i,2)>3
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+3000) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                learn2(channelnum,:)=learn2(channelnum,:)+targetdata;
                learn2num=learn2num+1;
            end

            if marker(i,8)~=0 && marker(i,2)<=3 && marker(i,10)==1
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                match1(channelnum,:)=match1(channelnum,:)+targetdata;
                match1num=match1num+1;
            end
            if marker(i,8)~=0 && marker(i,2)>3 && marker(i,10)==1
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                match2(channelnum,:)=match2(channelnum,:)+targetdata;
                match2num=match2num+1;

            end

            if abs(marker(i,5)- marker(i,6))~=0  && marker(i,2)<=3 && marker(i,10)==1
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                compeeg1(channelnum,:)=compeeg1(channelnum,:)+targetdata;
                compnum1=compnum1+1;
            end

            if abs(marker(i,5)- marker(i,6))~=0  && marker(i,2)>3 && marker(i,10)==1
                baseline=[];targetdata=[];
                baseline=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+0);
                targetdata=eeg.EEG.data(channelnum,round(marker(i,4)/samplingrate)-200:round(marker(i,4)/samplingrate)+1200) ;
                targetdata=targetdata(1,:)-mean(baseline(1,:),2);
                targetdata(find(targetdata>150))=150;
                targetdata(find(targetdata<-150))=-150;
                compeeg2(channelnum,:)=compeeg2(channelnum,:)+targetdata;
                compnum2=compnum2+1;
            end
        end
        if learn1num>0
            learn1(channelnum,:)=learn1(channelnum,:)/learn1num;
        else
            learn1(channelnum,:)=nan;
        end
        if learn2num>0
            learn2(channelnum,:)=learn2(channelnum,:)/learn2num;
        else
            learn2(channelnum,:)=nan;
        end
        if match1num>0
            match1(channelnum,:)=match1(channelnum,:)/match1num;
        else
            match1(channelnum,:)=nan;
        end
        if match2num>0
            match2(channelnum,:)=match2(channelnum,:)/match2num;
        else
            match2(channelnum,:)=nan;
        end
        if compnum1>0
            comp1(channelnum,:)=compeeg1(channelnum,:)/compnum1;
        else
            comp1(channelnum,:)=nan;
        end
        if compnum2>0
            comp2(channelnum,:)=compeeg2(channelnum,:)/compnum2;
        else
            comp2(channelnum,:)=nan;
        end

    end

    save(['allbrain\result_150\avglearn1_' int2str(sub) '.mat'],'learn1');
    save(['allbrain\result_150\avglearn2_' int2str(sub) '.mat'],'learn2');
    save(['allbrain\result_150\avgmatch1_' int2str(sub) '.mat'],'match1');
    save(['allbrain\result_150\avgmatch2_' int2str(sub) '.mat'],'match2');
    save(['allbrain\result_150\avgcomp1_' int2str(sub) '.mat'],'comp1');
    save(['allbrain\result_150\avgcomp2_' int2str(sub) '.mat'],'comp2');
    save(['allbrain\singletrial_data\learning_sub' int2str(sub) '.txt'],'alllearingeeg','-ascii');
    save(['allbrain\singletrial_data\match_sub' int2str(sub) '.txt'],'allmatcheeg','-ascii');
    save(['allbrain\singletrial_data\compare_sub' int2str(sub) '.txt'],'allcompaeeg','-ascii');
    save(['allbrain\singletrial_data_150\matchf_sub' int2str(sub) '.txt'],'allmatchfeeg','-ascii');
    save(['allbrain\singletrial_data_150\matchf_sub' int2str(sub) '.mat'],'allmatchfeeg');

end
