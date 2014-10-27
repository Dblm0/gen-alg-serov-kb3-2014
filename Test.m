clear all;
clc;
% генерация X на основе битовой хромосомы
Nbits = 64;
Xn = 100;
bits = zeros(Xn,Nbits);
X = zeros(Xn,2);
for i = 1:Xn
    bits(i,:) = BinGenerator(Nbits);
    X(i,:) = DecodeToX(bits(i,:),[0 79]);
end
% график точек X
grid on;
xlabel('X1');
ylabel('X2');
plot(X(:,1),X(:,2),'*r');

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
figure;
hold on;
grid on;
xlabel('J1');
ylabel('J2');
pos = find(Phi == 1);
plot(J(:,1),J(:,2),'*b');
plot(J(pos,1),J(pos,2),'*r');