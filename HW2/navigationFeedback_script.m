%%% CS685 Yongxin Wang
%%% this script file will test different setups of three functions: 
%%% goToPoint.m, goToPose.m and followLine.m

%%% goal pos, same angle though different locs
close all
clear
ang = 0:pi/6:2*pi;
R = 10;
X_g = [ R*cos(ang);...
             R*sin(ang);...
            45 * ones(1,size(ang,2))];

%%% initial pos always (0,0,0)
x_0 = [0;0;0];

%%% test goToPoint.m
figure;
hold on
axis equal
for i=1:size(ang,2)
    [x,y,theta] = goToPoint(x_0, X_g(1:2,i));
    plot(x,y)
    if(i == 6)
        x1= x;
        y1= y;
        theta1= theta;
    end
end
Delta = 0.01;
t = 0:Delta:Delta*size(x1,2)-Delta;
title({'Results from goToPoint with different goal locations.','Initial position: [0,0,0]'});

figure;
hold on
axis equal
subplot(2,2,1);
plot(x1,y1);
axis equal
title('Path from goToPoint');
xlabel('X')
ylabel('Y')
subplot(2,2,2);
plot(t,x1)
title('x(t)')
xlabel('t')
ylabel('X')
subplot(2,2,3);
plot(t,y1)
title('y(t)')
xlabel('t')
ylabel('Y')
subplot(2,2,4);
plot(t,theta1/pi*180)
title('\theta(t)')
xlabel('t')
ylabel('degree')

%test goToPose.m
figure;
hold on
axis equal
for i=1:size(ang,2)
    [x,y,theta] = goToPose(x_0, X_g(:,i));
    plot(x,y)
    if(i == 6)
        x1= x;
        y1= y;
        theta1= theta;
    end
end
Delta = 0.01;
t = 0:Delta:Delta*size(x,2)-Delta;
title({'Results from goToPose with different goal positions.', 'Initial position: [0,0,0]'});

figure;
hold on
axis equal
subplot(2,2,1);
plot(x1,y1);
axis equal
title('Path from goToPose');
xlabel('X')
ylabel('Y')
subplot(2,2,2);
plot(t,x1)
title('x(t)')
xlabel('t')
ylabel('X')
subplot(2,2,3);
plot(t,y1)
title('y(t)')
xlabel('t')
ylabel('Y')
subplot(2,2,4);
plot(t,theta1/pi*180)
title('\theta(t)')
xlabel('t')
ylabel('degree')

%test followLine.m
%% same line, variant initial points
figure;
hold on
axis equal
X_0 = X_g;
a = 1;
b = 1;
c = -5;
x_max = -R;
x_min = R;
for i=1:size(ang,2)
    [x,y,theta] = followLine(X_0(:,i), [a,b,c]);
    plot(x,y)
    x_max = max(max(x), x_max);
    x_min = min(min(x), x_min);
    if(i ==3)
        x1= x;
        y1= y;
        theta1= theta;
    end
end

x = x_min-5:0.1:x_max+5;
y = -a/b*x-c/b;
plot(x,y)
title({'Results from followLine with different initial positions.'; 'Goal line: x+y-5=0'});
Delta = 0.01;
t = 0:Delta:Delta*size(x1,2)-Delta;
figure;
hold on
axis equal
subplot(2,2,1);
plot(x1,y1);
axis equal
title('Path from followLine');
xlabel('X')
ylabel('Y')
subplot(2,2,2);
plot(t,x1)
title('x(t)')
xlabel('t')
ylabel('X')
subplot(2,2,3);
plot(t,y1)
title('y(t)')
xlabel('t')
ylabel('Y')
subplot(2,2,4);
plot(t,theta1/pi*180)
title('\theta(t)')
xlabel('t')
ylabel('degree')