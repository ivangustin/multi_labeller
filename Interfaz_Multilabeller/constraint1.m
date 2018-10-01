function [c,ceq]=constraint1(x)
global  nclas
%c=2*x(3)^2-x(2)^2; 
c=sum(x(nclas+1:end))-1;
ceq=[];


