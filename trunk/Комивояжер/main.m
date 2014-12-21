clear all
close all
clc
R = 0.5;
Nr = 60;
N = 30;
c = sqrt(Nr);
Points = GetCirclePoints(N , R);
Matr = GetDistMatr(Points);
Routes = GenerateRoutes(Nr, N);
RoutesLength = zeros(Nr,1);
RoutesCoord = zeros(Nr,N + 1,2);
for nr = 1 : Nr
    RoutesCoord(nr , : , :) = Points([Routes(nr , :) Routes(nr,1)], :);
    RoutesLength(nr) = GetRouteLength([Routes(nr , :) Routes(nr,1)] , Matr);
end
pos = find(RoutesLength == min(RoutesLength),1,'first');
ShowRoute(RoutesCoord(pos,:,:) , RoutesLength(pos,:),'Начальная популяция' );
% Следующие поколения
NGen = 2;
Min = zeros(NGen,1);
for i = 1 : NGen
    Name = sprintf('%d Generation',i);
    Routes = GreedyCross(Routes,Matr);
    for nr = 1 : Nr
    RoutesCoord(nr , : , :) = Points([Routes(nr , :) Routes(nr,1)], :);
    RoutesLength(nr) = GetRouteLength([Routes(nr , :) Routes(nr,1)] , Matr);
    end
    Min(i) = min(RoutesLength);
    pos = find(RoutesLength ==  Min(i) ,1,'first');
    ShowRoute(RoutesCoord(pos,:,:) , RoutesLength(pos,:),Name );
end
