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
n = 0;

for N = N_values
    X = mu + sigma * randn(N, 1); 
    
    for b = bins
        figure;
        histogram(X, b, 'Normalization', 'pdf');
        xlabel('x');
        ylabel('f_X(x)');
        %saveas(gcf,num2str(n),'png')
        n = n+1;
    end
end
