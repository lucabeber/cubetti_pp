clear all;
clc;
close all;

addpath('functions/')
file_name = "bianco_3_sw";


%%


file_name = "test_ur/bianco_3_sw";
max_pen = 0.004;
n = 1.5;
min_elements = 400;
error=0.4;
bag = ros2bagreader("Test_multipli/" + file_name);

bag_data = select(bag,"Topic","/data_control");
mes_data = readMessages(bag_data);

n_mess = bag_data.NumMessages;


sim_time = zeros(n_mess,1);
for i = 1:n_mess
    sim_time(i) =  mes_data{i, 1}.data(1);  
end
initial_time = sim_time(1);
sim_time(:) = sim_time(:)-initial_time;
dT = sim_time(2);


force_z = zeros(n_mess,1);
for i = 1:n_mess
    force_z(i) =  mes_data{i, 1}.data(6);  
end

position_real = zeros(n_mess,1);
position_des = zeros(n_mess,1);
for i = 1:n_mess
    position_real(i) =  mes_data{i, 1}.data(3);  
    position_des(i) =  mes_data{i, 1}.data(2); 
end

velocity_z = zeros(n_mess,1);
for i = 1:n_mess
    velocity_z(i) =  mes_data{i, 1}.data(5);  
end

velocity_z = smoothdata(velocity_z,"SmoothingFactor",0.1);

force = -(force_z - mean(force_z(1:min_elements)));
warning('off', 'all');
error = fminsearch(@(x)res_minimization(x,force,300,position_real,max_pen,min_elements,n),error);
warning('on', 'all');
k = 1;
flag = true;
while(flag)
    start = find(force>error,k)-300;
    start = start(k);
    
    if start>min_elements
        flag = false;
    end
    k=k+1;
end
    
        
penetration = - position_des + position_des(start);
finish = find(penetration>max_pen);

X = real([(penetration(start:finish-1)).^(n)]);%,-velocity_z(start:finish-1).*(penetration.^(n-1))]);
[ls_coeff,~,res] = lsqr(X,force(start:finish-1));

elast = 3 * ls_coeff(1) / (4  * sqrt(0.01)) * (1-0.5^2);
visc = 0;%ls_coeff(2)/2;

figure;
plot(ls_coeff(1)*X(:,1))%  + ls_coeff(2)*X(:,2))
hold on 
plot(force(start:finish-1))
hold off 
legend(["est","ft"])

%%
acc = diff(-velocity_z)*500;
figure;
plot(acc)
%%

X = real([(penetration(finish+1000:end)).^(n),-velocity_z(finish+1000:end).*(penetration(finish+1000:end).^(n-1)),acc(finish-1+1000:end)]);%,-velocity_z(start:finish-1).*(penetration.^(n-1))]);
[ls_coeff,~,res] = lsqr(X,force(finish+1000:end));
figure;
plot(ls_coeff(1)*X(:,1))%  + ls_coeff(2)*X(:,2))
hold on 
plot(force(finish+1000:end))
hold off 
legend(["est","ft"])







