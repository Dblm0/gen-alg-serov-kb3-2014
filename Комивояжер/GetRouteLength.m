function L = GetRouteLength(Route , LMatr)
L = 0;
N = size(Route,2);
for n = 1 : N-1
    Dist = LMatr( Route(n) , Route(n+1) );
    L = L + Dist;
end
end

