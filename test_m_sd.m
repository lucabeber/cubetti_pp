clear all;
clc;
close all;
addpath("functions/")
% file_name = "dati/arancio_3_d";
% [el1,visc1] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/arancio_3_s";
% [el2,visc2] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/arancio_4_d";
% [el3,visc3] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/arancio_4_s";
% [el4,visc4] = elastic_parameters(file_name,0.5)

% 
% 
% el = [el1, el2, el3, el4]
% mean_el_arancio = mean(el)
% std_el_arancio = std(el)

%% Test with spheric tip
% 
% file_name = "dati/bianco_3_s";
% [el1,res1] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/bianco_3_d";
% [el2,res2] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/bianco_4_s";
% [el3,res3] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/bianco_4_d";
% [el4,res4] = elastic_parameters(file_name,0.5)
% 
% file_name = "test_nuovi_cubetti/bianco_1_s";
% [el1,res1] = elastic_parameters(file_name,0.5)
% 
% file_name = "test_nuovi_cubetti/bianco_2_s";
% [el2,res2] = elastic_parameters(file_name,0.5)
% 
% file_name = "test_nuovi_cubett2i/bianco_3_s";
% [el3,res3] = elastic_parameters(file_name,0.5)
% 
% file_name = "test_nuovi_cubetti/bianco_4_s";
% [el4,res4] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_msfera/bianco_1_p";
[el3,res3] = elastic_parameters_half(file_name,0.5)

file_name = "test_nuovi_msfera/bianco_4_p";
[el4,res4] = elastic_parameters(file_name,0.5)


el = [el1, el2, el3, el4]
mean_el_bianco = mean(el)
std_el_bianco = std(el)

%%
% file_name = "dati/rosa_3_s";
% [el1,res1] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/rosa_3_d";
% [el2,res2] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/rosa_4_s";
% [el3,res3] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/rosa_4_d";
% [el4,res4] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/rosa_1_p";
[el1,res1] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/rosa_2_p";
[el2,res2] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/rosa_3_p";
[el3,res3] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/rosa_4_p";
[el4,res4] = elastic_parameters(file_name,0.5)

el = [el1, el2, el3, el4]
mean_el_rosa = mean(el)
std_el_rosa = std(el)
%%
% file_name = "dati/grigio_3_s";
% [el1,res1] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/grigio_3_s";
% [el2,res2] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/grigio_4_s";
% [el3,res3] = elastic_parameters(file_name,0.5)
% 
% file_name = "dati/grigio_4_d";
% [el4,res4] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/grigio_1_p";
[el1,res1] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/grigio_2_p";
[el2,res2] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/grigio_3_p";
[el3,res3] = elastic_parameters(file_name,0.5)

file_name = "test_nuovi_cubetti/grigio_4_p";
[el4,res4] = elastic_parameters(file_name,0.5)

el = [el1, el2, el3, el4]
mean_el_grigio = mean(el)
std_el_grigio = std(el)

%%

el_sp = [mean_el_bianco,mean_el_rosa,mean_el_grigio]
std_sp = [std_el_bianco,std_el_rosa,std_el_grigio]

%% Test with flat tip 


file_name = "test_nuovi_piatto/bianco_1_p";
[el1,res1] = elastic_parameters_flat(file_name,0.5)

file_name = "test_nuovi_piatto/bianco_2_p";
[el2,res2] = elastic_parameters_flat(file_name,0.5)

file_name = "test_nuovi_piatto/bianco_3_p";
[el3,res3] = elastic_parameters_flat(file_name,0.5)

file_name = "test_nuovi_piatto/bianco_4_p";
[el4,res4] = elastic_parameters_flat(file_name,0.5)



el = [el1, el2, el3, el4]
mean_el_bianco = mean(el)
std_el_bianco = std(el)
%%
file_name = "test_nuovi_piatto/rosa_1_p";
[el1,res1] = elastic_parameters_flat(file_name,2)
%%
file_name = "test_nuovi_piatto/rosa_2_p";
[el2,res2] = elastic_parameters_flat(file_name,0.5)

file_name = "test_nuovi_piatto/rosa_3_p";
[el3,res3] = elastic_parameters_flat(file_name,0.6)

file_name = "test_nuovi_piatto/rosa_4_p";
[el4,res4] = elastic_parameters_flat(file_name,0.7)


el = [el1, el2, el3, el4]
mean_el_rosa = mean(el)
std_el_rosa = std(el)
%%


file_name = "test_nuovi_piatto/grigio_1_p";
[el1,res1] = elastic_parameters_flat(file_name,2)

file_name = "test_nuovi_piatto/grigio_2_p";
[el2,res2] = elastic_parameters_flat(file_name,2)

file_name = "test_nuovi_piatto/grigio_3_p";
[el3,res3] = elastic_parameters_flat(file_name,2)

file_name = "test_nuovi_piatto/grigio_4_p";
[el4,res4] = elastic_parameters_flat(file_name,2)

el = [el1, el2, el3, el4]
mean_el_grigio = mean(el)
std_el_grigio = std(el)
el = [el1, el2, el3, el4]
mean_el_grigio = mean(el)
std_el_grigio = std(el)



el_fl = [mean_el_bianco,mean_el_rosa,mean_el_grigio]
std_fl = [std_el_bianco,std_el_rosa,std_el_grigio]

%% Test with parabolic tip

file_name = "test_parab/bianco_3_s";
[el1,res1] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/bianco_3_d";
[el2,res2] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/bianco_4_s";
[el3,res3] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/bianco_4_d";
[el4,res4] = elastic_parameters_parab(file_name,0.5)



el = [el1, el2, el3, el4]
mean_el_bianco = mean(el)
std_el_bianco = std(el)

%%
file_name = "test_parab/rosa_3_s";
[el1,res1] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/rosa_3_d";
[el2,res2] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/rosa_4_s";
[el3,res3] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/rosa_4_d";
[el4,res4] = elastic_parameters_parab(file_name,0.5)



el = [el1, el2, el3, el4]
mean_el_rosa = mean(el)
std_el_rosa = std(el)

%%
file_name = "test_parab/grigio_3_s";
[el1,res1] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/grigio_3_d";
[el2,res2] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/grigio_4_s";
[el3,res3] = elastic_parameters_parab(file_name,0.5)

file_name = "test_parab/grigio_4_d";
[el4,res4] = elastic_parameters_parab(file_name,0.5)



el = [el1, el2, el3, el4]
mean_el_grigio = mean(el)
std_el_grigio = std(el)



el_pr = [mean_el_bianco,mean_el_rosa,mean_el_grigio]
std_pr = [std_el_bianco,std_el_rosa,std_el_grigio]

%%
el_sp
el_fl
el_pr


%%

