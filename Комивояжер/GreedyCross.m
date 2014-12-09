function Children = GreedyCross( Parents , Matr )
L = size(Parents,2);
N = size(Parents,1);

Children = zeros(N,L);
CrossPoint = randi([1 L]);
Phi = zeros(N,1);
NextPoint = zeros(N,1);
for p = 1 : N
    GreedPoint = Parents(p,CrossPoint);
    Children(p,1) = GreedPoint;
    for k = 2 : L
        for i = 1 : N
            P = find(Parents(i,:) == GreedPoint);
            if P == L
                NextPoint(i) = 1;
            else
                NextPoint(i) = P + 1;
            end
            if find(Children(p,:) == Parents(i,NextPoint(i)))
                Phi(i) = 0;
            else
                Phi(i) = GetRouteLength(Parents(i , [P , NextPoint(i)]) ,Matr);
            end
            
        end
        Min = min(Phi(Phi ~= 0));
        if isempty(Min)
            GreedPoint = min(setdiff( (1:L) , Children(p,:) ));
        else
            pos = find(Phi == Min,1,'first');
            GreedPoint = Parents(pos , NextPoint(pos));
        end
        Children(p,k) = GreedPoint;
    end
end
end

