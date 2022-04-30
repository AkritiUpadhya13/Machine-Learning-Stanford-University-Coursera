% J= computeCost(X,y,theta) computes the cost for linear regression
% to fit data points in X and y using theta as the parameter

function J=computeCost(X,y,theta)
% Initializing some useful values
m=length(X); % number of training examples
J=0;
h=X*theta; % predictions of hypothesis of all m examples
sError=(h-y).^2; % squared errors
J=sum(sError/(2*m));
end
