% Before starting this exercise code, complete the following functions in this exercise:

%% lrCostFunction.m (logistic regression cost function)
%% oneVsAll.m
%% predictOneVsAll.m
%% predict.m

% Starting the exercise code



load ('ex3data1.mat');
m=size(X,1);
sel=randperm(size(X,1));
sel=sel(1:100);
displayData(X(sel,:));
load('ex3weights.mat');
pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
rp=randi(m);
pred=predict(Theta1,Theta2,X(rp,:));
fprintf('\n Neural network prediction:%d (digit %d) \n', pred, mod(pred,10));
displayData(X(rp,:));

