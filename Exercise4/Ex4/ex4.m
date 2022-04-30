% Before starting this exercise code, complete the following functions in this exercise:

%% sigmoidGradient.m
%% randInitializeWeights.m
%% nnCostFunction.m

% Starting the exercise code


input_layer_size=400;
hidden_layer_size=25;
num_labels=10;

load('ex4data1.mat');
m=size(X,1);
sel=randperm(size(X,1));
sel=sel(1:100);
displayData(X(sel,:))

load('ex4weights.mat');
nn_params=[Theta1(:); Theta2(:)];

lambda=0;
J=nnCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels,X,y,lambda)
fprintf('Cost at parameters(loaded from ex4weights): %f',J);

lambda=1;
J=nnCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels,X,y,lambda)
fprintf('Cost at parameters(loaded from ex4weights): %f',J);

g=sigmoidGradient([1 -0.5 0 0.5 1]);
fprintf('sigmoid gradient evaluated at [1 -0.5 0 0.5 1]: %f ',g);

initial_Theta1=randInitializeWeights(input_layer_size,hidden_layer_size);
initial_Theta2=randInitializeWeights(hidden_layer_size,num_labels);

initial_nn_params=[initial_Theta1(:); initial_Theta2(:)];

checkNNGradients

lambda=3;
checkNNGradients(lambda);

debug_J= nnCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels,X,y,lambda);
fprintf('cost at debugging parameters (w/lambda=3): %f',debug_J);

options=optimset('MaxIter',50);
lambda=1;
costFunction=@(p) nnCostFunction(p,input_layer_size,hidden_layer_size,num_labels,X,y,lambda);

[nn_params,~]=fmincg(costFunction, initial_nn_params,options);
Theta1=reshape(nn_params(1:hidden_layer_size*(1+input_layer_size)), hidden_layer_size,(1+input_layer_size));
Theta2=reshape(nn_params((1+(hidden_layer_size*(1+input_layer_size))):end),num_labels,(hidden_layer_size+1));

displayData(Theta1(:,2:end));

pred=predict(Theta1,Theta2,X);
fprintf('Training set accuracy: %f', mean(double(pred==y))*100);


