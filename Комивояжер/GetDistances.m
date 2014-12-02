function Distances = GetDistances(Points)
N = size(Points,1);
A = Points(1,:);
Distances = zeros(N , 1);
i = 2 : N;
Distances(i) = sqrt( (A(1)-Points(i,1)).^2 + (A(2)-Points(i,2)).^2 );

