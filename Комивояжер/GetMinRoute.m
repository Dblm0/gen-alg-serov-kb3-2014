function MinRoute = GetMinRoute(Points,Matr)
Route(1,:) = Points;
Route(2,:) = [Points(1) Points(3) Points(2)];
L(1) = GetRouteLength(Route(1,:),Matr);
L(2) = GetRouteLength(Route(2,:),Matr);
Min = min(L);
Pos = find(L == Min,1,'first');
MinRoute = Route(Pos,:);
end