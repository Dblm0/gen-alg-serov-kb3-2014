function Parents = GetParents( Bits,Phi )
    Xn = size(Bits,1);
    Nbits = size(Bits,2);
    Parents = zeros(Xn/2,Nbits);
    indexes = 1:Xn;
    for i = 1 : Xn/2
        Intervals = BuildIntervals(Phi(indexes));
        r = rand()*sum(Phi(indexes));
        pos = find(Intervals(:,1)<= r & r <Intervals(:,2));
        Parents(i,:) = Bits(indexes(pos),:);
        indexes(pos) = [];
    end
end