function [X,r]=bisection( f,a,b,delta,maxit )
%BISSECTIE Calculates zero using bisection method. Automatically works for
%ascending and descending functions.
% f 		: filename of the function
% a     	: starting value
% b         : second begin value
% delta 	: value for convergence test (eps)
% maxit	    : maximum number of iterations
% RETURN    : X = vector [x0 x1 x2... xn], r=vector with info over
%            iterations

%example: bisection(inline('x^3-3*x^2+1','x'),0,1,0.0001,100)
val=[a .5*a+.5*b b];
f=vectorize(f);
evalv= feval(f,val);
% evaluates sign change
if sign(evalv(1))==sign(evalv(3)) 
    error('no sign change');
end
r=zeros(maxit,3);
for n = 1 : maxit
  r(n,1:3)=[n val(2) evalv(2)];
  %stops if within toleration
    if abs(evalv(2))<=delta
        disp('    count    value    evaluation');
        disp(r);
        fprintf('zero within tolerance %f in %f', delta, val(2)); X=r(:,2);
        return;
    %detects if signchange between midpoint and left bound or midpoint and
    %right bound. If signchange between left bound and midpoint then new
    %right bound is current midpoint. If no signchange an error is
    %displayed
    elseif evalv(1)*evalv(2)<0&&evalv(3)*evalv(2)>0
        val(3)=val(2);evalv(3)=evalv(2);
    elseif evalv(1)*evalv(2)>0&&evalv(3)*evalv(2)<0
        val(1)=val(2);evalv(1)=evalv(2);
    elseif sign(evalv(3))==sign(evalv(1))
        fprintf('multiple zeros between %f and %f', val(1), val(3));return;
    end
    %calculates new midpoint and evaluates function in the new midpoint.
    val(2)=.5*val(1)+.5*val(3);
    evalv(2)=feval(f,val(2));
end
disp('Convergence test : NOT OK');
end