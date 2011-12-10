function [x,y] = eulerdiff(f,x0,y0,h,n)
x = (x0 + h : h: x0 + n*h);
yt=num2cell(y0);
y(1,:) = y0 + h*feval(f,x0,yt{:})';
for i = 2 : n
  yt=num2cell(y(i-1,:));
  y(i,:) = y(i-1,:) + h*feval(f,x(i-1),yt{:})';
end
x = [x0 x]; 
y = [y0' y'];
end