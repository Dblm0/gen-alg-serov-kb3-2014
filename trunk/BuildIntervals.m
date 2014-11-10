function Intervals = BuildIntervals( Phi )
N = size(Phi,1);
Intervals = zeros(N,2);
Intervals(1,:) = [0 Phi(1)];
for i = 2:N
    Intervals(i,:) = [Intervals(i-1,2) Intervals(i-1,2)+Phi(i)];
end