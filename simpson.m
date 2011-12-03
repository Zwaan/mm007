function I = simpson(f,a,b,n)
h=(b-a)/(2*n);
x=a:h:b;
y=feval(f,x);
I=h/3*(y(1)+4*sum(y(2:2:2*n))+2*sum(y(3:2:2*n-1))+y(2*n+1));