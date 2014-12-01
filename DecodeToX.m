function X = DecodeToX(bits,Xrange)
L = size(Xrange,1);
Nbits = length(bits);
K = Nbits / 2;
G = reshape(bits,K,2)';
X = zeros(2,L);
for i = 1:2
    X(i,:) = BinGDecode(G(i,:), Xrange );
end
end

