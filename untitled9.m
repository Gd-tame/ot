%graphical method
%how to plot lines in matlab
% -x1 + 3x2 = 10
% x1 + x2 = 6
% x1 - x2 = 2
clc
clear all
format short 
%phase-1 : input parameters 
A = [-1,3; 1,1; 1,-1];
B = [10;6;2];

%phase-2 : to plot the lines on the graph
y1 = 0:max(B);
x11 = (B(1) - A(1,1).*y1 )./A(1,2);
x21 = (B(2) - A(2,1).*y1 )./A(2,2);
x31 = (B(3) - A(3,1).*y1 )./A(3,2);
%to ignore negative portion
x11 = max(0,x11);
x21 = max(0,x21);
x31 = max(0,x31);

plot(y1,x11,'r',y1,x21,'b',y1,x31,'g')
title('graph of x1 vs x2')
xlabel('values of y1')
ylabel('values of x2')
legend('-x1 + 3x2 = 10','x1 + x2 = 6','x1 - x2 = 2')
grid on

%phase-3 : to find the corner points with axes
cx1 = find(y1==0);
c1 = find(x11==0);
line1 = [y1(:,[c1,cx1]);x11(:,[c1,cx1])]'     % ' for transpose
c2 = find(x21==0);
line2 = [y1(:,[c2,cx1]);x21(:,[c2,cx1])]'
c3 = find(x31==0);
line3 = [y1(:,[c3,cx1]);x31(:,[c3,cx1])]'

corpt = unique([line1;line2;line3],'rows')         %set of corner pts

%phase-4 : to find the points of intersection of all the lines
pt = [0;0]
for i=1:size(A,1)
    A1 = A(i,:);
    B1 = B(i,:);
    for j=i+1:size(A,1)
        A2 = A(j,:);
        B2 = B(j,:);
        A4 = [A1;A2];
        B4 = [B1;B2];
        
        x = A4\B4
        pt = [pt,x]
    end
end
ptt = pt'
% points = [0,0; 0,3.3333; 0,6; 1,0; 2,0; 2,4; 4,2; 6,0; 7,0; 8,0; 8,6; 9,0; 10,0]

% phase-5 : write all corner pts
allpt = [ptt;corpt];
points = unique(allpt,'rows');

% phase-6 : to check the feasibility
PT = constraint(points);
P = unique(PT,'rows');
%phase-7 :  to find objective func
C = [1 5];
for i=1:size(P,1)
    fn(i,:) = sum(P(i,:).*C);
end
ver_fns = [P fn];

% phase-8 : to find the optimal soln
[optval optposition] = max(fn);
optval = ver_fns(optposition,:);
OPTIMAL_BFS = array2table(optval)
OPTIMAL_BFS.Properties.VariableNames(1:size(optval,2)) = {'x1','x2','z'}