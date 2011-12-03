function I = trap(x,f)
N = length(x) ;
A = x(2:N)-x(1:N-1) ;
B = f(2:N)+f(1:N-1) ;
I = sum(A.*B)/2 ;  
