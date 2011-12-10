function [x,y] = secant(f,x0,x1,tol,max)
% This script uses the secant method(quasi-newton method). The script
% indicates if the function has converged or not.
% f 		: filename of the function
% x0		: starting value 1
% x1        : starting value 2
% delta    	: value for convergence test
% maxit	    : maximum number of iterations
% x         : output x-values
% y         : output y-values
%example: secant(y,3,400,10^-10,100) (y=inline(f,'x')
f=vectorize(f);
x = [x0 x1];
y = feval(f,x); 
for i = 3 : max
    x(i) = x(i-1) - y(i-1)/((y(i-1)-y(i-2))/(x(i-1)-x(i-2))); 
    y(i) = feval(f,x(i));
    if abs(x(i) - x(i-1)) < tol
        disp('Secant methode is geconvergeerd');
        disp([ (1:length(x))' x' y']); 
        % 1e kolom: teller; x: x-waarde; y: overeenkomstige y-waarde
        return;
    end
 end
 fprintf('Nulpunt niet gevonden. Laatste waarde was %f \n',x(max));
end