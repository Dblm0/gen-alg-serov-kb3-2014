function Bits = Mutate( Bits )
% одноточечная мутация
L = size(Bits,2);
k = randi([1 L]);
Bits(k) = ~Bits(k);
end

