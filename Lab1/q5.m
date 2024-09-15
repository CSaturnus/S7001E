N_1 = 100; %Samples
N_2 = 10000; %Samples 2
mu = 5; %Mean
V = 3; %Variance
sigma = sqrt(V); %std


X_1 = mu + sigma * randn(N_1, 1); %Samples with Guassian distribution
mean_X_1 = mean(X_1) % mean
V_1 = var(X_1) % Variance

X_2 = mu + sigma * randn(N_2, 1); %Samples with Guassian distribution
mean_X_2 = mean(X_2)  % mean
V_2 = var(X_2) % Variance

x = linspace(min(X_2), max(X_2), 1000);
y = pdf('Normal',x,mean_X_2,sqrt(V_2));

figure(1);
histogram(X_2, 'Normalization', 'pdf');
hold on
plot(x,y)
hold off

Between_1_2 = find(X_2 >= 1 & X_2 <= 2);
Amount_Between_1_2 = length(Between_1_2);
Fraction_in_point = Amount_Between_1_2 / N_2

erf((2-mu)/sigma)-erf((1-mu)/sigma)