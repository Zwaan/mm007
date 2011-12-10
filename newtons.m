function p = newtons(f,df,p0,tol,maxit)
% geschreven voor meerdere startpunten
% f 		: filename of the function
% df		: filename of the derivative
% p0        : starting point : column vector [x0, y0, z0,...]'
% tol       : value for convergence test
% maxit	    : maximum number of iterations
% RETURN    : P = matrix [p0 p1 p2... pn]
% example: 
% eerst functie definieren
%   function v = f3(p)
%   x = p(1); y = p(2);
%   v = [x^2-x+y^2; x^2-y-y^2];  
% dan afgeleide definieren
%   function V = f3j(p)
%   x = p(1); y = p(2);
%   V = [2*x-1, 2*y; 2*x, -2*y-1]; 
%newtons(@f3,@f3j,[0.8;0.4],1e-7,100)
p = p0;
for n = 1 : maxit
    p(:,n+1) = p(:,n) - feval(df,p(:,n))\feval(f,p(:,n));
    if norm(feval(f,p(:,n+1))) < tol % norm kleiner dan de tolerantie? klaar...
        disp('Convergence test : OK');
        return; % stops the function and returns p
    end
end
disp('Convergence test : NOT OK');