function [x,y] = chord(f,df,x0,delta,maxit)
% Calculates solution using only one calculation of the derivative.
% f 		: filename of the function
% df		: filename of the derivative
% x0		: starting value
% delta    	: value for convergence test
% maxit	    : maximum number of iterations
%RETURN     : x vector containing x values of successive approximation, y
%             vector containing y values.

%y=inline('x^3+3*x-4','x');
%dy=inline('3*x^2+3','x'); 
%K=chord(y,dy,3,10^-5,100);

%construct x and y vector and calculates derivative.
x(1:maxit) = x0;
y(1:maxit) = feval(f,x(1)); 
dy = feval(df,(x(1)));

for i = 2 : maxit
    x(i) = x(i-1) - y(i-1)/dy; 
    y(i)=feval(f,x(i));
    if abs(x(i) - x(i-1)) < delta
        disp('Chord: Method converged');
        x=x(1:i);y=y(1:i);
        k = 1:i; out = [k' x' y']; disp(out);
        return
    end
 end
 disp('Chord: Zero not found');
end