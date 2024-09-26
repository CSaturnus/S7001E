%a)
N = 10000;
mu = 3;   
sigma = 2; 
X = mu + sigma * randn(N,1); 

figure;
histogram(X, 'Normalization', 'pdf');
xlabel('x');
ylabel('f_X(x)');

%b)
N_values = [1000, 10000, 20000]; 
bins = [20, 50, 100]; 

for N = N_values
    X = mu + sigma * randn(N, 1); 
    
    for b = bins
        figure;
        histogram(X, b, 'Normalization', 'pdf');
        title(['Histogram (N = ', num2str(N), ', Bins = ', num2str(b), ')']);
        xlabel('x');
        ylabel('f_X(x)');
    end
end
