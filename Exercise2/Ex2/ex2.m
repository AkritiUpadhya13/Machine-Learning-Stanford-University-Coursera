% Before starting this exercise code, complete the following functions in this exercise:

%% sigmoid.m
%% costFunction.m
%% predict.m
%% costFunctionReg.m

% Starting the exercise code

data=load('ex2data1.txt');
X=data(:,[1,2]);
y=data(:,3);
pos=find(y==1);
neg=find(y==0);
plotData(X,y);
[m,n]=size(X);
X=[ones(m,1) X];

initial_theta=zeros(n+1,1);
[cost,grad]=costFunction(initial_theta,X,y);
fprintf('cost at initial_theta(zeros):%f\n',cost);
disp('gradient at initial_theta(zeros):');
disp('grad');

test_theta=[-24;0.2;0.2];
[cost,grad]=costFunction(test_theta,X,y);
fprintf('cost at non-zero test theta: %f\n', cost);
disp('gradient at non-zero test theta:');
disp('grad');

options=optimoptions(@fminunc, 'Algorithm','Quasi-Newton','GradObj', 'on', 'MaxIter', 400);
[theta, cost]= fminunc(@(t)(costFunction(t,X,y)), initial_theta, options);
fprintf('Cost at theta found by fminunc: %f\n', cost);
disp('theta:');

plotDecisionBoundary(theta,X,y);
hold on;
xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admitted', 'Not admitted');

prob=sigmoid([1 45 85]*theta);
fprintf('for a student with scores 45 and 85, we predict an admission probability of %f\n\n', prob);
p=predict(theta,X);
fprintf('Train accuracy:%f\n', mean(double(p==y))*100)


