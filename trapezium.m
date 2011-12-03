function I = trapezium(f,a,b,n)
h=(b-a)/n;
x=a:h:b;
y=feval(f,x);
I=h/2*(y(1)+2*sum(y(2:n))+y(n+1));