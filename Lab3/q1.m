% Assignment 1:

% Used to dubbel check calculator calculations
R0 = 30; 
R1 = 18;  
R2 = 15;  
R3 = 6;   

A = [R0, R1, R2;
     R1, R0, R1;
     R2, R1, R0];

b = [R1; R2; R3];

coefficients = A\b;

a_0 = coefficients(1);
a_1 = coefficients(2);
a_2 = coefficients(3);

disp("a_0 = " + a_0);
disp("a_1 = " + a_1);
disp("a_2 = " + a_2);

% Assignment 2:

d = [2, 1, 2, 1]; 
L = length(d) - 1; 

N = 1000;

W = sqrt(3) * randn(N + L, 1); 

X = zeros(N, 1);
for n = (L+1):N+L
    X(n-L) = d(1) * W(n) + d(2) * W(n-1) + d(3) * W(n-2) + d(4) * W(n-3);
end

a = [0.5282, 0.3462, -0.2718]; 

X_hat = zeros(N, 1);
for n = 4:N
    X_hat(n) = a(1) * X(n-1) + a(2) * X(n-2) + a(3) * X(n-3);
end

figure;
plot(1:N, X, 'DisplayName', 'Original X[n]');
hold on;
plot(4:N, X_hat(4:N), 'DisplayName', 'Predicted X_hat[n]');
title('Original vs Predicted MA(3) Process');

error_sequence = X(4:N) - X_hat(4:N);
figure;
plot(4:N, error_sequence, 'k');
title('Error Sequence (X[n] - X_hat[n])');