clear;
drive='m:\�˹�ѧϰ��������\allbrain\';
txtname={'r_result','t_result','t_result_05','t_result_005','t_result_001','p_result'};
conname={'first3run','second3run'};
conbehname={'matchRT','matchERR','comparRT','comparERR','raven','dot','sub','math'};
for coneeg=2%%1:2
    for conbeh=8%%1:8
        for txt=1:6
            EEG = pop_importdata('dataformat','ascii','nbchan',0,'data',sprintf('%sCorrelation_results\\ItemCorr_ERP_m_cbehav_learn_2run_Group\\learn_%s_corr_%s_%s.txt',drive,conname{coneeg},conbehname{conbeh},txtname{txt}),'srate',1000,'pnts',0,'xmin',0);
            EEG = pop_eegfiltnew(EEG, [], 30, 440, 0, [], 0);
            filt_data=[];
            filt_data=double(EEG.data');
            save(sprintf('%sCorrelation_results/ItemCorr_ERP_m_cbehav_learn_2run_Group/learn_%s_corr_%s_%s_filt.txt',drive,conname{coneeg},conbehname{conbeh},txtname{txt}),'filt_data','-ascii'); 
        end
    end
end
