function X = GDecode(M,Z)
if min(M-Z)<0
   error('Неверное декодируемое число');
end
n = length(Z);
S1 = Z(1)*prod(M(2:n)+1);
S2 = 0;
for j = 2:n-1
S2 = S2 + (mod(sum(Z(1:j-1)),2)*(M(j)-2*Z(j))+Z(j))*prod(M(j+1:n)+1);    
end
S3 = mod(sum(Z(1:n-1)),2)*(M(n)-2*Z(n));
X = S1 + S2 + S3 + Z(n);
end

