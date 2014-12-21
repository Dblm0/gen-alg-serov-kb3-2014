function ShowRoute(RoutesCoord,RoutesLength,Name)
figure('Name',Name,...
    'units','normalized','outerposition',[0 0 1 1]);
plot(RoutesCoord(1,:,1),RoutesCoord(1,:,2),'b--')
hold on
plot(RoutesCoord(1,1,1),RoutesCoord(1,1,2),'ok',...
    'MarkerFaceColor','g','MarkerSize',10)
axis square
title(strcat('L = ' , num2str( RoutesLength) ));
end