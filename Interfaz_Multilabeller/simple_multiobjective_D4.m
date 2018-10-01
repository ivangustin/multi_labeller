function y = simple_multiobjective_D4(x)
%SIMPLE_MULTIOBJECTIVE is a simple multi-objective fitness function.
%
% The multi-objective genetic algorithm solver assumes the fitness function
% will take one input x where x is a row vector with as many elements as
% number of variables in the problem. The fitness function computes the
% value of each objective function and returns the vector value in its one
% return argument y.
global functiontoeval valuestemp muo covso numberOfVariables nevalD nclas


       
y=0;

% for j=1:nevalD
%     covsS= size(covso(j,:,:));
%     covs=zeros(max(covsS));
%     covs(:,:)=covso(j,:,:);
%     y = y+x(j+nclas)*mvnpdf([x(1:nclas)],muo(j,:),covs);
% end
for j=1:nevalD
 yt(1)=(valuestemp{j}(1));
for i=2:size(valuestemp{j},2)
    px=((floor(sqrt(2*i+2))-2).^2+mod((floor(sqrt(2*i+2))-2).^2,3).*(floor(sqrt(2*i+2))-1)+3)-i;
    py=i-((floor(sqrt(2*i+2))-2).^2+2+mod((floor(sqrt(2*i+2))-2).^2,3));
    yt(1)=yt(1)+valuestemp{j}(i)*(x(1)^px)*(x(2)^py);
    
end
y(1)=y(1)+x(j+nclas)*yt;
end
%y(2)=sum(x(3:end))-1;
y(1)=-y(1);
%y(2) = (x-2)^2 + 20;
%y(1)=0.11682*x(1)^3 + 0.036258*x(1)^2*x(2) - 0.58141*x(1)^2 + 0.17523*x(1)*x(2)^2 - 1.2936*x(1)*x(2) + 2.6711*x(1) - 0.057385*x(2)^3 + 0.16655*x(2)^2 + 0.89127*x(2) - 2.4056;
