function Matr = GetDistMatr(Points)
N = size(Points,1);
Matr = zeros(N);
D = GetDistances(Points);
for i = 1 : N - 1
    Matr(i , i : N) = D(1 : N - i + 1)';
    Matr(i : N , i) = D(1 : N - i + 1);
end
end

