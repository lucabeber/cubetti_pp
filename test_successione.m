clear all;
clc;
close all;
addpath("functions/")

%% Test with spheric tip
% 
% file_name = "/bianco_3_s_30";
% [el1,visc1] = elastic_parameters_multiple(file_name,0.5,380)

%%
% file_name = "/rosa_3_s_15";
% [el1,visc1] = elastic_parameters_multiple(file_name,0.5)

%%
file_name = "/rosa_3_s_5";
[el1,visc1] = elastic_parameters_multiple(file_name,0.5,270)

%%
file_name = "/rosa_3_s_0";
[el1,visc1] = elastic_parameters_multiple(file_name,0.5,270)

figure(100)
% legend(["span 30s","span 15s","span 5s","span 0s"])
legend(["span 5s","span 0s"])
%%
% file_name = "/bianco_3_s_60";
% [el1,visc1] = elastic_parameters_multiple(file_name,0.5)
