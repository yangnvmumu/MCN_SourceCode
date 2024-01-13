%% Differential MCN between high and low flexibility groups
close all
clear all
clc
load('***\MCN\HF_MCN.mat');
load('***\MCN\LF_MCN.mat');
Threshold=0.01;
[h0,p0,ci0,stats0]=ttest2(HF_MCN,LF_MCN,Threshold,'left');
[h1,p1,ci1,stats1]=ttest2(HF_MCN,LF_MCN,Threshold,'right');
[P_ida,P_idb] = fdr(p0,Threshold);
FDR_p0 = p0;
FDR_p0(FDR_p0>P_ida) = 0;
FDR_p0(FDR_p0 ~=0) = 1;
[P_ida,P_idb] = fdr(p1,Threshold);
FDR_p1 = p1;
FDR_p1(FDR_p1>P_ida) = 0;
FDR_p1(FDR_p1 ~=0) = 1;
SavePath='***\MCN_Difference_between_HF_LF\';mkdir(SavePath);
save([SavePath,'MCN_Difference_between_HF_LF.mat'],'FDR_p0','FDR_p1');

