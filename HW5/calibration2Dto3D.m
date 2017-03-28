function [R, T, K] = calibration2Dto3D(X,x)
%%% inverse pass
%%% compute the relative displacement (R,T) between the world coordinate
%%% frame and the camera frame and the intrinsic matrix

%%% Collect the constraints from all N points into matrix M (2N x 12)
N = size(X,2);
M = [];
for i = 1:N
    M1_temp = [X(:,i)', 1, 0, 0, 0, 0, -x(1,i)*X(:,i)', -x(1,i)];
    M2_temp = [0, 0, 0, 0, X(:,i)', 1, -x(2,i)*X(:,i)', -x(2,i)];
    M = [M; M1_temp; M2_temp];
end
% size(M) : 40    12
size(M'*M);
[V,D] = eig(M'*M);
solution_index = 0;
min_value = 10000;
for i=1:size(D,2)
    if D(i,i) < min_value
        min_value = D(i,i);
        solution_index = i;
    end
end
yita = V(:,solution_index);
R1 = [yita(1),yita(2),yita(3);
    yita(5), yita(6), yita(7);
    yita(9), yita(10), yita(11)];
T1 = [yita(4); yita(8); yita(12)];
% rq decomposition instead of rq decomposition
% the code of rq is from the internet
[K,R] = rq(R1);
T = inv(K)*T1;
end