function Matr = GetDistMatr(Points)
N = size(Points,1);
Matr = zeros(N);
for i = 1 : N - 1
    D = GetDistances(Points , i);
    Matr(i , i : N) = D';
    Matr(i : N , i) = D;
end
end

