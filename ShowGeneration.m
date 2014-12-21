function ShowGeneration(X,J,pareto,Name)
% график точек X
figure('Name',Name,...
    'units','normalized','outerposition',[0 0 1 1])
subplot(1, 2, 1)
plot(X(:,1),X(:,2),'*r');
axis vis3d
xlabel('X1');
ylabel('X2');
grid on;

% график точек J
subplot(1, 2, 2)
hold on;
grid on;
xlabel('J1');
ylabel('J2');
plot(J(:,1),J(:,2),'*b');
plot(J(pareto,1),J(pareto,2),'or');
axis vis3d
end