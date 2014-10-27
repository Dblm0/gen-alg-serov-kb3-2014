function X = DecodeToX(bits,Xrange)
L = size(Xrange,1);
Nbits = length(bits);
K = Nbits / 2;
G = reshape(bits,K,2)';
B = zeros(2,K);
X = zeros(2,L);
for i = 1:2
    B(i,:) = Translate(G(i,:),'Bin');
    X(i,:) = BinGDecode(B(i,:), Xrange );
end
end

