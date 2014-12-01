function Points = GetCirclePoints(N,R)
dw = 2*pi / N;
start = R * [1 0];
Points = zeros(N,2);
Points(1,:) = start;
w = dw;
for i = 2 : N
    Points(i,:) = R*[cos(w) sin(w)];
    w = w + dw ;
end

