clear all;
clc;
close all;
addpath("functions/")

%%

file_name = "Bianco/bianco_1";
[el1,res1] = elastic_parameters(file_name)

file_name = "Bianco/bianco_2";
[el2,res2] = elastic_parameters(file_name)

file_name = "Bianco/bianco_3";
[el3,res3] = elastic_parameters(file_name)

file_name = "Bianco/bianco_4";
[el4,res4] = elastic_parameters(file_name)



el = [el1, el2, el3, el4]
mean_el_bianco = mean(el)
std_el_bianco = std(el)

res_bianco = mean([res1,res2,res3,res4])
%%

file_name = "Rosa/rosa_1";
[el1,res1] = elastic_parameters(file_name)

file_name = "Rosa/rosa_2";
[el2,res2] = elastic_parameters(file_name)

% file_name = "Rosa/rosa_3";
% [el3,visc3] = elastic_parameters(file_name)

file_name = "Rosa/rosa_4";
[el4,res4] = elastic_parameters(file_name)



el = [el1, el2, el3, el4]
mean_el_rosa = mean(el)
std_el_rosa = std(el)

res_rosa = mean([res1,res2,res3,res4])
%%
file_name = "Grigio/grigio_1";
[el1,res1] = elastic_parameters(file_name)

file_name = "Grigio/grigio_2";
[el2,res2] = elastic_parameters(file_name)

file_name = "Grigio/grigio_3";
[el3,res3] = elastic_parameters(file_name)

file_name = "Grigio/grigio_4";
[el4,res4] = elastic_parameters(file_name)



el = [el1, el2, el3, el4];
mean_el_grigio = mean(el)
std_el_grigio = std(el)

res_grigio = mean([res1,res2,res3,res4])

[mean_el_bianco,mean_el_rosa,mean_el_grigio]
[std_el_bianco,std_el_rosa,std_el_grigio]
[res_bianco,res_rosa,res_grigio]