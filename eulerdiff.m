function [x,y] = eulerdiff(f,x0,y0,h,n)
x = (x0 + h : h: x0 + n*h);
y(1) = y0 + h*feval(f,x0,y0);
for i = 2 : n
   y(i) = y(i-1) + h*feval(f,x(i-1),y(i-1));
end
x = [x0 x]; 
y = [y0 y];