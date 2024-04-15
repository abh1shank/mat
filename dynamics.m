function dxdt= dynamics(t,x,u,time_u,A,B)
input_int=interp1(time_u,u,t);%interpolated scalar value
dxdt=A*x+B*input_int 