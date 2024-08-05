clear;
drive='h:\人工学习成人数据\allbrain\result\';
%% 滤波
conname={'learn1','learn2','match1','match2','comp1','comp2'};  
 for con=1:16
    for sub=[1:2 4:48]
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab; 
    EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',[drive,'\avg',conname{con},'_',int2str(sub),'.mat'],'srate',1000,'pnts',0,'xmin',0);
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
    EEG = pop_eegfiltnew(EEG, [], 30, 440, 0, [], 0);
    filt_data=[];
    filt_data=double(EEG.data);
    save(sprintf('%s/filt_avg%s_%d.mat',drive,conname{con},sub),'filt_data','-ascii'); 
    end
 end

 
