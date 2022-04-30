% Before starting this exercise code, complete the following functions in this exercise:


%% pca.m
%% projectData.m
%% recoverData.m
%% computeCentroids.m
%% findClosestCentroids.m
%% kMeansInitCentroids.m

% Starting the exercise code



load ('ex7data1.mat');

figure;
plot(X(:, 1), X(:, 2), 'bo');
axis([0.5 6.5 2 8]); axis square;
[X_norm, mu, ~] = featureNormalize(X);

[U, S] = pca(X_norm);

hold on;
drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;

fprintf('Top eigenvector U(:,1) = %f %f \n', U(1,1), U(2,1));

K = 1;
Z = projectData(X_norm, U, K);
fprintf('Projection of the first example: %f\n', Z(1));

X_rec  = recoverData(Z, U, K);
fprintf('Approximation of the first example: %f %f\n', X_rec(1, 1), X_rec(1, 2));

plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square
hold on;
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off
load ('ex7faces.mat')
close all;
displayData(X(1:100, :));

[X_norm, ~, ~] = featureNormalize(X);


[U, ~] = pca(X_norm);


displayData(U(:, 1:36)');

K = 100;
Z = projectData(X_norm, U, K);

fprintf('The projected data Z has a size of: %d x %d', size(Z));

X_rec  = recoverData(Z, U, K);


subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('Original faces');
axis square;

subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('Recovered faces');
axis square;

A = double(imread('bird_small.png'));
A = A / 255;
img_size = size(A);
X = reshape(A, img_size(1) * img_size(2), 3);
K = 16; 
max_iters = 10;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

sel = floor(rand(1000, 1) * size(X, 1)) + 1;

palette = hsv(K);
colors = palette(idx(sel), :);


figure;
scatter3(X(sel, 1), X(sel, 2), X(sel, 3), 10, colors);
title('Pixel dataset plotted in 3D. Color shows centroid memberships');

[X_norm, mu, sigma] = featureNormalize(X);


[U, S] = pca(X_norm);
Z = projectData(X_norm, U, 2);

figure;
plotDataPoints(Z(sel, :), idx(sel), K);

title('Pixel dataset plotted in 2D, using PCA for dimensionality reduction');
