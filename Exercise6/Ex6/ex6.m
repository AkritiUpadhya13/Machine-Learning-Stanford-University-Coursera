% Before starting this exercise code, complete the following functions in this exercise:


%% gaussianKernel.m
%% dataset3Params.m
%% processEmail.m
%% emailFeatures.m

% Starting the exercise code



load('ex6data1.mat');
plotData(X,y);
C=1;
model=svmTrain(X,y,C,@linearKernel,1e-3,20);
visualizeBoundaryLinear(X,y,model);

x1=[1 2 1];
x2=[0 4 -1];
sigma=2;
sim=gaussianKernel(x1,x2,sigma);
fprintf('gaussian kernel between x1=[1;2;1] and x2=[0;4;-1],sigma=%f: \n\t%g\n',sigma,sim);

load('ex6data2.mat');
plotData(X,y);

C=1;
sigma=0.1;
model=svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
visualizeBoundary(X,y,model);

load('ex6data3.mat');
plotData(X,y);

[C,sigma]=dataset3Params(X,y,Xval,yval);
model=svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
visualizeBoundary(X,y,model);
