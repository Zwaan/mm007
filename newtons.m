function p = newtons(f,df,p0,tol,maxit)
% newtons solves systems of multiple lineair equations. It can handle
% multiple startpoints.
% f 		: filename of the function
% df		: filename of the derivative
% p0        : starting point : column vector [x0, y0, z0,...]'
% tol       : value for convergence test
% maxit	    : maximum number of iterations
% RETURN    : P = matrix [p0 p1 p2... pn]
% example: 
%without m-files
%   f=@(x,y) [x^2-x+y^2; x^2-y-y^2];  
%   df=@(x,y) [2*x-1, 2*y; 2*x, -2*y-1]; 
%   newtons(f,df,[0.8;0.4],1e-7,100)
%with m-files
%   function v = f3(x,y)
%   v = [x^2-x+y^2; x^2-y-y^2];
%derivative
% function V = f3j(x,y)
%   V = [2*x-1, 2*y; 2*x, -2*y-1];
%newtons(@f3,@f3j,[0.8;0.4],1e-7,100)
p =zeros(2,maxit);
p(:,1)=p0;
for n = 1 : maxit
    arg=num2cell(p(:,n));
    p(:,n+1) = p(:,n) - feval(df,arg{:})\feval(f,arg{:});
    arg2=num2cell(p(:,n+1));
    %if norm smaller then tollerance the program finishes.
    if norm(feval(f,arg2{:})) < tol
        disp('Convergence test : OK');
        p=p(:,1:n+1);
        return; % stops the function and returns p
    end
end
disp('Convergence test : NOT OK');
end