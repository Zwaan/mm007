function [x,y] = chord(f,df,x0,delta,maxit)
% f 		: filename of the function
% df		: filename of the derivative
% x0		: starting value
% delta    	: value for convergence test
% maxit	    : maximum number of iterations

%y=inline('x^3+3*x-4','x');
%dy=inline('3*x^2+3','x'); 
%K=koorde(y,dy,3,10^-20,aantal);

x(1:maxit) = x0;
y(1:maxit) = feval(f,x(1)); 
dy = feval(df,(x(1)));

for i = 2 : maxit
    x(i) = x(i-1) - y(i-1)/dy; 
    y(i)=feval(f,x(i));
    if abs(x(i) - x(i-1)) < delta
        disp('Koorde: Method converged');
        n = length(x); k = 1:n; out = [k' x' y']; disp(out);
        return
    end
 end
 disp('Koorde: Zero not found');
end