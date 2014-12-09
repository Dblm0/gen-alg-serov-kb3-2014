clear all
close all
clc
R = 10;
Nr = 9;
N = 10;
c = sqrt(Nr);
Points = GetCirclePoints(N , R);
Matr = GetDistMatr(Points);
Routes = GenerateRoutes(Nr, N);
RoutesLength = zeros(Nr,1);
RoutesCoord = zeros(Nr,N,2);
figure('Name','Начальная популяция',...
    'units','normalized','outerposition',[0 0 1 1]);
for nr = 1 : Nr
    RoutesCoord(nr , : , :) = Points(Routes(nr , :) , :);
    RoutesLength(nr) = GetRouteLength(Routes(nr,:) , Matr);
    subplot(c,c,nr);
    plot(RoutesCoord(nr,:,1),RoutesCoord(nr,:,2),'--')
    axis square
    title(strcat('L = ' , num2str( RoutesLength(nr) ) ));
end
% Следующие поколения
k = 3;
Min = zeros(k,1);
for i = 1 : k
    Name = sprintf('%d Generation',i);
    Routes = GreedyCross(Routes,Matr);
    figure('Name',Name,...
        'units','normalized','outerposition',[0 0 1 1]);
    for nr = 1 : Nr
        RoutesCoord(nr , : , :) = Points(Routes(nr , :) , :);
        RoutesLength(nr) = GetRouteLength(Routes(nr,:) , Matr);
        subplot(c,c,nr);
        plot(RoutesCoord(nr,:,1),RoutesCoord(nr,:,2),'--')
        axis square
        title(strcat('L = ' , num2str( RoutesLength(nr) ) ));
    end
    Min(i) = min(RoutesLength);
end
