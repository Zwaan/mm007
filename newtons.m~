function  p = newtons(f,df,p0,delta,maxit)
% f		    : filename of the system
% df		: filename of the Jacobian
% p0		: starting point : column vector [x0, y0, z0,...]'
% delta 	: value for convergence test
% maxit 	: maximum number of iterations
% RETURN :  P = matrix [p0 p1 p2... p_n]
p = p0;
for n = 1 : maxit
    p(:,n+1) = p(:,n) - inv(feval(df,p(:,n))) * feval(f,p(:,n));
    if norm(feval(f,p(:,n+1))) < delta
        disp('Convergence test : OK');
        return; % stop function
    end
end        
disp('Convergence test : NOT OK');