function [x,y] = newton(fun,dfun,x0,tol,max)
% fun 		: filename of the function
% dfun		: filename of the derivative
% x0		: starting value
% tol    	: value for convergence test
% max	    : maximum number of iterations
x(1) = x0;
y(1) = feval(fun,x(1)); dy = feval(dfun,(x(1)));
for i = 2 : max
    x(i) = x(i-1) - y(i-1)/dy(i-1); y(i)=feval(fun,x(i));
    if abs(x(i) - x(i-1)) < tol
        disp('Newton method converged'); break;
    end
    dy(i) = feval(dfun,x(i));
    if i== max
        disp('Zero not found');
    end
end
n = length(x); k = 1:n; out = [k' x' y']; % disp(out);