function Pairs = GeneratePairs(Count)

Pairs = zeros(Count,2);
indexes = 1 : Count;
for i = 1 : Count/2
    for j = 1 : 2
        r = indexes(randi([1 size(indexes,2)]));
        pos = indexes == r;
        Pairs(i,j) = r;
        indexes(pos) = [];
    end
end
% формирование второго набора пар
indexes = 1 : Count;
for i = Count/2 + 1 : Count
    for j = 1 : 2
        r = indexes(randi([1 size(indexes,2)]));
        pos = indexes == r;
        Pairs(i,j) = r;
        indexes(pos) = [];
    end
end
end

