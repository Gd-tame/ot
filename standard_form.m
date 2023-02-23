% #standard form
% i) equalityform
% ii) all variables >=0
% |x| <=A         x<=A , -x<=A

% max z = x1 + 2x2 -x3
% st    x1-2x2-3x3<=4
%       2x1+3x2-4x3>=5
%       x1+x2+x3>=2
clc 
clear all
C = [1 2 -1]
A = [1 -2 -3; 2 3 -4; 1 1 1]
b = [4; 5; 2]
''
% <= ----> 0
% >= ----> 1
I = [0 1 1]

% phase-3 : to introduce slack and surpus variable
s = eye(size(A,1), size(I,2))  %identity matrix (of no. of rows or cols)
index = find(I>0)
s(index,index) = -s(index,index)
mat = [A s b]

stf = array2table(mat)
stf.Properties.VariableNames(1:size(mat,2)) = {'x1','x2','x3','s1','s2','s3','zmax'}