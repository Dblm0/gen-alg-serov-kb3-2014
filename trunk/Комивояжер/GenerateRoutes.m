function Routes = GenerateRoutes(N ,NPoints )
Routes = zeros(N , NPoints);
for n = 1 : N
    indexes = 1 : NPoints;
    for np = 1 : NPoints
        r = indexes(randi([1 size(indexes,2)]));
        pos = indexes == r;
        Routes(n,np) = r;
        indexes(pos) = [];
    end  
end