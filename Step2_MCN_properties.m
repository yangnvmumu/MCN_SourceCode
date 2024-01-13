%% Computation of MCN properties
close all
clear all
clc
SavePath='***\MCN_properties\';mkdir(SavePath);
load('***\MCN\MCN.mat');
for Sub = 1:size(MCN,1)
    CorrMatrix=squeeze(MCN(Sub,:,:));
    [m,n]=size(CorrMatrix);
    Re_CorrMatrix =CorrMatrix-diag(diag(CorrMatrix));      
    % clustering coefficient
    MCN_Propertise(Sub,1) = mean(clustering_coef_wu(Re_CorrMatrix));
    % characteristic path length
    Matrix11 = ones(size(Re_CorrMatrix))-Re_CorrMatrix;
    Matrix11(1:n+1:end) = 0;
    [D11 B11] = distance_wei(Matrix11);
    MCN_Propertise(Sub,2) = sum(sum(D11))/(m*(m-1));
    % global efficiency
    MCN_Propertise(Sub,3) = efficiency_wei(Re_CorrMatrix);
    % local efficiency
    MCN_Propertise(Sub,4) = mean(efficiency_wei(Re_CorrMatrix,1));
    clear CorrMatrix Re_CorrMatrix
end 
save([SavePath,'MCN_Propertise.mat'],'MCN_Propertise');
