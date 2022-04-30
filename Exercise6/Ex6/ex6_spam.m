% Before starting this exercise code, complete the following functions in this exercise:

%% gaussianKernel.m
%% dataset3Params.m
%% processEmail.m
%% emailFeatures.m


% Starting the exercise code



clear;
file_contents=readFile('emailSample1.txt');
word_indices=processEmail(file_contents);
disp(word_indices);

features=emailFeatures(word_indices);
fprintf('length of feature vector:%d\n',length(features));
fprintf('number of non-zero entries:%d\n',sum(features>0));

load('spamTrain.mat');
C=0.1;
model=svmTrain(X,y,C,@linearKernel);

p=svmPredict(model,X);
fprintf('training accuracy:%f\n',mean(double(p==y))*100);

load('spamTest.mat');
p=svmPredict(model,Xtest);
fprintf('Test Accuracy:%f\n',mean(double(p==ytest))*100);

[weight,idx]=sort(model.w,'descend');
vocabList=getVocabList();
for i=1:15
    if i==1
        fprintf('top predictors of spam:\n');
    end
    fprintf('%-15s (%f) \n', vocabList{idx(i)},weight(i));
end


