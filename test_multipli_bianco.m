close all
clear all 
clc

%%
% 
% file_name = "/bianco_4_d_120";
% [el1,~] = elastic_parameters_multiple(file_name,0.5,380);
%  
% file_name = "/bianco_4_d_70";
% [el2,~] = elastic_parameters_multiple(file_name,0.5,380);

%%

file_name = "/bianco_3_s_35";
[el1,~] = elastic_parameters_multiple(file_name,0.5,380);
 
file_name = "/bianco_3_d_35";
[el2,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_s_35";
[el3,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_d_35";
[el4,~] = elastic_parameters_multiple(file_name,0.5,380);
%%
% time = [0:22:22*19,0:22:22*19,0:22:22*19,0:22:22*19];
% el = [el1,el2,el3,el4];
time = [0:35:35*19,0:35:35*19];
el = [el2,el4];
model = fit(time',el','exp2')

% Example: 95% confidence interval
confInterval = predint(model, 0:0.1:15*19, 0.95, 'functional', 'on');

figure(101)
hold on;
%plot(time, el, 'bo'); % Scatter plot of data points


plot(0:0.1:15*19, model(0:0.1:15*19), 'c-', 'LineWidth', 2); % Fitted curve

% Overlay the confidence intervals
plot(0:0.1:15*19, confInterval, 'c--', 'LineWidth', 1.5);

hold off;
%%
% 
% file_name = "/bianco_3_s_22";
% [el1,~] = elastic_parameters_multiple(file_name,0.5,380);
% 
% file_name = "/bianco_3_d_22";
% [el2,~] = elastic_parameters_multiple(file_name,0.5,380);
% 
% file_name = "/bianco_4_s_22";
% [el3,~] = elastic_parameters_multiple(file_name,0.5,380);
% 
% file_name = "/bianco_4_d_22";
% [el4,~] = elastic_parameters_multiple(file_name,0.5,380);
% 
% % time = [0:22:22*19,0:22:22*19,0:22:22*19,0:22:22*19];
% % el = [el1,el2,el3,el4];
% time = [0:22:22*19,0:22:22*19];
% el = [el2,el4];
% model = fit(time',el','exp2')
% 
% % Example: 95% confidence interval
% confInterval = predint(model, 0:0.1:15*19, 0.95, 'functional', 'on');
% 
% figure(101)
% hold on;
% %plot(time, el, 'bo'); % Scatter plot of data points
% 
% 
% plot(0:0.1:15*19, model(0:0.1:15*19), 'b-', 'LineWidth', 2); % Fitted curve
% 
% % Overlay the confidence intervals
% plot(0:0.1:15*19, confInterval, 'b--', 'LineWidth', 1.5);
% 
% hold off;

%%

file_name = "/bianco_3_s_15";
[el1,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_3_d_15";
[el2,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_s_15";
[el3,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_d_15";
[el4,~] = elastic_parameters_multiple(file_name,0.5,380);


% time = [0:15:15*19,0:15:15*19,0:15:15*19,0:15:15*19];
% el = [el1,el2,el3,el4];
time = [0:15:15*19,0:15:15*19];
el = [el2,el4];
model = fit(time',el','exp2')

% Example: 95% confidence interval
confInterval = predint(model, 0:0.1:15*19, 0.95, 'functional', 'on');

figure(101)
hold on
%plot(time, el, 'bo'); % Scatter plot of data points


plot(0:0.1:15*19, model(0:0.1:15*19), 'r-', 'LineWidth', 2); % Fitted curve

% Overlay the confidence intervals
plot(0:0.1:15*19, confInterval, 'r--', 'LineWidth', 1.5);

hold off;
%%

file_name = "/bianco_3_s_0";
[el1,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_3_d_0";
[el2,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_s_0";
[el3,~] = elastic_parameters_multiple(file_name,0.5,380);

file_name = "/bianco_4_d_0";
[el4,~] = elastic_parameters_multiple(file_name,0.5,380);

%%
% time = [0:11:11*19,0:11:11*19,0:11:11*19,0:11:11*19];
% el = [el1,el2,el3,el4];
time = [0:10:10*19,0:10:10*19];
el = [el2,el4];

model = fit(time',el','exp2')

% Example: 95% confidence interval
confInterval = predint(model, 0:0.1:15*19, 0.95, 'functional', 'on');

figure(101)
hold on
%plot(time, el, 'bo'); % Scatter plot of data points


plot(0:0.1:15*19, model(0:0.1:15*19), 'g-', 'LineWidth', 2); % Fitted curve

% Overlay the confidence intervals
plot(0:0.1:15*19, confInterval, 'g--', 'LineWidth', 1.5);

hold off;

legend('Data', 'Fitted Curve', '95% Confidence Interval', 'Location', 'Best');
title('Fit Plot with Confidence Intervals');
xlabel('X-axis');
ylabel('Y-axis');
legend(["span 35", "+2sigma span 35", "-2sigma span 35","span 15", "+2sigma 15", "-2sigma 15","span 0", "+2sigma 0", "-2sigma 0"])


