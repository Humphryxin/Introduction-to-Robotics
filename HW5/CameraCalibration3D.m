%demonstrate the usage of calibration2Dto3D
%load as X and x2
load('3Dpoints.mat')
[R,T,K] = calibration2Dto3D(X,x2);

% check correctness
max(max(project(X,R,T,K) - x2(1:2,:)))