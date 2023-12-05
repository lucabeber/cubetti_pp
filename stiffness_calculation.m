clc
close all
clear 

%% Import data from txt file

file_name = "bianco_2.txt";

data2 = readmatrix("/Users/lucabeber/Documents/Dottorato/Cubes/Data_txt/Nuovi fine novembre/56x56x60 a.TXT");
data = readmatrix("/Users/lucabeber/Documents/Dottorato/Cubes/Data_txt/Bianco2 meno 5mm.txt");

%% Plot of displacement vs force
figure;

hold on
plot(data(1:2*1595,2), data(1:2*1595,3))
plot(data2(:,2), data2(:,3))
hold off
xlabel("mm")
ylabel("N")
legend(["test novembre","test dicembre"])
%% Interpolation of data
[~,pos_max] = max(data(1:1500,3));
stiff = lsqr(data(600:pos_max,2)/1000, data(600:pos_max,3))
[~,pos_max2] = max(data2(:,3));
stiff2 = lsqr(data(300:pos_max2,2)/1000, data(300:pos_max2,3))
%% Plot of interpolated data

figure;
time = 0:1/50:1/50*1500;
time2 = 0:1/25:1/25*(799);

plot(time,data(1:1501,3))
hold on
plot(time2,data2(1:800,3))
plot(time,data(1:1501,2)/1000*stiff)
plot(time2,data2(1:800,2)/1000*stiff2)
legend(["Novembre","Dicembre"])




