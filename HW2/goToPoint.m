function [x,y,theta] = goToPoint(X_s, X_g)
%%% This function applys simple feedback control to make the robot go to
%%% some arbitrary location

%%% input will be in radius degree as the convention in HW1
    %%% timestep length
    Delta = 0.01;
    %%% control law parameters
    Kv = 0.1 ;
    Kh = 1;
    %%% Maximum Distance to be considered as close enough
    Max_res = 0.01;
    %%% initialization of pos
    x_t = X_s(1);
    y_t = X_s(2);
    theta_t = X_s(3)/180*pi;
    x = x_t;
    y = y_t;
    theta = theta_t;
    %%% loop until [x, y] is near x_g
    FLAG_GOAL = false;
    MAX_ITERATION  =  1000000;
    N = 1;
    while FLAG_GOAL == false && N < MAX_ITERATION
        N = N+1;
        %%% control law to compute v, w
         theta_star = atan2(X_g(2)-y_t, X_g(1)-x_t);
         v = Kv * sqrt((X_g(1)-x_t) * (X_g(1)-x_t) + (X_g(2)-y_t) * (X_g(2)-y_t));
         theta_new = theta_star - theta_t;
         if (theta_new>pi)
             theta_new = theta_new - 2*pi;
         elseif (theta_new < -pi)
             theta_new = theta_new + 2*pi;
         end
         omega = Kh * (theta_new);
         %%% update x, y and theta
         x_t = x_t + v*cos(theta_t)*Delta;
         y_t = y_t + v*sin(theta_t)*Delta;
         theta_t = theta_t + omega*Delta;
         
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
         dis = sqrt((X_g(1)-x_t) * (X_g(1)-x_t) + (X_g(2)-y_t) * (X_g(2)-y_t));
         if (dis <= Max_res)
             FLAG_GOAL = true;
         end
    end
end