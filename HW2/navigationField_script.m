% CS685 Jana Kosecka
% this is the script for testing navigation behavior for different goals
% the positions of the obstactles and the initial position of the robot 
% is fixed inside of the function

close all; clear;
x0 = [0; 0];   % initial pose is set
x(:,1) = x0;

% obstacles are set
xo(:,1) = [40; 30]; 
xo(:,2) = [70; 40];

d0 = 10; 
xg = [100; 60];

figure; hold on; 
axis equal
axis([0 100 0 100]);
plot(xg(1), xg(2), 'r*'); % goal position
plot(x(1,1),x(2,1),'r.')  % start position
[xc1, yc1] = plot_circle(xo(1,1),xo(2,1),d0); 
[xc2, yc2] = plot_circle(xo(1,2),xo(2,2),d0); 
plot(xc1,yc1);
plot(xc2,yc2);


x(:,1) = x0; % starting position 
xg = [100; 60];
x = goToAvoid(x0,xg,xo); 
axis([0 100 0 100]);
plot(x(1,:),x(2,:),'r.')
title({'path plot from potential filed control', 'initial loc: [0;0], goal loc: [100;60]'});
xlabel('X')
ylabel('Y')


