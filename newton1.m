function x = newton1(f,df,x0,tol,maxit)
% f 		: filename of the function
% df		: filename of the derivative
% x0		: starting value
% tol       : value for convergence test
% maxit	    : maximum number of iterations
% RETURN    : x = vector [x0 x1 x2... xn]

%example:
%y=inline('x^3+3*x-4','x');
%dy=inline('3*x^2+3','x'); 
%N=newton1(y,dy,3,10^-20,55);
x(1:maxit) = x0;
for n = 1 : maxit
    x(n+1) = x(n) - feval(f,x(n))/(feval(df,x(n)));
    if abs(feval(f,x(n+1))) < tol % y=f(x(n+1)) moet nul worden, dus kleiner worden dan tolerantie
        disp('Convergence test : OK');
        return; % stops the function and returns x
    end
end
x=x(1:n);
end