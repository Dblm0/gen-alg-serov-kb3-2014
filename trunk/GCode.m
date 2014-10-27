function Z = GCode(M,Input)
Zpower = prod(M+1);
n = length(M);
Z = zeros(1,n);
if Input >= Zpower
    error('Кодируемое число превышает мощность множества Z = %d',Zpower);
end
k = n;
while k >=1
    X = fix(Input/(M(k)+1));
    Z(k) = mod(X,2)*(M(k)-2*mod(Input,M(k)+1)) + mod(Input,M(k)+1);
    Input = X;
    k = k-1;
end
end

