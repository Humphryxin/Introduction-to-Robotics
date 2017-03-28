function [x,y,theta] = goToPose(X_s, X_g)
%%% This function uses feedback control to make the robot go to some
%%% arbitrary position

    %%% timestep length
    Delta = 0.01;
    %%% transfer to radius degree
    X_s(3) = X_s(3)/180.0*pi;
    X_g(3) = X_g(3)/180.0*pi;
    %%% control law parameters, stable system
    K_rho = 0.2 ;
    K_alpha = 1;
    K_beta = -0.3;
    %%% Maximum Distance and angular difference to be considered as close enough
    Max_dis_res = 0.0001;
    Max_ang_res = 0.01;
    Max_iteration = 5000;
    t = 1;
    %%% initialization of pos
    x_t = X_s(1);
    y_t = X_s(2);
    theta_t = X_s(3);
    x = x_t;
    y = y_t;
    theta = theta_t;
    %%% loop until [x, y] is near x_g
    FLAG_GOAL = false;
    
    %%%  compute the Transition
    X_g_inv = [cos(X_g(3)), sin(X_g(3));-sin(X_g(3)),cos(X_g(3))]*[-X_g(1);-X_g(2)];
    T = [cos(X_g(3)), sin(X_g(3)),X_g_inv(1);...
            -sin(X_g(3)), cos(X_g(3)),X_g_inv(2);...
            0,                          0,                     1];
    while FLAG_GOAL == false && t<Max_iteration
        t = t +1;
        %%% control law to compute v, omega
        pos_new=T*[x_t;y_t;1];
        theta_t_new = theta_t - X_g(3);
         
         rho = sqrt(pos_new(1) * pos_new(1) +  pos_new(2) * pos_new(2));
         
         
         alpha = -theta_t_new + atan2(-(pos_new(2)), -(pos_new(1)));
        
         beta = -theta_t_new - alpha;
          if (alpha > pi)
             alpha = alpha - 2*pi;
         elseif (alpha < -pi)
             alpha = alpha + 2*pi;
         end
         
         
         if (beta > pi)
             beta = beta - 2*pi;
         elseif (alpha < -pi)
             beta = beta + 2*pi;
         end
             
         
         v = K_rho * rho;
         omega = K_alpha * alpha + K_beta * beta;
         
         %%% update x, y and theta
         x_t = x_t + v*cos(theta_t)*Delta;
         y_t = y_t + v*sin(theta_t)*Delta;
         theta_t = theta_t + omega * Delta;
         if (theta_t > pi)
               theta_t = theta_t - 2*pi;
         elseif (theta_t < -pi)
               theta_t = theta_t + 2*pi;
         end
         %%% store pos to set
         x = [x, x_t];
         y = [y, y_t];
         theta = [theta, theta_t];
         %%% update FLAG_GOAL
         DIS_FLAG = sqrt((X_g(1)-x_t) * (X_g(1)-x_t) + (X_g(2)-y_t) * (X_g(2)-y_t)) <= Max_dis_res;
         ANG_FLAG = beta<=Max_ang_res;
         if (DIS_FLAG && ANG_FLAG)
             FLAG_GOAL = true;
         end
    end
end