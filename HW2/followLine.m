function [x,y,theta] = followLine(X_s, L)
%%% This function uses feedback control to make the robot follow a line


    %%% timestep length
    Delta = 0.01;
    %%% control law parameters
    K_d = 0.002;
    K_h = 0.02;
    %%% Maximum Distance to be considered as close enough
    Max_res = 0.01;
    Max_ang_res = 0.1;
    %%% initialization of pos
    x_t = X_s(1);
    y_t = X_s(2);
    theta_t = X_s(3)/180*pi;
    x = x_t;
    y = y_t;
    theta = theta_t;
    %%% loop until [x, y] is near x_g
    FLAG_GOAL = false;
    MAX_ITERATION =1000000;
    N = 1;
    while FLAG_GOAL == false && N < MAX_ITERATION
        N = N+1;
        %%% control law to compute v, w
        %%pre-compute the distance and angle between current pos to the line
        d = (L(1)*x_t + L(2)*y_t + L(3))/sqrt(L(1)*L(1)+L(2)*L(2));
        theta_star = atan2(-L(1), L(2));
       %% alpha_d = -K_d*d;
       %% alpha_h = K_h*(theta_star - theta_t);
       theta_new = (theta_star - theta_t);
       if (theta_new > pi)
           theta_new = theta_new - 2*pi;
       elseif (theta_new < -pi)
           theta_new = theta_new + 2*pi;
       end
      d;
      theta_new;
        w = -K_d*d + K_h*theta_new;
        V = 0.06;
        %%% update x, y and theta
        x_t = x_t + V*cos(theta_t)*Delta;
        y_t = y_t + V*sin(theta_t)*Delta;
        theta_t = theta_t + w*Delta;
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
        if (d <= Max_res && abs(theta_star-theta_t)  <= Max_ang_res)
            FLAG_GOAL = true;
        end
    end
    
end