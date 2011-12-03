% this function solves a n-by-n linear system A x = b
% with Gauss-Seidel iterative method
function x = seidel(A,b,x0,delta,maxit)
% Ax=b      : the system
% x0		: initial solution
% delta 	: value for convergence test
% maxit     : maximum number of iterations
%opt=input('optimize a?');
%if opt
% [J K]=max( a(:,1));
 
% end
% construction of J and K
Dinv = inv(diag(diag(A)));
E = -tril(A,-1);
F = -triu(A,1);
J = Dinv*(E+F);
K = Dinv*b;

% recurrence
lx = length(x0);
x(:,1) = x0;
for n = 1 : maxit
    x(:,n+1) = x(:,n);
    for j = 1:lx
        x(j,n+1) = J(j,:) * x(:,n+1) + K(j);
    end
    if norm(x(:,n+1) - x(:,n))/norm(x(:,n)) < delta
        disp('convergence test : OK');
        return;
    end
end
disp('convergence test : NOT OK');