function [Children , Phi] = NextGeneration(Bits , OldPhi, Name)
Xn = size(Bits,1);
Nbits = size(Bits,2);
% формирование массива родителей
Parents = GetParents(Bits,OldPhi);
Pn = size(Parents,1);
% формирование пар родителей
Pairs = GeneratePairs(Pn);
% формирование потомства на основе N-точечного кроссовера
Points = [randi([2 Nbits/2-1]) , Nbits/2 ,randi([Nbits/2 + 2 Nbits])];
Children = zeros(Pn,Nbits);

for i = 1 : Xn/2
    P1 = Parents(Pairs(i,1) , : );
    P2 = Parents(Pairs(i,2) , : );
    Children(2*i-1 : 2*i, : ) = NPointCross(P1,P2,Points);
end

% Мутация и инверсия
P1 = 0.00;
P2 = 0.00;
for i = 1 : Xn
    k = rand;
    if (k < P1)
        Children(i,:) = Mutate(Children(i,:));
    end
    if (k < P2)
        Children(i,:) = Inverse(Children(i,:));
    end
end

X = zeros(Xn,2);
for i = 1:Xn
    X(i,:) = DecodeToX(Children(i,:),[0 79]);
end

% формирование таблицы испытаний

J = zeros(Xn,2);
for i = 1 : Xn
    J(i,1) = F1(X(i,:));
    J(i,2) = F2(X(i,:));
end

Phi = zeros(Xn,1);
q = 3;
for i = 1 : Xn
    b = 0;
    for j = 1 : Xn
        if j == i
            continue
        end
        if all(J(j,:)<J(i,:))
            b = b + 1;
        end
    end
    Phi(i) = 1/(1+b/(Xn-1))^q;
end
% pos = find(Phi == 1);
% ShowGeneration(X,J,pos,Name);
end

