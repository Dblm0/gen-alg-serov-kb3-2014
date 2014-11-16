function Pairs = GeneratePairs(Count)

Pairs = zeros(Count/2,2);
indexes = 1 : Count/2;
for i = 1 : Count/4
    for j = 1 : 2
        r = indexes(randi([1 size(indexes,2)]));
        pos = indexes == r;
        Pairs(i,j) = r;
        indexes(pos) = [];
    end
end
% формирование второго набора пар, отличного от первого

indexes = 1 : Count/2;
for i = Count/4 + 1 : Count/2
    r = indexes(randi([1 size(indexes,2)]));
    pos = indexes == r;
    Pairs(i,1) = r;
    indexes(pos) = [];
    cs1 = 1;
    cs2 = 1;
    while cs1 || cs2
        r = indexes(randi([1 size(indexes,2)]));
        pos = indexes == r;
        Pairs(i,2) = r;
        cs1 =  ismember(Pairs(i,:),Pairs(1:Count/4,:),'rows');
        cs2 = ismember(fliplr(Pairs(i,:)),Pairs(1:Count/4,:),'rows');
    end
    indexes(pos) = [];  
end

end

