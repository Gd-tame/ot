clc
clear all
% z = 3x1 + 2x2
% s.t
% 2x1 + 4x2 <= 8 
% 3x1 + 5x2 >= 15
% x >=0 , y>=0

C = [3 2];
A = [2 4; 3 5];
B = [8; 15];

Y1 = 0:max(B)
X11 = (B(1)-A(1,1).*Y1)./A(1,2)
X21 = (B(2)-A(2,1).*Y1)./A(2,2)

X11 = max(0,X11)
X21 = max(0,X21)
plot(Y1,X11,'r',Y1,X21,'b')
title('graph of x1 vs graph of x2')
xlabel('Values of x1')
ylabel('Values of x2')
legend('2x1 + 4x2 = 8','3x1 + 5x2 = 15')
grid on

cx1 = find(Y1==0)
c1 = find(X11==0)
line1 = [Y1(:,[c1,cx1]);X11(:,[c1,cx1])]'
c2 = find(X21==0)
line2 = [Y1(:,[c2,cx1]);X21(:,[c2,cx1])]'
corpt = unique([line1;line2],"rows")
pt=[0;0]
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        x=A4\B4;
        pt=[pt,x];
    end
end
ptt=pt'
allpt=[ptt;corpt];
points=unique(allpt,'rows');
PT=constraint(points);
P=unique(PT,'rows')


for i=1:size(P,1)
    fn(i,:)=sum(P(i,:).*C)
end
ver_fns = [P fn]


[optval optposition] = max(fn);
optval = ver_fns(optposition,:);
OPTIMAL_BFS = array2table(optval)
OPTIMAL_BFS.Properties.VariableNames(1:size(optval,2)) = {'x1','x2','z'}

