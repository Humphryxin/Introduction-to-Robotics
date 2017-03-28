function x = project(X,R,T,K)
%%% forward pass
%%% project 3D points to pixel coordinates
cam_world = [R,T];
x = K * cam_world * [X;ones(1,size(X,2))];
for i = 1:size(x,2)
    x3 = x(3,i);
    x(:,i) = x(:,i)/x3;
end
x = x(1:2,:);
end