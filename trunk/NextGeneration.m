function [Children , Phi] = NextGeneration(Bits , OldPhi, Name)
Xn = size(Bits,1);
Nbits = size(Bits,2);
% ������������ ������� ���������
Parents = GetParents(Bits,OldPhi);
Pn = size(Parents,1);
% ������������ ��� ���������
Pairs = GeneratePairs(Pn);
% ������������ ��������� �� ������ N-��������� ����������
Points = [4 8 12];
Children = zeros(Pn,Nbits);

for i = 1 : Xn/2
    P1 = Parents(Pairs(i,1) , : );
    P2 = Parents(Pairs(i,2) , : );
    Children(2*i-1 : 2*i, : ) = NPointCross(P1,P2,Points);
end

% ������� � ��������
P = 0.05;
for i = 1 : Xn
    if (rand < P)
        Children(i,:) = Mutate(Children(i,:));
    end
    if (rand < P)
        Children(i,:) = Inverse(Children(i,:));
    end
end

X = zeros(Xn,2);
for i = 1:Xn
    X(i,:) = DecodeToX(Children(i,:),[0 79]);
end

% ������������ ������� ���������

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
sum(Phi == 1)

% ������ ����� X
figure('Name',Name)
title('��������� ���������')
subplot(1, 2, 1)
plot(X(:,1),X(:,2),'*r');
xlabel('X1');
ylabel('X2');
grid on;
% ������ ����� J
subplot(1, 2, 2)
hold on;
grid on;
xlabel('J1');
ylabel('J2');
pos = find(Phi == 1);
plot(J(:,1),J(:,2),'*b');
plot(J(pos,1),J(pos,2),'or');
end

