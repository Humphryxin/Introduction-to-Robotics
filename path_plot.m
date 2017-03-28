[x, y, theta] =diffDrive([100,50,45], 1, 2, 10, 9);
figure;
plot(x, y);
hold on

[x, y, theta] =diffDrive([100,50,45], 1, 2, 15, 6);
plot(x, y);
hold on


[x, y, theta] =diffDrive([100,50,45], 1, 2, 30, 3);
plot(x,y);
axis equal

hold off
title('Paths comparison of different \deltat');
xlabel('x')
ylabel('y')
legend('right-most: \deltat=9', 'middle: \deltat=6', ...
    'left-most: \deltat=3', 'Location', 'SouthWest')