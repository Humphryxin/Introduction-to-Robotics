function [x, y, theta] = diffDrive(s, v, omega, t, delta)
%%% compute the path of differential drive robot given
%%% a constant linear velocity and a constant angular
%%% velocity

    %%% change angles from degree to radian
    s(3) = degtorad(s(3));
    omega = degtorad(omega);
    
    x=zeros(1,t+1);
    y=zeros(1,t+1);
    theta=zeros(1,t+1);
    %%% x, y, theta index is 1 greater than t
    x_t = s(1);
    y_t = s(2);
    theta_t = s(3);
    %%% initial state of robot
    x(1) = x_t;
    y(1) = y_t;
    theta(1) = theta_t;
    %%% index 1 stands for initial state
    for i=1:t
        %%% in each time step, all the states change 
        %%% base on diffDrive kinematics
        x_t = x_t + v*cos(theta_t)*delta;
        y_t = y_t + v*sin(theta_t)*delta;
        theta_t = theta_t + omega*delta;
        x(i+1) = x_t;
        y(i+1) = y_t;
        theta(i+1) = theta_t;
    end
end
