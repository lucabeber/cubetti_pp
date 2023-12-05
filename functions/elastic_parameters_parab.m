function [elast,res] = elastic_parameters_parab(file_name,error)
    max_pen = 0.0025;
    min_element = 400;
    n = 1.5;

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
    
    force = -(force_z - mean(force_z(1:min_element)));
    warning('off', 'all');
    error = fminsearch(@(x)res_minimization(x,force,300,position_real,max_pen,min_element,n),error);
    warning('on', 'all');
    k = 1;
    flag = true;
    while(flag)
        start = find(force>error,k)-300;
        start = start(k);
        
        if start>min_element
            flag = false;
        end
        k=k+1;
    end
    
    
        
    penetration = - position_real + position_real(start);
    finish = find(penetration>max_pen);

    X = real([(penetration(start:finish-1)).^(n)]);
    [ls_coeff, ~, res] = lsqr(X,force(start:finish-1));

    radious  = 1/((0.019156/0.015^2));
    elast = 3 * ls_coeff(1) / (4  * sqrt(radious)) * (1-0.5^2);
    sim_time = 0:0.002:0.002*(length(X)-1);
    visc = 0;%ls_coeff(2)/2;

    plot(sim_time,ls_coeff(1)*X(:,1))%  + ls_coeff(2)*X(:,2))
    
    plot(sim_time,force(start:finish-1))
    
    legend(["est","ft"])
end