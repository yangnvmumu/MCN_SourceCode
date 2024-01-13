%% Construction of MCN
close all
clear all
clc
SavePath='***\MCN\';mkdir(SavePath);
load('***\Zscored_sMRI_features.mat');
load('***\Zscored_dMRI_features.mat');
load('***\Zscored_fMRI_features.mat');
load('***\Zscored_EEG_features.mat');

% Features of dMRI
Feature(1,:,:) = Zscored_dMRI_FA;
Feature(2,:,:) = Zscored_dMRI_MD;
% Features of sMRI
Feature(3,:,:) = Zscored_sMRI_CT;
Feature(4,:,:) = Zscored_sMRI_CI;
Feature(5,:,:) = Zscored_sMRI_SA;
Feature(6,:,:) = Zscored_sMRI_MC;
Feature(7,:,:) = Zscored_sMRI_GC;
Feature(8,:,:) = Zscored_sMRI_GM;
Feature(9,:,:) = Zscored_sMRI_FI;
% Features of fMRI
Feature(10,:,:) = Zscored_fMRI_ReHo;
Feature(11,:,:) = Zscored_fMRI_ALFF;
Feature(12,:,:) = Zscored_fMRI_fALFF;
% Features of EEG
Feature(13,:,:) = Zscored_EEG_BC;
Feature(14,:,:) = Zscored_EEG_CC;
Feature(15,:,:) = Zscored_EEG_DC;
Feature(16,:,:) = Zscored_EEG_EC;

% MCN construction by Pearson's correlation
for sub=1:size(Feature,2)
    for m=1:size(Feature,3)
        for n=1:size(Feature,3)
            IndexROI1=squeeze(Feature(:,sub,m));
            IndexROI2=squeeze(Feature(:,sub,n));
            [r,p] = corr(IndexROI1,IndexROI2);
            MCN(sub,m,n)=r;
        end
    end
end
save([SavePath,'MCN.mat'],'MCN');

