
% Define the number of points
n = 10000;

% Generate X1 and X2
X1 = normrnd(3, sqrt(2), [1, n]);  % Gaussian distribution with mean 3, variance 2
X2 = normrnd(1, 1, [1, n]);        % Gaussian distribution with mean 1, variance 1

% Define the transformation matrix
A = [1/2 3;
     1   1];

% Compute Y1 and Y2
Y = A * [X1; X2];

% Extract Y1 and Y2 from the matrix Y
Y1 = Y(1, :);
Y2 = Y(2, :);

%b)
disp("Mean of X1")
disp(mean(X1));
disp("Mean of X2")
disp(mean(X2));

samplecov = cov(X1,X2);
samplecorr = corrcoef(X1,X2);
disp("Cov of X1 and X2");
disp(samplecov(1,2));
disp("Corr of X1 and X2");
disp(samplecorr(1,2));

%c)
figure(1)
plot(X1,X2,'.')

%d)
disp("Mean of Y1")
disp(mean(Y1));
disp("Mean of Y2")
disp(mean(Y2));

samplecov = cov(Y1,Y2);
samplecorr = corrcoef(Y1,Y2);
disp("Cov of Y1 and Y2");
disp(samplecov(1,2));
disp("Corr of Y1 and Y2");
disp(samplecorr(1,2));

figure(2)
plot(Y1,Y2,'.')