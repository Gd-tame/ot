% st    x1-2x2-3x3<=4
%       2x1+3x2-4x3>=5
%       x1+x2+x3>=2

a = [1 -2 -3; 2 3 -4; 1 1 1]
b = [4 ;5;2]
I = [0 1 1]

s = eye(size(a,1),size(I,2))
idx = find(I>0)
s(idx,idx) = -s(idx,idx)
mat = [a s b]
ans = array2table(mat)
ans.Properties.VariableNames(1:size(mat,2)) = {'x1','x2','x3','s1','s2','s3','max'}