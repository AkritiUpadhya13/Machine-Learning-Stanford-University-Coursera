% Before starting this exercise code, complete the following functions in this exercise:

%% linearRegCostFunction.m
%% learningCurve.m
%% validationCurve.m

% Starting the exercise code



load('ex5data1.mat');
m=size(X,1);
figure;
plot(X,y,'rx','MarkerSize',10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
theta=[1;1];
J=linearRegCostFunction([ones(m,1) X],y,theta,1);
fprintf('Cost at theta=[1;1]: %f',J);
[J,grad]=linearRegCostFunction([ones(m,1) X],y,theta,1);
fprintf('Gradient at theta=[1;1]: [%f %f] \n', grad(1),grad(2));
lambda=0;
[theta]=trainLinearReg([ones(m,1) X],y,lambda);
figure;
plot(X,y,'rx','MarkerSize',10,'LineWidth',1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold on;
plot(X, [ones(m,1) X]*theta, 'b--', 'LineWidth',2);
hold off;
lambda=0;
[error_train,error_val]=learningCurve([ones(m,1) X],y,[ones(size(Xval,1),1) Xval],yval,lambda);
plot(1:m, error_train, 1:m, error_val);
title('Learning Curve for linear regression');
legend('Train','Cross Validation');
xlabel('number of training examples');
ylabel('Error');
axis([0 13 0 150]);
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i=1:m
    fprintf(' \t%d\t\t%f\t%f\n',i,error_train(i), error_val(i));
end
p=8;
X_poly = polyFeatures(X, p);
[X_poly, mu, sigma] = featureNormalize(X_poly);  
X_poly = [ones(m, 1), X_poly];

X_poly_test = polyFeatures(Xtest, p);
X_poly_test = X_poly_test-mu; 
X_poly_test = X_poly_test./sigma; 
X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test]; 

X_poly_val = polyFeatures(Xval, p);
X_poly_val = X_poly_val-mu;
X_poly_val = X_poly_val./sigma; 
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val]; 

fprintf('Normalized Training Example 1:\n');
fprintf('  %f  \n', X_poly(1, :));

lambda = 1;
[theta] = trainLinearReg(X_poly, y, lambda);

figure(1);
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
plotFit(min(X), max(X), mu, sigma, theta, p);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));
figure(2);
[error_train, error_val] = learningCurve(X_poly, y, X_poly_val, yval, lambda);
plot(1:m, error_train, 1:m, error_val);
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')

fprintf('polynomial regression (lambda=%f) \n\n', lambda);
fprintf('#training examples\tTrain Error\tCross Validation Error\n');
for i=1:m
    fprintf(' \t%d\t\t%f\t%f\n',i,error_train(i),error_val(i));
end
[lambda_vec, error_train, error_val] = ...
    validationCurve(X_poly, y, X_poly_val, yval);

close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end




