%% Differential MCN properties between high and low flexibility groups
clear all;clc
load('***\MCN_properties\HF_Propertise.mat');
load('***\MCN_properties\LF_Propertise.mat');
Threshold=0.05;
[h,p,~,t]=ttest2(HF_Propertise,LF_Propertise,Threshold,'both');
[P_ida,P_idb] = fdr(p,Threshold);
FDR_p = p;
FDR_p(FDR_p>P_ida) = 0;
FDR_p(FDR_p ~=0) = 1;
SavePath='***\MCN_Difference_between_HF_LF\';mkdir(SavePath);
save([SavePath,'MCN_Difference_between_HF_LF.mat'],'FDR_p','p');
