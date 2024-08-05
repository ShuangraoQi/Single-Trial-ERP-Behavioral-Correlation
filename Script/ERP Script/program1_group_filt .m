clc
clear
cd 'M:\人工学习成人数据\allbrain';
subnum=47;
channelnum=31;
  a=ones(1,3201);
  b=ones(1,1401);
  c=ones(1,1001);
for channelnum=[1:31]  
    channelnum 
    learn1eeg=zeros(channelnum,3201);
    learn2eeg=zeros(channelnum,3201);
    learn1num=0;
    learn2num=0;
  
    match1eeg=zeros(channelnum,1401);
    match2eeg=zeros(channelnum,1401);
    match1num=0;
    match2num=0;

     comp1eeg=zeros(channelnum,1401);
    comp1num=0;
    comp2eeg=zeros(channelnum,1401);
    comp2num=0;
 
for sub=[1 :2  4:48];
   
    learn1 = load(['result_150\filt_avglearn1_' int2str(sub) '.mat'],'-ascii');
   if isnan(learn1(channelnum,:)) == a
      continue
   else
       learn1eeg(channelnum,:) = learn1eeg(channelnum,:) + learn1(channelnum,:) ;
           learn1num=learn1num+1;
   end
   
    learn2 = load(['result_150\filt_avglearn2_' int2str(sub) '.mat'],'-ascii');
    if isnan(learn2(channelnum,:)) == a
      continue
   else
       learn2eeg(channelnum,:) = learn2eeg(channelnum,:) + learn2(channelnum,:) ;
       learn2num=learn2num+1;
    end

    match1 = load(['result_150\filt_avgmatch1_' int2str(sub) '.mat'],'-ascii');
   if isnan(match1(channelnum,:)) == b
      continue
   else
       match1eeg(channelnum,:) =  match1eeg(channelnum,:) + match1(channelnum,:) ;
        match1num = match1num+1;
   end
  
    match2 = load(['result_150\filt_avgmatch2_' int2str(sub) '.mat'],'-ascii');
   if isnan(match2(channelnum,:)) == b
      continue
   else
       match2eeg(channelnum,:) =  match2eeg(channelnum,:) + match2(channelnum,:) ;
             match2num = match2num+1;
   end

     comp1avg = load(['filt_avgcomp1_' int2str(sub) '.mat'],'-ascii');
   if isnan(comp1avg(channelnum,:)) == b
      continue
   else
       comp1eeg(channelnum,:) =comp1eeg(channelnum,:) +comp1avg(channelnum,:) ;
           comp1num = comp1num+1;
   end
   
   comp2avg = load(['filt_avgcomp2_' int2str(sub) '.mat'],'-ascii');
   if isnan(comp2avg(channelnum,:)) == b
      continue
   else
         comp2eeg(channelnum,:) =  comp2eeg(channelnum,:) +comp2avg(channelnum,:) ;
         comp2num = comp2num+1;
   end
   

end

learn1avg(channelnum,:)=learn1eeg(channelnum,:)/learn1num;
learn2avg(channelnum,:)=learn2eeg(channelnum,:)/learn2num;
match1avg(channelnum,:)=match1eeg(channelnum,:)/match1num;
 match2avg(channelnum,:)=match2eeg(channelnum,:)/match2num;
 comp1(channelnum,:)=comp1eeg(channelnum,:)/comp1num;   
comp2(channelnum,:)=comp2eeg(channelnum,:)/comp2num;  

 end
 
learn1avg=learn1avg';
learn1avg=double(learn1avg);
save('result_150\learn1avg.txt', 'learn1avg','-ascii');
save(['result_150\learn1avg.mat'],'learn1avg');
learn2avg=learn2avg';
learn2avg=double(learn2avg);
save('result_150\learn2avg.txt', 'learn2avg','-ascii');
save(['result_150\learn2avg.mat'],'learn2avg');

match1avg=match1avg';
match1avg=double(match1avg);
save('result_150\match1avg.txt', 'match1avg','-ascii');
save(['result_150\match1avg.mat'],'match1avg');
match2avg=match2avg';
match2avg=double(match2avg);
save('result_150\match2avg.txt', 'match2avg','-ascii');
save(['result_150\match2avg.mat'],'match2avg');

comp1=comp1';
comp1=double(comp1);
save('result_150\comp1avg.txt', 'comp1','-ascii');
save(['result_150\comp1avg.mat'],'comp1');
comp2=comp2';
comp2=double(comp2);
save('result_150\comp2avg.txt', 'comp2','-ascii');
save(['result_150\comp2avg.mat'],'comp2');
