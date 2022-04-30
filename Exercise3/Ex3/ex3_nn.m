% Before starting this exercise code, complete the following functions in this exercise:

%% lrCostFunction.m (logistic regression cost function)
%% oneVsAll.m
%% predictOneVsAll.m
%% predict.m

% Starting the exercise code


load ('ex3data1.mat');
m=size(X,1);
rand_indices=randperm(m);
sel=X(rand_indices(1:100),:);
displayData(sel);
theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
lambda_t = 3;
[J, grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

fprintf('Cost: %f | Expected cost: 2.534819\n',J);
fprintf('Gradients:\n'); fprintf('%f\n',grad);
fprintf('Expected gradients:\n 0.146561\n -0.548558\n 0.724722\n 1.398003');
num_labels = 10; % 10 labels, from 1 to 10 
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);
pred = predictOneVsAll(all_theta, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
