function MRoute = Mutate(Route)
L = size(Route,2);
k = randi([1 L],1,2);
Rep = Route(k);
MRoute = Route;
MRoute(k(1)) = Rep(2);
MRoute(k(2)) = Rep(1);
end