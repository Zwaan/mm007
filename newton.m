function [x,y] = newton(f,df,x0,delta,maxit)
% f 		: filename of the function
% df		: filename of the derivative
% x0		: starting value
% delta    	: value for convergence test
% maxit	    : maximum number of iterations

%bijvoorbeeld:
%y=inline('x^3+3*x-4','x');
%dy=inline('3*x^2+3','x'); 
%N=newton(y,dy,3,10^-20,55);
x(1) = x0;
y(1) = feval(f,x(1)); dy = feval(df,(x(1)));
for i = 2 : maxit
    x(i) = x(i-1) - y(i-1)/dy(i-1); 
    y(i)=feval(f,x(i));
    if abs(x(i) - x(i-1)) < delta
        disp('Newton: method converged'); break;
    end
    dy(i) = feval(df,x(i));
    if i== maxit
        disp('Newton: Zero not found');
    end
end
disp([(1:length(x))' x' y']);
end