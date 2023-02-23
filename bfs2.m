% max z = 2x1+3x2+4x3+7x4
% st   2x1+3x2-x3+4x4 = 8
%      x1-2x2+6x3-7x4 = -3
%      x1,x2,x3,x4>=0
clc
clear all
c = [2 3 4 7]
a = [2 3 -1 4; 1 -2 6 -7]
b = [8;-3]
n = size(a,2)
m = size(a,1)
if(n>m)
    ncm = nchoosek(n,m)
    pair = nchoosek(1:n,m)
    sol = []
    for i=1:ncm
        y = zeros(n,1)
        x = a(:,pair(i,:))\b
        if all(x>=0 & x~=inf & x~=-inf)
            y(pair(i,:)) = x
            sol = [sol y]
        end
    end
else
    error('ncm does not exist')
end

z = c*sol
[zval zindex] = max(z)
bfs_sol = sol(:,zindex)
optimalbfs = [bfs_sol' zval]
opt = array2table(optimalbfs)
opt.Properties.VariableNames(1:size(opt,2)) = {'x1','x2','x3','x4','max'}