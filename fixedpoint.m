function  c = fixedpoint( f,a,tol, max )
%fixedpoint Solves x=f(x) with iterative method
%f      : function
%a      : start value provide [a1 a2 .. an] or just a;
%tol    : tolerance can be provided per startvalue as [] or same tol for all
%max    : maximum number of iterations
%RETURN : c vector with iteration values

%example: fixedpoint(inline('4/(x^3+3)','x'),-50,10^-10,100)
f=vectorize(f);
if length(a)~=length(tol)&&length(tol)~=1
    error('no good tollerance');
end
c(1,:)=a;
for i=1:max
c(i+1,:)=feval(f,c(i,:));
    if abs(c(i+1,:)-c(i,:))<tol
        disp([(1:i+1)' c]);
        return;
    end
end
disp([(1:max+1)' c]);
disp('One or more starting values didnt converged');
end