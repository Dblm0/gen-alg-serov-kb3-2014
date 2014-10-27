function X = BinGDecode( Z , Xrange )
Xn = size(Xrange,1);
X = zeros(Xn,1);
m = length(Z);
l = 0;
for k = 1:m
    lk = 0;
    d = length(find(Z(1:k) == 0));
    p = k - d;
    if Z(k) == 1
        lk = (-1)^(p+1)*(2^(m-k+1)-1)*Z(k);
    end   
    l = l + lk;
end
for i = 1:Xn
    X(i) = Xrange(i,1) +  l*(Xrange(i,2) - Xrange(i,1))/(2^m-1);
end
end

