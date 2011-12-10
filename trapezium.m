function I = trapezium(f,a,b,n)
%f: inline function
%a: start value
%b: end value
%n: number of intervals
x=a:(b-a)/n:b;
f=vectorize(f);% vectorizes f for working with arrays in feval.
y=feval(f,x);
I=h/2*(y(1)+2*sum(y(2:n))+y(n+1));