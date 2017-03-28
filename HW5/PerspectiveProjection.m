% construct the cube vertex
X = [];
for x=0:1
    for y=0:1
        for z=0:1
            X = [X,[x;y;z]];
        end
    end
end
%rotation along x-axis
theta_x = 20;
theta_x = theta_x/180.0*pi;
R = [1,0,0;0,cos(theta_x),-sin(theta_x);0, sin(theta_x), cos(theta_x)];
% translation along z-axis;
delta_x = 0;
delta_y = 0;
delta_z = 10;
T = [delta_x; delta_y; delta_z];
% default intrinsic matrix
K = [800,0,250;0,800,250;0,0,1];
%
x = project(X,R,T,K);
% visualize cube on the image plane
index = [1,2,4,3,1,5,6,2,4,8,7,5,6,8,7,3];
x_plot = [];
for i = 1:size(index,2)
    x_plot = [x_plot, x(:,index(i))];
end
plot(x_plot(1,:), x_plot(2,:))
set(gca,'Ydir','reverse')