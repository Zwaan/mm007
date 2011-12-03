%powermethod
%[Z,h] = powermethod(A,tol,max_it)
%Z:eigenvector, h:eigenvalue
%A: matrix, tol: tolerance, max_it: iterations
function [Z,h] = powermethod(A,tol,max_it)
[n,m] = size(A);
%initialization
Z = ones(n,1);
it = 0;
error = 100;
%start iteration
while (it < max_it & error > tol)
   it = it+1;
   W = A * Z;
   WW = abs(W);
   [wk,k] = max(WW);
   h = W(k);
   Z = W/W(k);
   disp([it h Z']);
   error = norm(A*Z - h*Z);
end
