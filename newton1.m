function x = newton1(f,df,x0,delta,maxit)
% f 		: filename of the function
% df		: filename of the derivative
% x0		: starting value
% delta 	: value for convergence test
% maxit	    : maximum number of iterations
% RETURN    : x = vector [x0 x1 x2... xn]
x = x0;
for n = 1 : maxit
    x(n+1) = x(n) - feval(f,x(n))/(feval(df,x(n)));
    if abs(feval(f,x(n+1))) < delta
        disp('Convergence test : OK');
        return; % stops the function and returns x
    end
end
disp('Convergence test : NOT OK');