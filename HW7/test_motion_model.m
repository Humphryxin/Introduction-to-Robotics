%plot the 
xt = [2.0 ,4.0 ,0.0]';
ut = [pi/2, 0.0, 1.0]';
alpha = [0.1, 0.1, 0.01, 0.01]';
X = [];
for i=1:5000
    X = [X;motion_model(xt, ut, alpha)];
end
figure
plot(X(:,1),X(:,2),'.')
hold on
plot([xt(1), xt(1)],[xt(2), xt(2)+1], 'LineWidth', 3)
hold off