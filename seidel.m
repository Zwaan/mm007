% this function solves a n-by-n linear system A x = b
% with Gauss-Seidel iterative method
function seidel(A,b,x0,delta,maxit)
% Ax=b      : the system
% x0		: initial solution
% delta 	: value for convergence test
% maxit     : maximum number of iterations


%vb: A=[-4 1 1 0; 1 -4 0 1;1 0 -4 1; 0 1 1 -4];b=[-3;-1;-5;-3];
% seidel(A,b,[1;0;0;0],1e-5,100)


h=cond(A);
fprintf('\nConditiegetal van a: %d \n', h);
if h>100
    disp('     OPGELET: conditiegetal gevaarlijk groot');fprintf('\n');
end

% construction of J and K
% Dinv = inv(diag(diag(A))); %% diag(diag(A)) is nodig om terug een 3*3 te hebben ipv een 3*1 matrix
E = -tril(A,-1);% onderdriehoeksmatrix min de 1ste diagonaal
F = -triu(A,1);% bovendriehoeksmatrix min de 1ste diagonaal
J = diag(diag(A))\(E+F);
K = diag(diag(A))\b;

M=diag(diag(A))+ tril(A,-1);N=-triu(A,1); %p 3/5 H3 M=D+L en N=-U

if max(eig(M\N))<1 % NVV convergentie p3/5 H3

% recurrence
Lx = length(x0);% is langste waarde, hier dus aantal onbekenden
x(:,1) = x0; % geeft zoizo kolommatrix, eender of x0 er ��n is of niet
for n = 1 : maxit
    x(:,n+1) = x(:,n);
    for j = 1:Lx
        x(j,n+1) = J(j,:) * x(:,n+1) + K(j);
    end
    if norm(x(:,n+1) - x(:,n))/norm(x(:,n)) < delta % relatieve fout nakijken
        disp('convergence test : OK'); % nu x, x(n) en n weergeven
        fprintf('n=%d',n);
        fprintf('\nx(n)= \n');disp(x(:,n));x 
        return;
    end
end
disp('convergence test : NOT OK');
else
    disp('NVV convergentie G-S niet voldaan');
end
end