% x = [0,0; 0,3.3333; 0,6; 1,0; 2,0; 2,4; 4,2; 6,0; 7,0; 8,0; 8,6; 9,0; 10,0];
function output = constraint(x)
x1 = x(:,1)
x2 = x(:,2)
const1 = round((-x1+3.*x2)-10)
s1 = find(const1>0)
x(s1,:) = []

x1 = x(:,1)
x2 = x(:,2)
const2 = round((x1+x2)-6)
s2 = find(const2>0)
x(s2,:) = []

x1 = x(:,1)
x2 = x(:,2)
const3 = round((x1-x2)-2)
s3 = find(const3>0)
x(s3,:) = []

output = x
end
