function z = funch2ex16(p)
x = p(1); y = p(2);
z = [x.^2/16+y^2/4-1 ; x.^2-y^2-1];