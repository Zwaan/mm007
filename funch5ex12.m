function f = funch5ex12(a)
x = 0:0.1:1;
y = [0 0.2 0.4 0.6 0.7 0.8 0.9 1 1 1 0.9];
f = sum(x.*cos(a.*x).*(sin(a.*x)-y));