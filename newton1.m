function x = newton1(f,df,x0,tol,maxit)
%Calculates zero of function using Newton's method. Controls by comparing
%the value with zero.
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
    % y=f(x(n+1)) needs to go to zero, smaller then tollerance. If so stops
    % function and returns x.
    if abs(feval(f,x(n+1))) < tol
        disp('Convergence test : OK');
        return;
    end
end
x=x(1:n);
end