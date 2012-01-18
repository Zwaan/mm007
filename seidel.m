function [x,iter,T]=seidel(A,b,x0,delta,maxit)
% this function solves a n-by-n linear system A x = b
% with Gauss-Seidel iterative method
% Ax=b      : the system
% x0		: initial solution
% delta 	: value for convergence test
% maxit     : maximum number of iterations
% RETURN    : x: final solution, iter: complete iteration, 
%             T: Gauss-Seidel-iteration-matrix.

%vb: A=[-4 1 1 0; 1 -4 0 1;1 0 -4 1; 0 1 1 -4];b=[-3;-1;-5;-3];
% seidel(A,b,[1;0;0;0],1e-5,100)

h=cond(A);
fprintf('\nConditiegetal van a: %d \n', h);
if h>100
    fprintf('OPGELET: conditiegetal gevaarlijk groot\n');
end
% construction of J and K
% Dinv = inv(diag(diag(A))); %% diag(diag(A)) is nodig om terug een 3*3 te hebben ipv een 3*1 matrix
L = tril(A,-1);% onderdriehoeksmatrix min de 1ste diagonaal
U = triu(A,1);% bovendriehoeksmatrix min de 1ste diagonaal
D = diag(diag(A));
J=-D\(L+U);
M=D+L;N=-U;%p 3/5 H3 M=D+L en N=-U
K=D\b;%K=inv(D)*b
T=M\N;%Gauss-Seidel-iteration-matrix
if max(eig(T))>=1 % NVV convergentie p3/5 H3
  disp('NVV convergentie G-S niet voldaan');
  x=x0;return;
end
% recurrence
Lx = length(x0);% is langste waarde, hier dus aantal onbekenden
x=zeros(Lx,maxit);
x(:,1)=x0;
for n = 1 : maxit
    x(:,n+1) = x(:,n);
    for j = 1:Lx
        x(j,n+1) = J(j,:) * x(:,n+1) + K(j);
    end
    if norm(x(:,n+1) - x(:,n))/norm(x(:,n)) < delta % relatieve fout nakijken
        iter=x(:,1:n+1);x=x(:,n+1);
        fprintf('convergence test : OK\n n=%d\n',n); 
        return;
    end
end
disp('convergence test : NOT OK');
end