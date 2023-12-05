function ls_coeff = viscoelastic_parameters(file_name)
    
    bag = ros2bagreader(file_name);

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
    
    force = -(force_z - mean(force_z(1:700)));
    start = find(force>error,1)-200;
    finish = start + 15 * 500;
    
    f = smoothdata(force,"SmoothingFactor",0.01);
    df = smooth(diff(f)/0.002);
    ddf = smooth(diff(df)/0.002);
    
    
    n = 1.5;
    
    penetration = zeros(finish-start,1);
    for i = 1:finish-start
        penetration(i) =  position_real(start)-position_real(start+i);
    end
    
    p = smooth(penetration);
    dp = -velocity_z;
    ddp = smooth(diff(dp)/0.002);
    
    figure;
    plot(p)
    X = real([ ...
        dp(start:finish-1).*(p.^(n-1)), ...
        ddp(start:finish-1).*(p.^(n-1)), ...
        -df(start:finish-1), ...
        -ddf(start:finish-1), ...
        ]);
    ls_coeff = lsqr(X,force(start:finish-1));

%     elast = 3 * ls_coeff(1) / (4 * sqrt(0.02));
%     visc = ls_coeff(2)/2;

    figure;
    plot(ls_coeff(1)*X(:,1)  + ls_coeff(2)*X(:,2) + ls_coeff(3)*X(:,3) +ls_coeff(4)*X(:,4) )
    hold on 
    plot(force(start:finish-1))
    hold off 
    legend(["est","ft"])
end