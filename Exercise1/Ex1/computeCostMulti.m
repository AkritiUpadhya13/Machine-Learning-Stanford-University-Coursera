% J = computeCostMulti(X,y,theta) computes the cost for linear regression with multiple variables
% to fit the data points in X and y using theta as the parameter

function J = computeCostMulti(X, y, theta)
% Initialize some useful values
m = length(y);  % number of training examples
J = (1/(2*m))*(X*theta-y)'*(X*theta-y);
end
