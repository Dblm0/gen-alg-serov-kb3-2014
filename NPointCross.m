function Children = NPointCross(Parent1, Parent2, Points)
L = size(Parent1,2);
Child1 = zeros(1,L);
Child2 = zeros(1,L);
Npoints = size(Points,2);
% Points =[1 sort(randi([2 L-1],1,Npoints)) L];
Points =[1 Points L];
for i = 1 : 2 : Npoints + 1
    index = Points(i) : Points(i + 1);
    Child1(index) = Parent1(index);
    Child2(index) = Parent2(index);
end

for i = 2 : 2 : Npoints + 1
    index = Points(i) + 1 : Points(i + 1);
    Child1(index) = Parent2(index);
    Child2(index) = Parent1(index);
end
Children = [Child1; Child2];


