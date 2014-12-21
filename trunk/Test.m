close all;
clear all;
clc;
% генерация X на основе битовой хромосомы
Nbits = 64;
Xn = 500;
Bits = zeros(Xn,Nbits);
X = zeros(Xn,2);
for i = 1:Xn
    Bits(i,:) = BinGenerator(Nbits);
    X(i,:) = DecodeToX(Bits(i,:),[0 79]);
end


% формирование таблицы испытаний

J = zeros(Xn,2);
for i = 1 : Xn
    J(i,1) = F1(X(i,:));
    J(i,2) = F2(X(i,:));
end

Phi = zeros(Xn,1);
q = 2;
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

Count = sum(Phi == 1);
% pos = find(Phi == 1);
% ShowGeneration(X,J,pos,'Начальная популяция');

K = 30;
AllPhiCount = zeros(K,1);
for i = 1 : K
    str = sprintf('%d Generation',i);
    [Bits , Phi] = NextGeneration(Bits,Phi,str);  
    AllPhiCount(i) = sum(Phi == 1);
end
max(AllPhiCount)
