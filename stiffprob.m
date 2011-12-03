function dy = stiffprob(t,y)
A = [ 998 , 1998 ; -999 , -1999 ];
dy = A*y;