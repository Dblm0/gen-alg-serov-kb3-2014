function Bits = Inverse( Bits )
% ������������ ��������
L = size(Bits,2);
k = randi([1 L - 2]);
Bits(k + 1 : L) = fliplr( Bits( k + 1 : L ) );
end

