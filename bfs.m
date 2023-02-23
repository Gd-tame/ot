clc
clear all

% max z = 2x1+3x2+4x3+7x4
% st   2x1+3x2-x3+4x4 = 8
%      x1-2x2+6x3-7x4 = -3
%      x1,x2,x3,x4>=0
C = [2 3 4 7]
A = [2 3 -1 4; 1 -2 6 -7]
b = [8; -3]

n = size(A,2)
m = size(A,1)
if (n>m)
    ncm = nchoosek(n,m)
    pair = nchoosek(1:n,m)

    sol = []
    for i=1:ncm
        y = zeros(n,1)
        x = A(:,pair(i,:))\b
        if all(x>=0 & x~=inf & x~=-inf)     %extracting BFS
            y(pair(i,:)) = x
            sol = [sol y]
        end
    end
    
else
    error('ncm does not exist!')
end

% to find objective function value
z = C*sol
[zmax, zindex] = max(z)
bfs2 = sol(:,zindex)
optbfs = [bfs2' zmax]
optimalbfs = array2table(optbfs)
optimalbfs.Properties.VariableNames(1:size(optbfs,2)) = {'x1','x2','x3','x4','zmax'}