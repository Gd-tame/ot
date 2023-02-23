% -x1 + 3x2 = 10
% x1 + x2 = 6
% x1 - x2 = 2

a = [-1 3; 1 1 ;1 -1]
b = [10;6;2]

y1 = 0:max(b)
x11 = (b(1)-a(1,1).*y1)./a(1,2)
x21 = (b(2)-a(2,1).*y1)./a(2,2)
x31 = (b(3)-a(3,1).*y1)./a(3,2)

x11 = max(0,x11)
x21 = max(0,x21)
x31 = max(0,x31)

plot(y1,x11,'r',y1,x21,'b',y1,x31,'g')
xlabel('x1')
ylabel('y1')
title('x1 versus y1')
legend('-x1 + 3x2 = 10','x1 + x2 = 6','x1 - x2 = 2')
grid on



cx1 = find(y1 == 0)
c1 = find(x11==0)
line1 = [y1(:,[c1 ,cx1]);x11(:,[c1 ,cx1])]
c2 = find(x21 ==0)

line2 = [y1(:,[c2 cx1]);x21(:,[c2 cx1])]
c3 = find(x31 ==0)
line3 = [y1(:[c3 ,cx1])]
