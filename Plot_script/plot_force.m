clear all;
clc;
close all;


hfig = figure('Units','centimeters','Position', [100, 100, 8.4, 6]);
hold on 
file_name = "dati/bianco_3_s";
[el4,res4] = elastic_parameters(file_name,0.5)

file_name = "test_piatto/bianco_3_s";
[el4,res4] = elastic_parameters_flat(file_name,2)

file_name = "test_parab/bianco_3_s";
[el4,res4] = elastic_parameters_parab(file_name,0.5)

xlabel("Time [s]",'Interpreter','latex',"FontSize",8)
ylabel("Force [N]",'Interpreter','latex',"FontSize",8)
set(gca,'TickLabelInterpreter','latex','FontSize', 8)
legend(["$Sphe Est$", "$Sphe Real$","$Flat Est$", "$Flat Real$","$Parab Est$", "$Parab Real$"],'Interpreter','latex','FontSize', 8);

saveas(hfig,'figures/plot_force.eps','epsc')
hold off