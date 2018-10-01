function y = simple_multiobjective_D(x)
%SIMPLE_MULTIOBJECTIVE is a simple multi-objective fitness function.
%
% The multi-objective genetic algorithm solver assumes the fitness function
% will take one input x where x is a row vector with as many elements as
% number of variables in the problem. The fitness function computes the
% value of each objective function and returns the vector value in its one
% return argument y.
global functiontoeval valuestemp

%   Copyright 2007 The MathWorks, Inc. 
%xu = sym('xu%d%d', [size(x)]);

 %ysimb = -(xu(1)+2)^2 + 100;
%y = -(x(1)+2)^2 + 100;
 %ysimb=-ysimb;
% y(1)=-vpa(subs(ysimb,xu,x));
%yy(1)=-vpa(subs(functiontoeval,symvar(functiontoeval),x));
 y(1)=(valuestemp(1));

for i=2:size(valuestemp,2)
    px=((floor(sqrt(2*i+2))-2).^2+mod((floor(sqrt(2*i+2))-2).^2,3).*(floor(sqrt(2*i+2))-1)+3)-i;
    py=i-((floor(sqrt(2*i+2))-2).^2+2+mod((floor(sqrt(2*i+2))-2).^2,3));
    y(1)=y(1)+valuestemp(i)*(x(1)^px)*(x(2)^py);
    
end
y=-y;
%y(2) = (x-2)^2 + 20;
%y(1)=0.11682*x(1)^3 + 0.036258*x(1)^2*x(2) - 0.58141*x(1)^2 + 0.17523*x(1)*x(2)^2 - 1.2936*x(1)*x(2) + 2.6711*x(1) - 0.057385*x(2)^3 + 0.16655*x(2)^2 + 0.89127*x(2) - 2.4056;
