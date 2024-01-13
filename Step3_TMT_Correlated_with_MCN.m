%% Relationship between MCN and TMT B-A scores  
clear all
close all
clc
SavePath='***\TMT_Correlated_with_MCN\';mkdir(SavePath);
load('***\MCN\MCN.mat');
TMTBA_Score=xlsread('***\TMTBA_Scores.xlsx');
Pearson_r=zeros(size(MCN,2),size(MCN,2));
Pearson_p=zeros(size(MCN,2),size(MCN,2));
for i=1:size(MCN,2)
    for j=i+1:size(MCN,2)
        [Pearson_r(i,j),Pearson_p(i,j)]=corr(squeeze(MCN(:,i,j)),TMTBA_Score);
    end
end
Threshold = 0.01;   
[P_ida,P_idb] = fdr(Pearson_p,Threshold);
Pearson_p_FDR=Pearson_p;
Pearson_p_FDR(Pearson_p_FDR>P_ida) = 0;
Pearson_p_FDR(Pearson_p_FDR ~=0) = 1;
Pearson_r_FDR=Pearson_p_FDR.*Pearson_r;
save([SavePath,'TMT_Correlated_with_MCN.mat'],'Pearson_p','Pearson_p_FDR','Pearson_r','Pearson_r_FDR');
