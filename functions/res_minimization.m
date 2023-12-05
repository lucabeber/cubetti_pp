function res = res_minimization(error,force,data,position_realt,max_pen,min_element,n)
        k = 1;
        flag = true;
        while(flag)
            start = find(force>error,k)-data;
            start = start(k);
            
            if start>min_element
                flag = false;
            end
            k=k+1;
        end
        
        penetration = - position_realt + position_realt(start);
        finish = find(penetration>max_pen);

        X = real([(penetration(start:finish-1)).^(n)]);%,-velocity_z(start:finish-1).*(penetration.^(n-1))]);
        
        [~,~,res] = lsqr(X,force(start:finish-1));
end