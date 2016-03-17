close all
clear all
clc

load('ROI_Subject003_sedMCS.mat')

%% Taking only data in interesting ROIs
N_start=4;
N_end=66;

%% Encode data in a matrix
data_matrix=zeros(N_end-N_start+1,297);

for i=N_start:N_end
    data_matrix(i-N_start+1,:)=data{i}; % Perhaps you need to use d1data or d2data instead of data.. I don't know the difference. 
end

%% Set parameters and options

% Width of the window to be used

w = 20; % Units are TRs and classical values are between 20 and 40 TRs

% Filtering

Leonardi_filtering = 'off'; % I set it to off (i.e. no filtering) but you might be required by a reviewer to apply it.

% Shape of window

shape = 'squared'; % You may also try with a tapered window, but the difference should not be very significative.

% Run sliding window 
[w_corr,var_mat,var_vec] = get_windowed_correlation(data_matrix,w,Leonardi_filtering,shape);

% You may check the description of the above function for details about the
% different outputs. I think you would typically need 'var_vec' and perhaps plot
% that on the brain to vizualize which ROIs are more 'variable'.
