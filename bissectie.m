function bissectie( f,a,b,delta,maxit )
%BISSECTIE Calculates x values
% f 		: filename of the function
% a     	: starting value
% b         : secon begin value
% delta 	: value for convergence test
% maxit	    : maximum number of iterations
% RETURN    : x = vector [x0 x1 x2... xn]
val=[a .5*a+.5*b b];
eval= feval(f,val);
if sign(eval(1))==sign(eval(3)) % evaluates sign change
    error('no sign change');
end
for n = 1 : maxit
  r(n,1:3)=[n val(2) eval(2)];
    if abs(eval(2))<=delta%stops if within toleration
   disp('    count    value    evaluation');
   disp(r);
   fprintf('zero within tolerance %f in %f', delta, val(2));
        return;
    %detects if signchange between midpoint and left bound
    elseif eval(1)*eval(2)<0&&eval(3)*eval(2)>0%if signchange=> new rightborder is midpoint
        val(3)=val(2);eval(3)=eval(2);%value and evaluation are changed
    elseif eval(1)*eval(2)>0&&eval(3)*eval(2)<0%no signchange=> new leftborder is midpoint
        val(1)=val(2);eval(1)=eval(2);
    elseif sign(eval(3))==sign(eval(1))%verifies signchange
        fprintf('multiple zeros between %f and %f', val(1), val(3));return;
    end
    val(2)=.5*val(1)+.5*val(3);
    eval(2)=feval(f,val(2));%stores function evalutation into new midpoint
end
disp('Convergence test : NOT OK');
end