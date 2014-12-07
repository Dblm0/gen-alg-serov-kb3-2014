clear all
clc
R = 10;
Nr = 3;
N = 20;

Points = GetCirclePoints(N , R);
Matr = GetDistMatr(Points);
Routes = GenerateRoutes(Nr, N);
RoutesLength = zeros(Nr,1);
RoutesCoord = zeros(Nr,N,2);
for nr = 1 : Nr
    RoutesCoord(nr , : , :) = Points(Routes(nr , :) , :);
    RoutesLength(nr) = GetRouteLength(Routes(nr,:) , Matr);
    figure
    plot(RoutesCoord(nr,:,1),RoutesCoord(nr,:,2))
    title(strcat('L = ' , num2str( RoutesLength(nr) ) ));
end
