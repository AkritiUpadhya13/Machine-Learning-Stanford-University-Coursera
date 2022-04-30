% Before starting this exercise code, complete the following functions in this exercise:


%% pca.m
%% projectData.m
%% recoverData.m
%% computeCentroids.m
%% findClosestCentroids.m
%% kMeansInitCentroids.m


% Starting the exercise code



load('ex7data2.mat');
K=3;
initial_centroids= [3 3; 6 2; 8 5];
idx=findClosestCentroids(X, initial_centroids);
fprintf('Closest centroids for the first three examples: %d %d %d', idx(1:3));

centroids=computeCentroids(X,idx,K);
fprintf('Centrioids computed after initial finding of closest centroids: \n %f %f \n %f %f \n %f %f', centroids');

load('ex7data2.mat');
max_iters = 10;

initial_centroids = [3 3; 6 2; 8 5];
figure('visible','on'); hold on; 
plotProgresskMeans(X, initial_centroids, initial_centroids, idx, K, 1); 
xlabel('Press ENTER in command window to advance','FontWeight','bold','FontSize',14)
[~, ~] = runkMeans(X, initial_centroids, max_iters, true);
set(gcf,'visible','off'); hold off;

A = imread('bird_small.png');
A = double(imread('bird_small.png'));
A = A / 255; 
img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);
K = 16;
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);
[centroids, ~] = runkMeans(X, initial_centroids, max_iters);
idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:);


X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

figure;
subplot(1, 2, 1);
imagesc(A); 
title('Original');
axis square

subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
axis square

