function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
data=load('ex2data2.txt');
X=data(:,[1,2]);
y=data(:,3);
pos=find(y==1);
neg=find(y==0);
figure; 
plot(X(pos,1),X(pos,2),'k+','LineWidth', 2, 'MarkerSize' , 7);
hold on;
plot(X(neg,1),X(neg,2), 'ko','MarkerFaceColor','y','MarkerSize',7);
hold off;
xlabel('exam1 score');
ylabel('exam2 score');
legend('Admitted','Not admitted');
% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%









% =========================================================================





end
