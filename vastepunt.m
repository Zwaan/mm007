function  c = vastepunt( f,a,tol, max )
%VASTEPUNT Solves x=f(x) with iterative method
%   f= function
%   a= start value provide [a1 a2 .. an] or just a;
%   tol= tolerance can be provided per startvalue as [] or same tol for all
%   max= maximum number of iterations
if length(a)~=length(tol)&&length(tol)~=1
    error('no good tollerance');end;
l=length(a)+1;
    tol(2:l)=tol;
c(1,2:l)=a;
for i=1:max
c(i+1,2:l)=feval(f,c(i,2:l));
if abs(c(i+1,2:l)-c(i,2:l))<tol(2:l)
    c(1:i+1,1)=1:i+1;
    return;end;
end
disp('One or more starting values didnt converged');
end

