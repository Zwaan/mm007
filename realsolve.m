function b = realsolve( f )
%only takes real parts of solve function with single function
%f symbolic function
a=solve(f);
m=1;
for k=1:length(a)
if isreal(a(k))
 b(m)=a(k);
 m=m+1;
end
end
end

