function Z = Translate( Y , dest)
n = length(Y);
Z = [Y(1) zeros(1,n-1)];
switch dest
    case 'BGC'
        for i = 2:n
            Z(i) = mod(( Y(i) + Y(i-1) ),2);
        end
    case 'Bin'
        for i = 2:n
            Z(i) = mod(sum( Y(1:i) ),2);
        end       
end

