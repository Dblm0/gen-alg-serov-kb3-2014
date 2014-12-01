function Distances = GetDistances(Points,Nstart)
N = size(Points,1);
A = Points(Nstart,:);
K = N - Nstart + 1;
Distances = zeros(K , 1);
Distances(1) = 0;
i = Nstart + 1 : N;
Distances(2 : K) = sqrt( (A(1)-Points(i,1)).^2 + (A(2)-Points(i,2)).^2 );

