% z = 3x1 + 2x2
% s.t
% 2x1 + 4x2 <= 8 
% 3x1 + 5x2 >= 15
% x >=0 , y>=0
function output = constraint(x)
x1=x(:,1)
x2=x(:,2)
const1=round((2.*x1+4.*x2)-8)
s1=find(const1>0)
x(s1,:)=[]
const2=round((3.*x1+5.*x2)-15)
s1=find(const1>0)
x(s2,:)=[]
output=x
end

