% J= computeCost(X,y,theta) computes the cost for linear regression
% to fit data points in X and y using theta as the parameter

function J=computeCost(X,y,theta)
% Initializing some useful values
m=length(y); % number of training examples
i=1:m;
J=(1/(2*m))*sum(((theta(1)+theta(2).*X(i,2))-y(i)).^2);

end
