clear all;
clc;
% генерация X на основе битовой хромосомы
Nbits = 16;
Xn = 32;
Bits = zeros(Xn,Nbits);
X = zeros(Xn,2);
for i = 1:Xn
    Bits(i,:) = BinGenerator(Nbits);
    X(i,:) = DecodeToX(Bits(i,:),[0 79]);
end
% график точек X
% plot(X(:,1),X(:,2),'*r');
% xlabel('X1');
% ylabel('X2');
% grid on;

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
% график точек J
% figure;
% hold on;
% grid on;
% xlabel('J1');
% ylabel('J2');
% pos = find(Phi == 1);
% plot(J(:,1),J(:,2),'*b');
% plot(J(pos,1),J(pos,2),'or');

% формирование массива родителей
Parents = zeros(Xn/2,Nbits);
indexes = 1:Xn;
for i = 1 : Xn/2
    Intervals = BuildIntervals(Phi(indexes));
    r = rand()*sum(Phi(indexes));
    pos = find(Intervals(:,1)<= r & r <Intervals(:,2));
    Parents(i,:) = Bits(indexes(pos),:);
    indexes(pos) = [];
end
% формирование пар родителей
Pairs = GeneratePairs(size(Parents,2));

clear b j i pos r cs1 cs2;

